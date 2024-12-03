local function readFile(path)
    local file = assert(io.open(path, "r"))
    local content = file:read("*all")
    file:close()
    return content
end

local function writeFile(path, content)
    local file = assert(io.open(path, "w"))
    file:write(content)
    file:close()
end

local filePath = "process/build/output.lua"
local content = readFile(filePath)

-- Replace the specific line
local newContent = string.gsub(
    content,
    "DbAdmin = require%('DbAdmin'%)%.new%(DB%)",
    "DbAdmin = dbAdmin.new(DB)"
)

writeFile(filePath, newContent)
print("Replacement complete in " .. filePath) 