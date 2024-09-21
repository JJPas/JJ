local ExpandAllModule = {}

function ExpandAllModule:ExpandAllObjects(parent)
	if parent and parent:IsA("Instance") then
		for _, child in ipairs(parent:GetChildren()) do
			if child:IsA("Folder") or child:IsA("Model") then
				child.Archivable = true
				child.Parent = parent
				print("Expanded: " .. child.Name)
				self:ExpandAllObjects(child)
			end
		end
	else
		print("Invalid parent for expanding.")
	end
end

return ExpandAllModule
