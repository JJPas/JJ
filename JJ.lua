local JJ = {}
JJ.Explorer = {}
JJ.DataStore = game:GetService("DataStoreService"):GetDataStore("JJDataStore")
local LuaSyntaxGenerator = require(script.KeywordBlocks)
local ObjectSettings = require(script.ObjectList)
local ObjectProperties = require(script.Properties)

JJ.Objects = {
	"Part", "Model", "Tool", "Sound", "Frame", "TextLabel", "TextButton", "ImageLabel", "ImageButton", 
	"Script", "LocalScript", "RemoteEvent", "RemoteFunction", "Folder", "StringValue", "IntValue", 
	"BoolValue", "NumberValue", "Vector3Value", "CFrameValue", "ObjectValue", "Color3Value", 
	"Animation", "MeshPart", "Decal", "SurfaceGui", "BillboardGui", "ParticleEmitter", 
	"BodyVelocity", "BodyGyro", "BodyPosition", "Weld", "Motor6D", "HingeConstraint", "SpringConstraint", 
	"AlignPosition", "AlignOrientation", "ProximityPrompt", "TouchTransmitter", "TextBox", "TextService", 
	"ImageButton", "UIAspectRatioConstraint", "UIGridLayout", "UIListLayout", "UIPadding", "UISizeConstraint", 
	"UIScale", "ViewportFrame", "TextChatService", "Player", "Workspace", "Lighting", "ReplicatedStorage", 
	"ServerStorage", "ServerScriptService", "StarterPack", "StarterGui", "StarterPlayer", "UserInputService", 
	"Players", "Teams", "HttpService", "TweenService", "RunService", "Debris", "AnimationController", 
	"KeyframeSequence", "ScriptContext", "LocalizationService", "MarketplaceService", "GuiService"
}

JJ.Keywords = {
	"if", "then", "end", "else", "elseif", "for", "while", "repeat", "until", "break", 
	"continue", "function", "local", "return", "nil", "true", "false", "and", "or", 
	"not", "in", "do", "goto", "require", "print", "pairs", "ipairs", "tostring", 
	"tonumber", "math", "string", "table", "os", "coroutine", "userdata", "collectgarbage",
	"setmetatable", "getmetatable", "loadfile", "loadstring", "require", "type"
}

function JJ.Explorer:Initialize()
	self.Frame = Instance.new("Frame")
	self.Frame.Size = UDim2.new(0, 800, 0, 600)
	self.Frame.Position = UDim2.new(0.5, -400, 0.5, -300)
	self.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	self.Frame.Parent = game.Players.LocalPlayer.PlayerGui

	self.List = Instance.new("ScrollingFrame", self.Frame)
	self.List.Size = UDim2.new(0.3, 0, 1, 0)
	self.List.CanvasSize = UDim2.new(0, 0, 2, 0)

	self.SearchBar = Instance.new("TextBox", self.Frame)
	self.SearchBar.Size = UDim2.new(0.3, 0, 0, 30)
	self.SearchBar.Position = UDim2.new(0.3, 0, 0, 0)
	self.SearchBar.PlaceholderText = "Type a keyword..."
	self.SearchBar.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			self:GenerateBlock(self.SearchBar.Text)
		end
	end)

	self.CodeEditor = Instance.new("TextBox", self.Frame)
	self.CodeEditor.Size = UDim2.new(0.7, 0, 1, 0)
	self.CodeEditor.Position = UDim2.new(0.3, 0, 0, 30)
	self.CodeEditor.MultiLine = true
	self.CodeEditor.Text = "-- Write your code here"

	self.Items = {}
	self:LoadItems()
	self:LoadLuaSyntax()
end

function JJ.Explorer:LoadItems()
	for _, objectName in ipairs(JJ.Objects) do
		self:AddObjectItem(objectName)
	end
end

function JJ.Explorer:AddObjectItem(name)
	local itemFrame = Instance.new("Frame")
	itemFrame.Size = UDim2.new(1, 0, 0, 40)
	itemFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	itemFrame.Parent = self.List

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Text = name
	nameLabel.Size = UDim2.new(0.6, 0, 1, 0)
	nameLabel.Parent = itemFrame

	local addButton = Instance.new("TextButton")
	addButton.Text = "Add"
	addButton.Size = UDim2.new(0.3, 0, 1, 0)
	addButton.Position = UDim2.new(0.6, 0, 0, 0)
	addButton.Parent = itemFrame
	addButton.MouseButton1Click:Connect(function()
		self:ShowObjectDetails(name)
	end)

	table.insert(self.Items, name)
