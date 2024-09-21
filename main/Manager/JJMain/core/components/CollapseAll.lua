local CollapseAllModule = {}

function CollapseAllModule:CollapseAllObjects(parent)
	if parent and parent:IsA("Instance") then
		for _, child in ipairs(parent:GetChildren()) do
			if child:IsA("Folder") or child:IsA("Model") then
				child.Archivable = false
				print("Collapsed: " .. child.Name)
				self:CollapseAllObjects(child)
			end
		end
	else
		print("Invalid parent for collapsing.")
	end
end

return CollapseAllModule
