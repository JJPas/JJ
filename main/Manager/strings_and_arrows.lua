local StringAndArrowCreator = {}

function StringAndArrowCreator:CreateTextLabel(parent, text, position, size)
	local textLabel = Instance.new("TextLabel")
	textLabel.Text = text
	textLabel.Position = position
	textLabel.Size = size
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.TextSize = 24
	textLabel.Parent = parent
	return textLabel
end

function StringAndArrowCreator:CreateArrow(parent, startPosition, endPosition, color, thickness)
	local arrow = Instance.new("Frame")
	arrow.Size = UDim2.new(thickness, 0, (endPosition.Y - startPosition.Y), 0)
	arrow.Position = UDim2.new(0, startPosition.X, 0, startPosition.Y)
	arrow.BackgroundColor3 = color
	arrow.AnchorPoint = Vector2.new(0, 0)
	arrow.Parent = parent

	local arrowhead = Instance.new("Frame")
	arrowhead.Size = UDim2.new(0, thickness * 2, 0, thickness * 2)
	arrowhead.Position = UDim2.new(0, endPosition.X - (thickness), 0, endPosition.Y - (thickness))
	arrowhead.BackgroundColor3 = color
	arrowhead.AnchorPoint = Vector2.new(0.5, 0.5)
	arrowhead.Rotation = math.deg(math.atan2(endPosition.Y - startPosition.Y, endPosition.X - startPosition.X)) + 90
	arrowhead.Parent = parent

	return arrow, arrowhead
end
