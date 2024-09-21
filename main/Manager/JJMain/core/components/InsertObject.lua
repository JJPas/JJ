local InsertModule = {}

function InsertModule:InsertObject(objectType, parent)
	if objectType and parent and parent:IsA("Instance") then
		local newObject

		if objectType == "Part" then
			newObject = Instance.new("Part")
			newObject.Name = "NewPart"
			newObject.Size = Vector3.new(4, 1, 2)
			newObject.Position = Vector3.new(0, 5, 0)
			newObject.Anchored = true

		elseif objectType == "Script" then
			newObject = Instance.new("Script")
			newObject.Name = "NewScript"
			newObject.Source = "-- Your script code here"

		elseif objectType == "LocalScript" then
			newObject = Instance.new("LocalScript")
			newObject.Name = "NewLocalScript"
			newObject.Source = "-- Your local script code here"

		elseif objectType == "Model" then
			newObject = Instance.new("Model")
			newObject.Name = "NewModel"

		elseif objectType == "Folder" then
			newObject = Instance.new("Folder")
			newObject.Name = "NewFolder"

		elseif objectType == "BillboardGui" then
			newObject = Instance.new("BillboardGui")
			newObject.Name = "NewBillboardGui"

		elseif objectType == "ScreenGui" then
			newObject = Instance.new("ScreenGui")
			newObject.Name = "NewScreenGui"

		elseif objectType == "Frame" then
			newObject = Instance.new("Frame")
			newObject.Name = "NewFrame"

		elseif objectType == "TextLabel" then
			newObject = Instance.new("TextLabel")
			newObject.Name = "NewTextLabel"

		elseif objectType == "TextButton" then
			newObject = Instance.new("TextButton")
			newObject.Name = "NewTextButton"

		elseif objectType == "Sound" then
			newObject = Instance.new("Sound")
			newObject.Name = "NewSound"

		elseif objectType == "ParticleEmitter" then
			newObject = Instance.new("ParticleEmitter")
			newObject.Name = "NewParticleEmitter"

		elseif objectType == "Texture" then
			newObject = Instance.new("Texture")
			newObject.Name = "NewTexture"

		elseif objectType == "MeshPart" then
			newObject = Instance.new("MeshPart")
			newObject.Name = "NewMeshPart"

		elseif objectType == "Decal" then
			newObject = Instance.new("Decal")
			newObject.Name = "NewDecal"

		elseif objectType == "Attachment" then
			newObject = Instance.new("Attachment")
			newObject.Name = "NewAttachment"

		elseif objectType == "ScriptContext" then
			newObject = Instance.new("ScriptContext")
			newObject.Name = "NewScriptContext"
		else
			print("Unsupported object type: " .. objectType)
			return nil
		end

		newObject.Parent = parent
		print("Inserted: " .. newObject.Name .. " of type " .. objectType)
		return newObject
	else
		print("Invalid parameters for inserting object.")
		return nil
	end
end

return InsertModule
