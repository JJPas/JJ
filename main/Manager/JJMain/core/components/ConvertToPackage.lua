local ConvertToPackageModule = {}

function ConvertToPackageModule:ConvertToPackage(selectedScript)
	if selectedScript and selectedScript:IsA("Script") then
		local package = Instance.new("Package")
		package.Name = selectedScript.Name .. "Package"
		package.Parent = selectedScript.Parent

		local newScript = selectedScript:Clone()
		newScript.Parent = package

		print("Converted " .. selectedScript.Name .. " to package: " .. package.Name)
		return package
	else
		print("Selected object is not a valid script.")
		return nil
	end
end

return ConvertToPackageModule
