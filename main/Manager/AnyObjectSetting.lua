local ObjectManager = {}

function ObjectManager:CreateObject(objectType, properties, parent)
	local newObject = Instance.new(objectType)
	for prop, value in pairs(properties) do
		newObject[prop] = value
	end
	newObject.Parent = parent
	return newObject
end

function ObjectManager:RenameObject(object, newName)
	if object and object:IsA("Instance") then
		object.Name = newName
	end
end

function ObjectManager:DeleteObject(object)
	if object and object:IsA("Instance") then
		object:Destroy()
	end
end

function ObjectManager:MoveObjectToDirectory(object, targetDirectory)
	if object and object:IsA("Instance") and targetDirectory and targetDirectory:IsA("Folder") then
		object.Parent = targetDirectory
	end
end

function ObjectManager:GetAllObjectsInDirectory(directory)
	if directory and directory:IsA("Folder") then
		local objects = {}
		for _, obj in ipairs(directory:GetChildren()) do
			table.insert(objects, obj)
		end
		return objects
	end
	return {}
end

