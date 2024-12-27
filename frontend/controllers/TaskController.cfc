<cfcomponent>

    <!--- Action to fetch tasks from the API --->
    <cffunction name="index" access="public" returntype="void">
        <!--- Call API to fetch tasks --->
        <cfhttp url="https://localhost:5001/api/tasks" method="GET" result="httpResponse">
            <cfset tasks = deserializeJson(httpResponse.filecontent)>

        <!--- Pass tasks to the view --->
        <cfset renderView("tasks", {tasks = tasks})>
    </cffunction>

    <!--- Action to add a task --->
    <cffunction name="add" access="public" returntype="void">
        <cfargument name="taskDescription" type="string" required="true">

        <!--- Call API to add a task --->
        <cfhttp url="https://localhost:5001/api/tasks" method="POST" result="httpResponse">
            <cfset taskData = {
                "taskDescription" = arguments.taskDescription,
                "isCompleted" = false
            }>
            <cfset cfhttp.filecontent = serializeJson(taskData)>

        <!--- Redirect to index after adding the task --->
        <cfset location("/tasks")>
    </cffunction>

    <!--- Action to delete a task --->
    <cffunction name="delete" access="public" returntype="void">
        <cfargument name="taskId" type="numeric" required="true">

        <!--- Call API to delete the task --->
        <cfhttp url="https://localhost:5001/api/tasks/#arguments.taskId#" method="DELETE" result="httpResponse">
        
        <!--- Redirect to index after deleting the task --->
        <cfset location("/tasks")>
    </cffunction>

    <!--- Action to update a task --->
    <cffunction name="update" access="public" returntype="void">
        <cfargument name="taskId" type="numeric" required="true">
        <cfargument name="isCompleted" type="boolean" required="true">

        <!--- Call API to update task completion status --->
        <cfhttp url="https://localhost:5001/api/tasks/#arguments.taskId#" method="PUT" result="httpResponse">
            <cfset taskData = {
                "taskId" = arguments.taskId,
                "isCompleted" = arguments.isCompleted
            }>
            <cfset cfhttp.filecontent = serializeJson(taskData)>
        
        <!--- Redirect to index after updating the task --->
        <cfset location("/tasks")>
    </cffunction>

</cfcomponent>
