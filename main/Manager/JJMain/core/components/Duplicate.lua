local DuplicateModule = {}

function DuplicateModule:DuplicateObject(object)
	if object and object:IsA("Instance") then
		local duplicatedObject = object:Clone()
		duplicatedObject.Parent = object.Parent
		duplicatedObject.Position = duplicatedObject.Position + Vector3.new(2, 0, 0)
		print("Duplicated object: " .. object.Name)
		return duplicatedObject
	else
		print("Invalid object for duplication.")
		return nil
	end
end

return DuplicateModule
