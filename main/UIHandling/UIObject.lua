local UIObjects = {}

UIObjects.UIElements = {
	"ScreenGui", "Frame", "TextLabel", "TextButton", "ImageLabel", "ImageButton",
	"TextBox", "ScrollingFrame", "UIListLayout", "UIGridLayout", "UIPadding",
	"UISizeConstraint", "UIAspectRatioConstraint", "ViewportFrame", "ParticleEmitter",
	"SurfaceGui", "BillboardGui", "Frame", "ImageLabel", "TextService"
}

function UIObjects:GetUIElements()
	return self.UIElements
end

function UIObjects:SendToClient(player)
	local uiElements = self:GetUIElements()
	for _, uiElement in ipairs(uiElements) do
		local remoteEvent = Instance.new("RemoteEvent")
		remoteEvent.Name = "SendUIObject"
		remoteEvent.Parent = player

		remoteEvent:FireClient(player, uiElement)
	end
end

return UIObjects
