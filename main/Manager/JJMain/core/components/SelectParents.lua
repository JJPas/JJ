local ParentSelectionModule = {}
local selectedParents = {}

function ParentSelectionModule:GetSelectedParents()
	return selectedParents
end

function ParentSelectionModule:SelectParent(object)
	if object and object:IsA("Instance") then
		local parent = object.Parent
		if parent then
			if not table.find(selectedParents, parent) then
				table.insert(selectedParents, parent)
				print("Selected parent: " .. parent.Name)
			else
				print("Parent already selected: " .. parent.Name)
			end
		else
			print("No parent found for the selected object.")
		end
	else
		print("Invalid object selection.")
	end
end

function ParentSelectionModule:ClearSelection()
	selectedParents = {}
	print("Parent selection cleared.")
end

return ParentSelectionModule
