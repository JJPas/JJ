local JJExecution = {}

function JJExecution:CreateUIElements(parent)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.2, 0, 0.1, 0)
	button.Position = UDim2.new(0.4, 0, 0.45, 0)
	button.Text = "TIR"
	button.Parent = parent

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.3, 0, 0.1, 0)
	label.Position = UDim2.new(0.35, 0, 0.3, 0)
	label.Text = "Welcome to JJ"
	label.BackgroundTransparency = 1
	label.Parent = parent

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0.5, 0, 0.5, 0)
	frame.Position = UDim2.new(0.25, 0, 0.25, 0)
	frame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	frame.Parent = parent
end

function JJExecution:InsertObject(parent, objectType, properties)
	local newObject = Instance.new(objectType)
	for prop, value in pairs(properties) do
		newObject[prop] = value
	end
	newObject.Parent = parent
	return newObject
end

function JJExecution:ExecuteJJUI()
	local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local jjGui = Instance.new("ScreenGui")
	jjGui.Name = "JJ_GUI"
	jjGui.Parent = playerGui

	self:CreateUIElements(jjGui)
	
	-- TODO: dynamic
	self:InsertObject(jjGui, "TextButton", {
		Text = "Dynamic Button",
		Size = UDim2.new(0.2, 0, 0.1, 0),
		Position = UDim2.new(0.4, 0, 0.6, 0)
	})
end
