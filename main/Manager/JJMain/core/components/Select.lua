local SelectionModule = {}
local selectedObject = nil

function SelectionModule:GetSelectedObject()
	return selectedObject
end

function SelectionModule:SelectObject(object)
	if object and object:IsA("Instance") then
		selectedObject = object
		print("Selected object: " .. object.Name)
	else
		print("Invalid object selection.")
	end
end

function SelectionModule:ClearSelection()
	selectedObject = nil
	print("Selection cleared.")
end

return SelectionModule
