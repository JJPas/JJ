local ScriptOverloadManager = {}

local MAX_SCRIPT_OVERLOAD = 10 
local activeScripts = {}

function ScriptOverloadManager:TrackScript(scriptInstance)
	table.insert(activeScripts, scriptInstance)
	self:CheckForOverload()
end

function ScriptOverloadManager:RemoveScript(scriptInstance)
	for i, script in ipairs(activeScripts) do
		if script == scriptInstance then
			script:Destroy()
			table.remove(activeScripts, i)
			break
		end
	end
end

function ScriptOverloadManager:CheckForOverload()
	if #activeScripts > MAX_SCRIPT_OVERLOAD then
		self:HandleOverload()
	end
end

function ScriptOverloadManager:HandleOverload()
	local excessCount = #activeScripts - MAX_SCRIPT_OVERLOAD
	for i = 1, excessCount do
		if activeScripts[i] then
			self:RemoveScript(activeScripts[i])
		end
	end
	warn("Overloaded! Removed excess scripts to maintain performance.")
end
