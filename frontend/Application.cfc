<cfcomponent>

    <cfset this.name = "TodoApp">
    <cfset this.mappings = {"/assets" = "./assets"}>

    <!--- Setup for the controller folder --->
    <cfset this.controllersFolder = expandPath("/controllers")>

    <cfset this.viewFolder = expandPath("/views")>

    <!--- Application initialization --->
    <cffunction name="onApplicationStart" returntype="boolean">
        <!--- Initialize the application --->
        return true;
    </cffunction>

    <cffunction name="onRequestStart" returntype="boolean">
        <!--- Set paths for views and controllers --->
        if (findNoCase("controller", cgi.script_name)) {
            // We're accessing a controller, so we'll make sure we're in the right scope
            include(expandPath("/controllers/" & CGI.SCRIPT_NAME));
            return false;
        }
        return true;
    </cffunction>

</cfcomponent>
