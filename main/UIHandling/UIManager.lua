local UIManager = {}
UIManager.UIFrame = nil

function UIManager:Initialize(parent)
	self.UIFrame = Instance.new("Frame")
	self.UIFrame.Size = UDim2.new(1, 0, 1, 0)
	self.UIFrame.BackgroundTransparency = 1
	self.UIFrame.Parent = parent
end

function UIManager:CreateUIElement(elementType, properties)
	local uiElement = Instance.new(elementType)
	uiElement.Parent = self.UIFrame

	for prop, value in pairs(properties) do
		uiElement[prop] = value
	end

	return uiElement
end

function UIManager:ClearUI()
	for _, child in ipairs(self.UIFrame:GetChildren()) do
		child:Destroy()
	end
end

function UIManager:GetUIFrame()
	return self.UIFrame
end

return UIManager
