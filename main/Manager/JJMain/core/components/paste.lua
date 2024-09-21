local CopyModule = {}
local copiedObjects = {}

function CopyModule:CopyObject(object)
	if object and object:IsA("Instance") then
		table.insert(copiedObjects, object:Clone())
		print("Copied object: " .. object.Name)
	else
		print("Invalid object for copying.")
	end
end

function CopyModule:PasteObject(parent)
	for _, object in ipairs(copiedObjects) do
		local pastedObject = object:Clone()
		pastedObject.Parent = parent
		pastedObject.Position = pastedObject.Position + Vector3.new(2, 0, 0)
		print("Pasted object: " .. pastedObject.Name)
	end
	copiedObjects = {}
end

return CopyModule
