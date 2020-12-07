local event = require("event")
local filesystem = require("filesystem")
local os = require("os")
local component = require("component")
local data = component.data
local redstone = component.redstone

local dataBase = filesystem.open("/home/database.db", "rb")

function findInDatabase(str)
	dataBase:seek("set", 0)
	while true do
		local buffer = dataBase:read(32)
		if buffer == str then
			return true
		elseif buffer == nil then
			break
		end
	end
	return false
end

while true do
	local _, address, componentType = event.pull("component_added")
	if componentType == "filesystem" then
		if findInDatabase(data.sha256(address)) then
			redstone.setOutput(1, 15)
			os.sleep(3)
			redstone.setOutput(1, 0)
		end
	end
end