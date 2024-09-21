local ObjectOffsets = {}

function ObjectOffsets:GetOffset(objectA, objectB)
	if objectA:IsA("Instance") and objectB:IsA("Instance") then
		local positionA = objectA.Position
		local positionB = objectB.Position
		return UDim2.new(positionB.X.Scale - positionA.X.Scale, positionB.X.Offset - positionA.X.Offset,
			positionB.Y.Scale - positionA.Y.Scale, positionB.Y.Offset - positionA.Y.Offset)
	end
	return nil
end

function ObjectOffsets:ApplyOffset(object, offset)
	if object:IsA("Instance") and offset then
		object.Position = UDim2.new(object.Position.X.Scale + offset.X.Scale, object.Position.X.Offset + offset.X.Offset,
			object.Position.Y.Scale + offset.Y.Scale, object.Position.Y.Offset + offset.Y.Offset)
	end
end

function ObjectOffsets:SetOffset(object, xScale, xOffset, yScale, yOffset)
	if object:IsA("Instance") then
		object.Position = UDim2.new(xScale, xOffset, yScale, yOffset)
	end
end

return ObjectOffsets
