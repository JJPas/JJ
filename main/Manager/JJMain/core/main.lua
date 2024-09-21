local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")

local JJ = Instance.new("ScreenGui")
JJ.Name = "JJExplorer"
JJ.Parent = StarterGui

local ExplorerFrame = Instance.new("Frame")
ExplorerFrame.Size = UDim2.new(0.25, 0, 1, 0)
ExplorerFrame.Position = UDim2.new(0, 0, 0, 0)
ExplorerFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ExplorerFrame.Parent = JJ

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.Text = "JJ Explorer"
TitleLabel.Parent = ExplorerFrame

local ObjectList = Instance.new("Frame")
ObjectList.Size = UDim2.new(1, 0, 1, -50)
ObjectList.Position = UDim2.new(0, 0, 0, 50)
ObjectList.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ObjectList.Parent = ExplorerFrame

local function CreateObjectEntry(object)
	local Entry = Instance.new("TextButton")
	Entry.Size = UDim2.new(1, 0, 0, 30)
	Entry.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Entry.TextColor3 = Color3.new(1, 1, 1)
	Entry.Text = object.Name
	Entry.Parent = ObjectList

	Entry.MouseButton1Click:Connect(function()
		print("Selected: " .. object.Name)
	end)
end

local function PopulateObjectList(parent)
	for _, child in ipairs(parent:GetChildren()) do
		CreateObjectEntry(child)
		if child:IsA("Folder") or child:IsA("Model") then
			PopulateObjectList(child)
		end
	end
end

PopulateObjectList(Workspace)

local function RefreshExplorer()
	for _, child in ipairs(ObjectList:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
	PopulateObjectList(Workspace)
end

local RefreshButton = Instance.new("TextButton")
RefreshButton.Size = UDim2.new(0.25, 0, 0, 50)
RefreshButton.Position = UDim2.new(0.75, 0, 0, 0)
RefreshButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
RefreshButton.TextColor3 = Color3.new(1, 1, 1)
RefreshButton.Text = "Refresh"
RefreshButton.Parent = ExplorerFrame

RefreshButton.MouseButton1Click:Connect(RefreshExplorer)

print("JJ Explorer initialized.")
