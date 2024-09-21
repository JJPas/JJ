local GroupModule = {}

function GroupModule:GroupSelectedObjects(selectedObjects, parent)
	if #selectedObjects > 0 then
		local newFolder = Instance.new("Folder")
		newFolder.Name = "GroupedFolder"
		newFolder.Parent = parent

		for _, object in ipairs(selectedObjects) do
			if object:IsA("Instance") then
				object.Parent = newFolder
			end
		end

		print("Grouped " .. #selectedObjects .. " objects into " .. newFolder.Name)
		return newFolder
	else
		print("No objects selected for grouping.")
		return nil
	end
end

return GroupModule
