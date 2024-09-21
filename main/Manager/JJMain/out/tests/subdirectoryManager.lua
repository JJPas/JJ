local SubdirectoryManager = {}

function SubdirectoryManager:AddSubdirectory(parent, name)
	local subfolder = Instance.new("Folder")
	subfolder.Name = name
	subfolder.Parent = parent
	return subfolder
end

function SubdirectoryManager:GetSubdirectories(parent)
	local subdirectories = {}
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA("Folder") then
			table.insert(subdirectories, child)
		end
	end
	return subdirectories
end

function SubdirectoryManager:RemoveSubdirectory(parent, name)
	local subfolder = parent:FindFirstChild(name)
	if subfolder then
		subfolder:Destroy()
	end
end

function SubdirectoryManager:GetSubdirectoryByName(parent, name)
	return parent:FindFirstChild(name)
end

function SubdirectoryManager:ListSubdirectories(parent)
	local subdirectories = self:GetSubdirectories(parent)
	for _, subdir in ipairs(subdirectories) do
		print("Subdirectory: " .. subdir.Name)
	end
end

return SubdirectoryManager
