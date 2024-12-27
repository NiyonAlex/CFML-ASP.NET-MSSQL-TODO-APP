<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List</title>
    <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Todo List</h1>

        <!-- Form to Add Task -->
        <div class="add-task">
            <form action="/tasks/add" method="POST">
                <input type="text" name="taskDescription" placeholder="Add a new task..." required />
                <button type="submit">Add Task</button>
            </form>
        </div>

        <!-- Display Tasks -->
        <div class="task-list">
            <cfinclude template="tasks.cfm">
        </div>
    </div>
</body>
</html>
