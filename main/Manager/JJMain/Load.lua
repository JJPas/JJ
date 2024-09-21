local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local JJ = Instance.new("ScreenGui")
JJ.Name = "JJ_GUI"
JJ.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local function loadAssets()
	local assets = {
		ScreenGui = "DefaultImage",
		Frame = "DefaultImage",
		TextButton = "DefaultImage",
		TextLabel = "DefaultImage",
		ImageLabel = "DefaultImage",
		ImageButton = "DefaultImage",
		TextBox = "DefaultTemplate"
	}

	for objectType, assetName in pairs(assets) do
		local asset = Instance.new(objectType)
		if assetName ~= "DefaultImage" then
			asset.Image = assetName 
		end
		asset.Parent = JJ
	end
end

local function initializeJJ()
	loadAssets()

	local mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainFrame"
	mainFrame.Size = UDim2.new(1, 0, 1, 0)
	mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	mainFrame.Parent = JJ

	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.2, 0, 0.1, 0)
	button.Position = UDim2.new(0.4, 0, 0.45, 0)
	button.Text = "Click Me"
	button.Parent = mainFrame
end

initializeJJ()
