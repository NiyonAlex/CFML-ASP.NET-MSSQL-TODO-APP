<cfloop array="#tasks#" index="task">
    <div class="task-item">
        <span class="<cfif task.isCompleted>completed<cfelse>pending</cfif>">
            #task.taskDescription#
        </span>

        <!-- Buttons to mark complete or delete -->
        <div class="actions">
            <form action="/tasks/update" method="POST">
                <input type="hidden" name="taskId" value="#task.taskId#">
                <input type="hidden" name="isCompleted" value="<cfif task.isCompleted>false<cfelse>true</cfif>">
                <button type="submit">Complete</button>
            </form>

            <form action="/tasks/delete" method="POST">
                <input type="hidden" name="taskId" value="#task.taskId#">
                <button type="submit">Delete</button>
            </form>
        </div>
    </div>
</cfloop>
