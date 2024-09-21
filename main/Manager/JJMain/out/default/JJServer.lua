local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local JJEvents = Instance.new("Folder")
JJEvents.Name = "JJ_Events"
JJEvents.Parent = ReplicatedStorage

local function onPlayerAdded(player)
	local playerData = Instance.new("Folder")
	playerData.Name = player.Name
	playerData.Parent = player
	local remote = Instance.new("RemoteEvent")
	remote.Name = "JJ_Remote"
	remote.Parent = JJEvents
	remote.OnServerEvent:Connect(function(player, message)
		print("Received from " .. player.Name .. ": " .. message)
		remote:FireClient(player, "Response from server: " .. message)
	end)
end

local function onPlayerRemoving(player)
	local playerData = player:FindFirstChild(player.Name)
	if playerData then
		playerData:Destroy()
	end
end

local function setupServer()
	Players.PlayerAdded:Connect(onPlayerAdded)
	Players.PlayerRemoving:Connect(onPlayerRemoving)
end

setupServer()
