using Microsoft.EntityFrameworkCore;
using Backend.Models;

namespace Backend.Data
{
    public class TodoContext : DbContext
    {
        public TodoContext(DbContextOptions<TodoContext> options) : base(options) { }

        public DbSet<Models.Task> Tasks { get; set; }
    }
}
