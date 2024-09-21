local ZoomModule = {}

function ZoomModule:ZoomToObject(camera, object)
	if object and object:IsA("Instance") then
		local objectPosition = object.Position
		local cameraPosition = camera.CFrame.Position

		camera.CFrame = CFrame.new(objectPosition + Vector3.new(0, 5, 10), objectPosition)  -- Adjust position for a better view
		print("Zoomed to object: " .. object.Name)
	else
		print("Invalid object for zooming.")
	end
end

return ZoomModule
