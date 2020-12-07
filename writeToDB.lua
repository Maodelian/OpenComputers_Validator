local event = require("event")
local filesystem = require("filesystem")
local component = require("component")
local data = component.data

local dataBase = filesystem.open("/home/database.db", "ab")

local function writeRow(str)
	dataBase:write(str)
end

while true do
	local _, address, componentType = event.pull("component_added")
	if componentType == "filesystem" then
		writeRow(data.sha256(address))
		print("Wrote new Floppy New Disk")
		break
	end
end

dataBase:close()