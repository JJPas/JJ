local ObjectAssets = {}

ObjectAssets.Assets = {
	ScreenGui = {
		Image = "DefaultImage",
		Sound = "DefaultSound",
		Template = "DefaultTemplate"
	},
	Frame = {
		Image = "DefaultImage",
		Template = "DefaultTemplate"
	},
	TextButton = {
		Image = "DefaultImage",
		Sound = "DefaultSound"
	},
	TextLabel = {
		Image = "DefaultImage"
	},
	ImageLabel = {
		Image = "DefaultImage"
	},
	ImageButton = {
		Image = "DefaultImage",
		Sound = "DefaultSound"
	},
	TextBox = {
		Template = "DefaultTemplate"
	},
	ScrollingFrame = {
		Image = "DefaultImage"
	},
}

function ObjectAssets:GetAssets(objectType)
	return self.Assets[objectType] or {}
end

return ObjectAssets
