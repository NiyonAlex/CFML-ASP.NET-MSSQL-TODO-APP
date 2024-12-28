<cfcomponent>
    <cffunction name="list" access="public" returntype="string" output="false">
        <cfset taskModel = CreateObject("component", "models.Task")>
        <cfset tasks = taskModel.getAll()>
        <cfreturn FileRead("views/tasks/list.cfm")>
    </cffunction>

    <cffunction name="add" access="public" returntype="string" output="false">
        <cfset task = { taskId = "", taskDescription = "", isCompleted = false }>
        <cfreturn FileRead("views/tasks/form.cfm")>
    </cffunction>

    <cffunction name="edit" access="public" returntype="string" output="false">
        <cfset taskModel = CreateObject("component", "models.Task")>
        <cfset task = taskModel.getById(url.id)>
        <cfreturn FileRead("views/tasks/form.cfm")>
    </cffunction>

    <cffunction name="save" access="public" returntype="void" output="false">
        <cfset taskModel = CreateObject("component", "models.Task")>
        <cfif form.taskId EQ "">
            <cfset taskModel.add(form)>
        <cfelse>
            <cfset taskModel.update(form)>
        </cfif>
        <cfheader statusCode="302" statusText="Redirect">
        <cfheader name="Location" value="index.cfm?action=tasks.list">
        <cfabort>
    </cffunction>

    <cffunction name="delete" access="public" returntype="void" output="false">
        <cfset taskModel = CreateObject("component", "models.Task")>
        <cfset taskModel.delete(url.id)>
        <cfheader statusCode="302" statusText="Redirect">
        <cfheader name="Location" value="index.cfm?action=tasks.list">
        <cfabort>
    </cffunction>
</cfcomponent>
