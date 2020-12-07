local term = require("term")
local shell = require("shell")
local internet = require("internet")
local filesystem = require("filesystem")

print("Installing Validator...")

local function downloadFile(filename, url)
	local file = filesystem.open(filename, "wb")
	local request = internet.request(url)
	for buffer in request do
		file:write(buffer)
	end
	file:close()
end

print("Downloading /home/validator.lua")
downloadFile("/home/validator.lua", "https://raw.githubusercontent.com/Maodelian/OpenComputers_Validator/main/validator.lua")
print("Downloading /home/writeToDB.lua")
downloadFile("/home/writeToDB.lua", "https://raw.githubusercontent.com/Maodelian/OpenComputers_Validator/main/writeToDB.lua")
print("Done!")
