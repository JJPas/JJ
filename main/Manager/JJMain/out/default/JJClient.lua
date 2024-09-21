local JJ = {}
JJ.UI = {}
JJ.Events = Instance.new("Folder")
JJ.Events.Name = "JJ_Events"
JJ.Events.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local function initializeUI()
	local gui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	gui.Name = "JJ_GUI"
	JJ.UI.MainFrame = Instance.new("Frame", gui)
	JJ.UI.MainFrame.Size = UDim2.new(1, 0, 1, 0)
	JJ.UI.MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	JJ.UI.MainFrame.Visible = true
	JJ.UI.Button = Instance.new("TextButton", JJ.UI.MainFrame)
	JJ.UI.Button.Size = UDim2.new(0, 200, 0, 50)
	JJ.UI.Button.Position = UDim2.new(0.5, -100, 0.5, -25)
	JJ.UI.Button.Text = "Execute"
	JJ.UI.Button.MouseButton1Click:Connect(function()
		print("Button clicked")
		JJ:ExecuteAction()
	end)
end
function JJ:ExecuteAction()
	local function createLabel()
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(0, 300, 0, 50)
		label.Position = UDim2.new(math.random(), 0, math.random(), 0)
		label.Text = "Random Label"
		label.Parent = JJ.UI.MainFrame
		label.BackgroundTransparency = 1
	end
	for i = 1, 10 do
		wait(0.5)
		createLabel()
	end
end
function JJ:ConnectEvents()
	local remote = Instance.new("RemoteEvent")
	remote.Name = "JJ_Remote"
	remote.Parent = JJ.Events
	remote.OnClientEvent:Connect(function(message)
		print("Message from server: " .. message)
	end)
end
function JJ:Setup()
	initializeUI()
	self:ConnectEvents()
end
JJ:Setup()
