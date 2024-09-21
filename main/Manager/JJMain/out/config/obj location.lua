local ObjectLocation = {}

function ObjectLocation:GetObjectPath(object)
	local path = {}
	while object do
		table.insert(path, 1, object.Name)
		object = object.Parent
	end
	return table.concat(path, "/")
end

function ObjectLocation:InsertLocationToExplorer(object, explorer)
	if object:IsA("Instance") and explorer:IsA("Folder") then
		local path = self:GetObjectPath(object)
		local locationLabel = Instance.new("TextLabel")
		locationLabel.Size = UDim2.new(1, 0, 0, 20)
		locationLabel.Text = path
		locationLabel.Parent = explorer
	end
end

return ObjectLocation
