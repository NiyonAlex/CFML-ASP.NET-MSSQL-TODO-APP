<cfoutput>
    <form method="post" action="?action=tasks.save">
        <input type="hidden" name="taskId" value="#task.taskId#">
        <label for="taskDescription">Description:</label>
        <input type="text" name="taskDescription" value="#task.taskDescription#">
        <label for="isCompleted">Completed:</label>
        <input type="checkbox" name="isCompleted" value="1" <cfif task.isCompleted>checked</cfif>>
        <button type="submit">Save</button>
    </form>
</cfoutput>
    