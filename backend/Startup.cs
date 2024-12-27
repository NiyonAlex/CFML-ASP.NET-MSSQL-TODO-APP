using Backend.Data;
using Microsoft.EntityFrameworkCore;

namespace MyProject
{
    public class Startup
    {
        // Constructor to inject IConfiguration (appsettings.json)
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method is called by the runtime to configure services
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<TodoContext>(options =>
            options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));
            services.AddControllers();
        }

        // This method is called by the runtime to configure the HTTP request pipeline
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            // Setup HTTPS redirection
            app.UseHttpsRedirection();

            // Enable CORS if needed
            app.UseCors();

            // Enable static file serving (if needed)
            app.UseStaticFiles();

            // Routing for controllers (important for Web API)
            app.UseRouting();

            // Setup authentication & authorization middleware if needed
            // app.UseAuthentication();
            // app.UseAuthorization();

            // Map endpoints (controllers, etc.)
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers(); // For API controllers
                // Or: endpoints.MapRazorPages(); for Razor Pages
                // Or: endpoints.MapDefaultControllerRoute(); for MVC
            });
        }
    }
}
