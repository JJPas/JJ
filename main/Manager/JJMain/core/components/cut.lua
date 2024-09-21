local CutModule = {}
local cutObjects = {}

function CutModule:CutObject(object)
	if object and object:IsA("Instance") then
		table.insert(cutObjects, object)
		object:Destroy()
		print("Cut object: " .. object.Name)
	else
		print("Invalid object for cutting.")
	end
end

function CutModule:PasteObject(parent)
	for _, object in ipairs(cutObjects) do
		local pastedObject = object:Clone()
		pastedObject.Parent = parent
		pastedObject.Position = pastedObject.Position + Vector3.new(2, 0, 0)
		print("Pasted object: " .. pastedObject.Name)
	end
	cutObjects = {}
end

return CutModule
