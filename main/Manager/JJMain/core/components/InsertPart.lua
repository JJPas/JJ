local InsertPartModule = {}

function InsertPartModule:InsertPart(parent)
	if parent and parent:IsA("Instance") then
		local newPart = Instance.new("Part")
		newPart.Name = "NewPart"
		newPart.Size = Vector3.new(4, 1, 2)
		newPart.Position = Vector3.new(0, 5, 0)
		newPart.Anchored = true
		newPart.Parent = parent

		print("Inserted: " .. newPart.Name)
		return newPart
	else
		print("Invalid parent for inserting part.")
		return nil
	end
end

return InsertPartModule
