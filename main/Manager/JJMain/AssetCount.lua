local AssetCounter = {}

function AssetCounter:CountAssets(parent)
	local assetCounts = {
		ScreenGuis = 0,
		Frames = 0,
		TextButtons = 0,
		TextLabels = 0,
		ImageLabels = 0,
		ImageButtons = 0,
		TextBoxes = 0,
		ScrollingFrames = 0,
	}

	for _, child in ipairs(parent:GetChildren()) do
		if assetCounts[child.ClassName] then
			assetCounts[child.ClassName] = assetCounts[child.ClassName] + 1
		end
		
		local childCounts = self:CountAssets(child)
		for key, count in pairs(childCounts) do
			assetCounts[key] = assetCounts[key] + count
		end
	end

	return assetCounts
end

return AssetCounter
