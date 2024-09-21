local ExplorerDirectoriesInitializer = {}

function ExplorerDirectoriesInitializer:CreateDirectory(name, parent)
	local directory = Instance.new("Folder")
	directory.Name = name
	directory.Parent = parent
	return directory
end

function ExplorerDirectoriesInitializer:InitializeDirectories()
	local explorerRoot = Instance.new("Folder")
	explorerRoot.Name = "JJ_Explorer"
	explorerRoot.Parent = game.Workspace

	local uiFolder = self:CreateDirectory("UI_Elements", explorerRoot)
	local scriptFolder = self:CreateDirectory("Scripts", explorerRoot)
	local assetsFolder = self:CreateDirectory("Assets", explorerRoot)

	self:CreateDirectory("Particles", explorerRoot)
	self:CreateDirectory("Sounds", explorerRoot)

	return explorerRoot
end
