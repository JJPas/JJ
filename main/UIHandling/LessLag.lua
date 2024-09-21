local UILagManager = {}
UILagManager.UIElements = {}
UILagManager.UpdateQueue = {}
UILagManager.IsUpdating = false

function UILagManager:RegisterUIElement(name, element)
	if not self.UIElements[name] then
		self.UIElements[name] = element
	end
end

function UILagManager:UnregisterUIElement(name)
	if self.UIElements[name] then
		self.UIElements[name]:Destroy()
		self.UIElements[name] = nil
	end
end

function UILagManager:QueueUpdate(name, properties)
	self.UpdateQueue[name] = properties
	if not self.IsUpdating then
		self:ProcessQueue()
	end
end

function UILagManager:ProcessQueue()
	self.IsUpdating = true

	for name, properties in pairs(self.UpdateQueue) do
		local element = self.UIElements[name]
		if element then
			for prop, value in pairs(properties) do
				element[prop] = value
			end
		end
	end

	self.UpdateQueue = {}
	self.IsUpdating = false
end

function UILagManager:Clear()
	for name, element in pairs(self.UIElements) do
		element:Destroy()
		self.UIElements[name] = nil
	end
end

return UILagManager
