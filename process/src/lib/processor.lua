-- Add new todo
function addTodoProcessor(msg)
    local data = json.decode(msg.Data)
    addTodo(data)
    sendReply(msg, data)
end

-- Get all todos
function getTodosProcessor(msg)
    local data = getTodos()
    print(data)
    sendReply(msg, data)
end

-- Update todo
function updateTodoProcessor(msg)
    local data = json.decode(msg.Data)
    updateTodo(data)
    sendReply(msg, data)
end

-- Delete todo
function deleteTodoProcessor(msg)
    local data = json.decode(msg.Data)
    deleteTodo(data.id)
    sendReply(msg, {success = true})
end