local ObjectDirectories = {}

function ObjectDirectories:FindDirectories(parent)
	local directories = {}
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA("Folder") or child:IsA("Model") then
			table.insert(directories, child)
			local subDirectories = self:FindDirectories(child)
			for _, subDir in ipairs(subDirectories) do
				table.insert(directories, subDir)
			end
		end
	end
	return directories
end

function ObjectDirectories:GetAllDirectories(root)
	if root and root:IsA("Instance") then
		return self:FindDirectories(root)
	end
	return {}
end

return ObjectDirectories
