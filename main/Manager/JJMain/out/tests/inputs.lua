local DirectoryManager = {}

function DirectoryManager:AddDirectory(parent, name)
	local folder = Instance.new("Folder")
	folder.Name = name
	folder.Parent = parent
	return folder
end

function DirectoryManager:AddObject(parent, objectType, name)
	local object = Instance.new(objectType)
	object.Name = name
	object.Parent = parent
	return object
end

function DirectoryManager:AddScript(parent, scriptType, name)
	local script = Instance.new(scriptType)
	script.Name = name
	script.Parent = parent
	return script
end

function DirectoryManager:SetProperty(object, propertyName, value)
	if object and object:IsA("Instance") then
		object[propertyName] = value
	end
end

function DirectoryManager:GetProperty(object, propertyName)
	if object and object:IsA("Instance") then
		return object[propertyName]
	end
	return nil
end

function DirectoryManager:GetAllChildren(parent)
	return parent:GetChildren()
end

function DirectoryManager:GetDirectories(parent)
	local directories = {}
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA("Folder") or child:IsA("Model") then
			table.insert(directories, child)
		end
	end
	return directories
end

function DirectoryManager:GetScripts(parent)
	local scripts = {}
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA("Script") or child:IsA("LocalScript") then
			table.insert(scripts, child)
		end
	end
	return scripts
end

function DirectoryManager:HandleInput(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("Left mouse button clicked.")
	elseif input.UserInputType == Enum.UserInputType.Keyboard then
		print("Key pressed: " .. input.KeyCode.Name)
	end
end

return DirectoryManager
