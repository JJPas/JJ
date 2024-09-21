local ObjectProperties = {}

ObjectProperties.Properties = {
	Part = {
		Size = Vector3.new(4, 1, 2),
		Position = Vector3.new(0, 0, 0),
		Anchored = true,
		Color = Color3.new(1, 0, 0),
		Transparency = 0,
		Reflectance = 0,
		CanCollide = true,
		Material = Enum.Material.SmoothPlastic,
		SurfaceType = Enum.SurfaceType.Smooth
	},
	Model = {
		PrimaryPart = nil,
		Name = "NewModel",
		Position = Vector3.new(0, 0, 0)
	},
	Tool = {
		Grip = CFrame.new(0, 0, 0),
		CanBeDropped = true,
		Name = "NewTool"
	},
	Sound = {
		Volume = 1,
		Pitch = 1,
		Looped = false,
		Name = "NewSound"
	},
	Frame = {
		Size = UDim2.new(0, 200, 0, 100),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.new(1, 1, 1),
		Name = "NewFrame"
	},
	TextLabel = {
		Size = UDim2.new(0, 200, 0, 50),
		Position = UDim2.new(0, 0, 0, 0),
		Text = "New Label",
		TextColor3 = Color3.new(0, 0, 0)
	},
	TextButton = {
		Size = UDim2.new(0, 200, 0, 50),
		Position = UDim2.new(0, 0, 0, 0),
		Text = "Button",
		BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	},
	ImageLabel = {
		Size = UDim2.new(0, 100, 0, 100),
		Position = UDim2.new(0, 0, 0, 0),
		Image = "rbxassetid://0"
	},
	ImageButton = {
		Size = UDim2.new(0, 100, 0, 100),
		Position = UDim2.new(0, 0, 0, 0),
		Image = "rbxassetid://0"
	},
}

function ObjectProperties:GetProperties(objectName)
	return self.Properties[objectName] or {}
end

return ObjectProperties
