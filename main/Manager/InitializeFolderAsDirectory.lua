local DirectoryInitializer = {}

function DirectoryInitializer:CreateNewDirectory(directoryName, parent)
	local newDirectory = Instance.new("Folder")
	newDirectory.Name = directoryName
	newDirectory.Parent = parent
	return newDirectory
end

function DirectoryInitializer:InitializeDirectories()
	local mainExplorer = game.Workspace:FindFirstChild("JJ_Explorer")

	if mainExplorer then
		self:CreateNewDirectory("UI_Elements", mainExplorer)
		self:CreateNewDirectory("Scripts", mainExplorer)
		self:CreateNewDirectory("Assets", mainExplorer)
		self:CreateNewDirectory("Particles", mainExplorer)
		self:CreateNewDirectory("Sounds", mainExplorer)
	else
		warn("JJ_Explorer directory not found!")
	end
end
