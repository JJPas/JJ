local ObjectLimits = {}

ObjectLimits.Limits = {
	MaxUIElements = 50,
	MaxParticles = 100,
	MaxSounds = 30,
	MaxFrames = 20,
}

ObjectLimits.CurrentCounts = {
	UIElements = 0,
	Particles = 0,
	Sounds = 0,
	Frames = 0,
}

function ObjectLimits:CanCreateUIElement()
	return self.CurrentCounts.UIElements < self.Limits.MaxUIElements
end

function ObjectLimits:CanCreateParticle()
	return self.CurrentCounts.Particles < self.Limits.MaxParticles
end

function ObjectLimits:CanCreateSound()
	return self.CurrentCounts.Sounds < self.Limits.MaxSounds
end

function ObjectLimits:CanCreateFrame()
	return self.CurrentCounts.Frames < self.Limits.MaxFrames
end

function ObjectLimits:IncrementUIElement()
	if self:CanCreateUIElement() then
		self.CurrentCounts.UIElements = self.CurrentCounts.UIElements + 1
		return true
	end
	return false
end

function ObjectLimits:IncrementParticle()
	if self:CanCreateParticle() then
		self.CurrentCounts.Particles = self.CurrentCounts.Particles + 1
		return true
	end
	return false
end

function ObjectLimits:IncrementSound()
	if self:CanCreateSound() then
		self.CurrentCounts.Sounds = self.CurrentCounts.Sounds + 1
		return true
	end
	return false
end

function ObjectLimits:IncrementFrame()
	if self:CanCreateFrame() then
		self.CurrentCounts.Frames = self.CurrentCounts.Frames + 1
		return true
	end
	return false
end

function ObjectLimits:DecrementUIElement()
	if self.CurrentCounts.UIElements > 0 then
		self.CurrentCounts.UIElements = self.CurrentCounts.UIElements - 1
	end
end

function ObjectLimits:DecrementParticle()
	if self.CurrentCounts.Particles > 0 then
		self.CurrentCounts.Particles = self.CurrentCounts.Particles - 1
	end
end

function ObjectLimits:DecrementSound()
	if self.CurrentCounts.Sounds > 0 then
		self.CurrentCounts.Sounds = self.CurrentCounts.Sounds - 1
	end
end

function ObjectLimits:DecrementFrame()
	if self.CurrentCounts.Frames > 0 then
		self.CurrentCounts.Frames = self.CurrentCounts.Frames - 1
	end
end

return ObjectLimits
