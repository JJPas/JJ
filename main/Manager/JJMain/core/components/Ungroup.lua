local UngroupModule = {}

function UngroupModule:UngroupObjects(folder)
	if folder and folder:IsA("Folder") then
		local parent = folder.Parent

		for _, child in ipairs(folder:GetChildren()) do
			if child:IsA("Instance") then
				child.Parent = parent
			end
		end

		folder:Destroy()
		print("Ungrouped objects from " .. folder.Name)
	else
		print("Invalid folder for ungrouping.")
	end
end

return UngroupModule
