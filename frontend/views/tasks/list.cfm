<cfoutput>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Is Completed</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <cfloop array="#tasks#" index="task">
            <tr>
                <td>#task.taskId#</td>
                <td>#task.taskDescription#</td>
                <td>#task.isCompleted#</td>
                <td>
                    <a href="?action=tasks.edit&id=#task.taskId#">Edit</a> | 
                    <a href="?action=tasks.delete&id=#task.taskId#">Delete</a>
                </td>
            </tr>
        </cfloop>
    </tbody>
</table>
<a href="?action=tasks.add">Add Task</a>
</cfoutput>
    