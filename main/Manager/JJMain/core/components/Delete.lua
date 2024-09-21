local DeletePartModule = {}

function DeletePartModule:DeletePart(part)
	if part and part:IsA("Part") then
		part:Destroy()
		print("Deleted: " .. part.Name)
	else
		print("Selected object is not a valid part.")
	end
end

return DeletePartModule
