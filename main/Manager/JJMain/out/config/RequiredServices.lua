local RequiredServices = {}

function RequiredServices:GetPlayers()
	return game:GetService("Players")
end

function RequiredServices:GetReplicatedStorage()
	return game:GetService("ReplicatedStorage")
end

function RequiredServices:GetWorkspace()
	return game:GetService("Workspace")
end

function RequiredServices:GetRunService()
	return game:GetService("RunService")
end

function RequiredServices:GetTweenService()
	return game:GetService("TweenService")
end

function RequiredServices:GetUserInputService()
	return game:GetService("UserInputService")
end

function RequiredServices:GetStarterGui()
	return game:GetService("StarterGui")
end

function RequiredServices:GetStarterPack()
	return game:GetService("StarterPack")
end

function RequiredServices:GetServerStorage()
	return game:GetService("ServerStorage")
end

return RequiredServices