end

function JJ.Explorer:ShowObjectDetails(objectName)
	local settings = ObjectSettings:GetSettings(objectName)
	local properties = ObjectProperties:GetProperties(objectName)
	self.CodeEditor.Text = self.CodeEditor.Text .. "\n-- Settings for " .. objectName

	for property, value in pairs(properties) do
		self.CodeEditor.Text = self.CodeEditor.Text .. "\n" .. property .. " = " .. tostring(value)
	end

	self.CodeEditor.Text = self.CodeEditor.Text .. "\n-- Functions:"
	for funcName, func in pairs(settings.functions) do
		self.CodeEditor.Text = self.CodeEditor.Text .. "\n" .. funcName .. " = " .. tostring(func)
	end

	if objectName == "Script" or objectName == "LocalScript" then
		self:LoadLuaSyntax()
	elseif objectName == "Part" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nlocal part = Instance.new('Part')\npart.Parent = workspace"
	elseif objectName == "Model" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nlocal model = Instance.new('Model')\nmodel.Parent = workspace"
	elseif objectName == "Tool" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nlocal tool = Instance.new('Tool')\ntool.Parent = game.Players.LocalPlayer.Backpack"
	elseif objectName == "Sound" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nlocal sound = Instance.new('Sound')\nsound.Parent = workspace"
	elseif objectName == "Frame" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nlocal frame = Instance.new('Frame')\nframe.Parent = game.Players.LocalPlayer.PlayerGui"
	end
end

function JJ.Explorer:LoadLuaSyntax()
	for _, keyword in ipairs(JJ.Keywords) do
		self:AddDummyFunction(keyword)
	end
end

function JJ.Explorer:GenerateBlock(keyword)
	local block = LuaSyntaxGenerator:GenerateBlock(keyword)
	if block then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\n" .. block
	end
end

function JJ.Explorer:AddDummyFunction(name)
	local itemFrame = Instance.new("Frame")
	itemFrame.Size = UDim2.new(1, 0, 0, 40)
	itemFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	itemFrame.Parent = self.List

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Text = name
	nameLabel.Size = UDim2.new(0.6, 0, 1, 0)
	nameLabel.Parent = itemFrame

	local executeButton = Instance.new("TextButton")
	executeButton.Text = "Generate"
	executeButton.Size = UDim2.new(0.3, 0, 1, 0)
	executeButton.Position = UDim2.new(0.6, 0, 0, 0)
	executeButton.Parent = itemFrame
	executeButton.MouseButton1Click:Connect(function()
		self:HandleFunction(name)
	end)

	table.insert(self.Items, name)
end

function JJ.Explorer:HandleFunction(funcName)
	if funcName == "collectgarbage" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\ncollectgarbage()"
	elseif funcName == "print" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nprint('Hello World')"
	elseif funcName == "tostring" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nlocal str = tostring(variable)"
	elseif funcName == "tonumber" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nlocal num = tonumber(string)"
	elseif funcName == "pairs" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nfor key, value in pairs(table) do\n    print(key, value)\nend"
	elseif funcName == "ipairs" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nfor index, value in ipairs(table) do\n    print(index, value)\nend"
	elseif funcName == "setmetatable" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nsetmetatable(table, metaTable)"
	elseif funcName == "getmetatable" then
		self.CodeEditor.Text = self.CodeEditor.Text .. "\nlocal meta = getmetatable(table)"
	end
end

function JJ.Explorer:FilterItems(query)
	for _, itemFrame in ipairs(self.List:GetChildren()) do
		if itemFrame:IsA("Frame") and itemFrame:FindFirstChild("TextLabel") then
			itemFrame.Visible = itemFrame.TextLabel.Text:lower():find(query:lower()) ~= nil
		end
	end
end

function JJ:Start()
	self.Explorer:Initialize()
end

JJ:Start()
