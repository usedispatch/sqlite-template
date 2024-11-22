local sqlite3 = require("lsqlite3")
local json = require("json")
DB = DB or sqlite3.open_memory()
DbAdmin = require('@rakis/DbAdmin').new(DB)

function Configure()
    -- Create Todo table with basic fields
    DbAdmin:exec[[
    CREATE TABLE Todos (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        completed BOOLEAN DEFAULT 0,
    );
    ]]

    Configured = true
end

if not Configured then Configure() end