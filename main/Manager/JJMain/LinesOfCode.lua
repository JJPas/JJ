local Lines = {}

local loc = 1
local ignoreBlankLines = " "
local TrimString = string:split()
local str = ""
if (ignoreBlankLines) then
	for line in str:gmatch("(.-)\n") do
		if (TrimString(line) ~= "") then
			loc = (loc + 1)
		end
	end
else
	loc = (select(2, str:gsub("\n", "")) + 1)
	return loc
end

local Selection = {}
local CountLines = {}

local function onClick()
	local selectedObjects = Selection:Get();
	if #selectedObjects > 0 then
		local totalLines = 0;
		for i,v in pairs(selectedObjects) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				local script = v.Source;
				totalLines = totalLines + CountLines(script);
			end
		end
		print("Total lines: " .. totalLines);
	else
		local tableOfScripts = {};
		for _, obj in pairs(game.Workspace:GetDescendants()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
				table.insert(tableOfScripts, obj);
			end
		end
		for _, obj in pairs(game.Lighting:GetDescendants()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
				table.insert(tableOfScripts, obj);
			end
		end
		for _, obj in pairs(game.ReplicatedFirst:GetDescendants()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
				table.insert(tableOfScripts, obj);
			end
		end
		for _, obj in pairs(game.ReplicatedStorage:GetDescendants()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
				table.insert(tableOfScripts, obj);
			end
		end
		for _, obj in pairs(game.ServerScriptService:GetDescendants()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
				table.insert(tableOfScripts, obj);
			end
		end
		for _, obj in pairs(game.StarterGui:GetDescendants()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
				table.insert(tableOfScripts, obj);
			end
		end
		for _, obj in pairs(game.StarterPack:GetDescendants()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
				table.insert(tableOfScripts, obj);
			end
		end
		for _, obj in pairs(game.StarterPlayer:GetDescendants()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
				table.insert(tableOfScripts, obj);
			end
		end

		print("Total scripts: " .. #tableOfScripts);
		local totalLines = 0;
		for i,v in pairs(tableOfScripts) do
			local scr = v.Source;
			totalLines = totalLines + CountLines(scr);
		end
		print("Total lines: " .. totalLines);
	end
end

return Lines
