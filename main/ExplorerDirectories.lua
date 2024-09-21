local ExplorerDirectories = {}

ExplorerDirectories.Directories = {
	Workspace = {
		Description = "The primary environment for the game.",
		Items = {}
	},
	Players = {
		Description = "Contains Player instances for each player in the game.",
		Items = {}
	},
	ReplicatedStorage = {
		Description = "Storage for assets that need to be accessed by both the server and clients.",
		Items = {}
	},
	ServerStorage = {
		Description = "Storage for assets that are only accessible on the server.",
		Items = {}
	},
	ServerScriptService = {
		Description = "Houses scripts that run on the server.",
		Items = {}
	},
	StarterPack = {
		Description = "Items that are given to players when they spawn.",
		Items = {}
	},
	StarterGui = {
		Description = "User interface elements that are cloned into each player's PlayerGui.",
		Items = {}
	},
	StarterPlayer = {
		Description = "Settings for the player's character and PlayerScripts.",
		Items = {}
	},
	Teams = {
		Description = "Contains Team instances.",
		Items = {}
	},
	Lighting = {
		Description = "Controls the game's lighting settings.",
		Items = {}
	},
	HttpService = {
		Description = "Allows HTTP requests to external servers.",
		Items = {}
	},
	TweenService = {
		Description = "Used for tweening properties of instances.",
		Items = {}
	},
	Debris = {
		Description = "Service for managing temporary items.",
		Items = {}
	},
	RunService = {
		Description = "Contains functions for running code during various phases.",
		Items = {}
	},
	PlayersService = {
		Description = "Access to player-related functions and data.",
		Items = {}
	},
	AnalyticsService = {
		Description = "Used for tracking user behavior and metrics.",
		Items = {}
	},
	SoundService = {
		Description = "Controls all sounds in the game.",
		Items = {}
	},
	UserInputService = {
		Description = "Handles user input.",
		Items = {}
	},
}

function ExplorerDirectories:GetDirectories()
	return self.Directories
end

return ExplorerDirectories
