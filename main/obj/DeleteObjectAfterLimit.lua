local ObjectDeletionManager = {}

ObjectDeletionManager.ObjectLimits = {
	MaxUIElements = 50,
	MaxParticles = 100,
	MaxSounds = 30,
	MaxFrames = 20,
}

ObjectDeletionManager.CurrentCounts = {
	UIElements = {},
	Particles = {},
	Sounds = {},
	Frames = {},
}

function ObjectDeletionManager:AddObject(objectType, object)
	if objectType == "UIElement" then
		table.insert(self.CurrentCounts.UIElements, object)
		if #self.CurrentCounts.UIElements > self.ObjectLimits.MaxUIElements then
			self:DeleteOldest("UIElements")
		end
	elseif objectType == "Particle" then
		table.insert(self.CurrentCounts.Particles, object)
		if #self.CurrentCounts.Particles > self.ObjectLimits.MaxParticles then
			self:DeleteOldest("Particles")
		end
	elseif objectType == "Sound" then
		table.insert(self.CurrentCounts.Sounds, object)
		if #self.CurrentCounts.Sounds > self.ObjectLimits.MaxSounds then
			self:DeleteOldest("Sounds")
		end
	elseif objectType == "Frame" then
		table.insert(self.CurrentCounts.Frames, object)
		if #self.CurrentCounts.Frames > self.ObjectLimits.MaxFrames then
			self:DeleteOldest("Frames")
		end
	end
end

function ObjectDeletionManager:DeleteOldest(objectType)
	local oldestObject = table.remove(self.CurrentCounts[objectType], 1)
	if oldestObject then
		oldestObject:Destroy()
	end
end

return ObjectDeletionManager
