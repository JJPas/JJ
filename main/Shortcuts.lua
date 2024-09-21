local ExplorerShortcuts = {}

ExplorerShortcuts.Shortcuts = {
	OpenExplorer = {
		Description = "Opens the explorer panel.",
		KeyCombination = "Ctrl + E"
	},
	CloseExplorer = {
		Description = "Closes the explorer panel.",
		KeyCombination = "Ctrl + Shift + E"
	},
	AddObject = {
		Description = "Adds a new object to the selected directory.",
		KeyCombination = "Ctrl + N"
	},
	RemoveObject = {
		Description = "Removes the selected object from the explorer.",
		KeyCombination = "Delete"
	},
	DuplicateObject = {
		Description = "Duplicates the selected object.",
		KeyCombination = "Ctrl + D"
	},
	RenameObject = {
		Description = "Renames the selected object.",
		KeyCombination = "F2"
	},
	ToggleProperties = {
		Description = "Toggles the properties panel.",
		KeyCombination = "Ctrl + P"
	},
	SearchObjects = {
		Description = "Searches for objects in the explorer.",
		KeyCombination = "Ctrl + F"
	},
	ExecuteScript = {
		Description = "Executes the current script in the editor.",
		KeyCombination = "F5"
	},
}

function ExplorerShortcuts:GetShortcuts()
	return self.Shortcuts
end

return ExplorerShortcuts
