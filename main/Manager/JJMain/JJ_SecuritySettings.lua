local JJSecuritySettings = {}

local allowedUsers = {
 
}

function JJSecuritySettings:IsUserAllowed(userId)
	return allowedUsers[userId] or false
end

function JJSecuritySettings:AddUser(userId)
	if not allowedUsers[userId] then
		allowedUsers[userId] = true
		print("User added:", userId)
	else
		warn("User already has access:", userId)
	end
end

function JJSecuritySettings:RemoveUser(userId)
	if allowedUsers[userId] then
		allowedUsers[userId] = nil
		print("User removed:", userId)
	else
		warn("User not found:", userId)
	end
end

function JJSecuritySettings:CheckAccess(userId)
	if self:IsUserAllowed(userId) then
		print("Access granted for user:", userId)
		return true
	else
		print("Access denied for user:", userId)
		return false
	end
end

return JJSecuritySettings
