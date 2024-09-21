local RootServices = {}

function RootServices:GetPlayers()
	return game:GetService("Players")
end

function RootServices:GetReplicatedStorage()
	return game:GetService("ReplicatedStorage")
end

function RootServices:GetWorkspace()
	return game:GetService("Workspace")
end

function RootServices:GetServerScriptService()
	return game:GetService("ServerScriptService")
end

function RootServices:GetServerStorage()
	return game:GetService("ServerStorage")
end

function RootServices:GetTweenService()
	return game:GetService("TweenService")
end

function RootServices:GetRunService()
	return game:GetService("RunService")
end

function RootServices:GetUserInputService()
	return game:GetService("UserInputService")
end

function RootServices:GetStarterGui()
	return game:GetService("StarterGui")
end

function RootServices:GetStarterPack()
	return game:GetService("StarterPack")
end

return RootServices
