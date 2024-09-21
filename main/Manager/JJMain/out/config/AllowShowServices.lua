local HideShowServices = {}
local hiddenServices = {}

function HideShowServices:AddServiceToHide(serviceName)
	local service = game:GetService(serviceName)
	if service then
		hiddenServices[serviceName] = service
		service:Destroy()
		print("Service hidden: " .. serviceName)
	else
		print("Service not found: " .. serviceName)
	end
end

function HideShowServices:RestoreService(serviceName)
	if hiddenServices[serviceName] then
		local newService = Instance.new(serviceName)
		newService.Parent = game
		hiddenServices[serviceName] = nil
		print("Service restored: " .. serviceName)
	else
		print("Service not hidden: " .. serviceName)
	end
end

function HideShowServices:ShowService(serviceName)
	if hiddenServices[serviceName] then
		self:RestoreService(serviceName)
	else
		print("Service is not hidden: " .. serviceName)
	end
end

function HideShowServices:IsServiceHidden(serviceName)
	return hiddenServices[serviceName] ~= nil
end

function HideShowServices:GetHiddenServices()
	local serviceList = {}
	for serviceName in pairs(hiddenServices) do
		table.insert(serviceList, serviceName)
	end
	return serviceList
end

return HideShowServices
