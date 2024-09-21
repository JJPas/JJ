local RenameModule = {}

function RenameModule:RenameObject(object, newName)
	if object and object:IsA("Instance") and newName and newName ~= "" then
		object.Name = newName
		print("Renamed object to: " .. newName)
	else
		print("Invalid object or name for renaming.")
	end
end

return RenameModule
