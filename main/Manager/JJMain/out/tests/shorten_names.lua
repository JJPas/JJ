local NameShortener = {}

local abbreviations = {
	["Part"] = "P",
	["Script"] = "S",
	["LocalScript"] = "LS",
	["Folder"] = "F",
	["Model"] = "M",
	["RemoteEvent"] = "RE",
	["RemoteFunction"] = "RF",
}

function NameShortener:ShortenName(object)
	if object and object:IsA("Instance") then
		local baseName = object.ClassName
		local shortName = abbreviations[baseName] or baseName
		return shortName .. "_" .. object.Name
	end
	return nil
end

function NameShortener:ShortenNamesInFolder(folder)
	if folder and folder:IsA("Folder") then
		for _, child in ipairs(folder:GetChildren()) do
			local shortenedName = self:ShortenName(child)
			if shortenedName then
				child.Name = shortenedName
			end
		end
	end
end

return NameShortener
