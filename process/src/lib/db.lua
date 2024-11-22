function addTodo(data)
    DbAdmin:apply(
        'INSERT INTO Todos (id, title, completed) VALUES (?, ?, ?)',
        {
            data.id,
            data.title,
            data.completed or false
        }
    )
end

-- Get all todos
function getTodos()
    local results = DbAdmin:exec("SELECT * FROM Todos;")
    return json.encode(results)
end

-- Update todo
function updateTodo(data)
    DbAdmin:apply(
        'UPDATE Todos SET title = ?, completed = ? WHERE id = ?',
        {
            data.title,
            data.completed,
            data.id
        }
    )
end

-- Delete todo
function deleteTodo(id)
    DbAdmin:apply('DELETE FROM Todos WHERE id = ?', {id})
end