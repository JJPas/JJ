local LuaSettings = {}

LuaSettings.Keywords = {
	"if", "then", "else", "elseif", "end", "function", "local", "for", "in", "while", "repeat", "until",
	"do", "return", "break", "continue", "true", "false", "nil", "and", "or", "not", "in", "require",
	"module", "tostring", "tonumber", "pairs", "ipairs", "print", "type", "collectgarbage", "setmetatable",
	"getmetatable", "table", "string", "math", "os"
}

LuaSettings.Functions = {
	"print", "pairs", "ipairs", "tostring", "tonumber", "table.insert", "table.remove", "string.char",
	"string.upper", "string.lower", "math.random", "math.abs", "math.floor", "math.ceil"
}

LuaSettings.SyntaxHighlighting = {
	Comment = Color3.fromRGB(0, 128, 0),
	Keyword = Color3.fromRGB(0, 0, 255),
	String = Color3.fromRGB(255, 0, 0),
	Function = Color3.fromRGB(128, 0, 128),
	Number = Color3.fromRGB(0, 0, 0)
}

function LuaSettings:GetKeywords()
	return self.Keywords
end

function LuaSettings:GetFunctions()
	return self.Functions
end

function LuaSettings:GetSyntaxHighlighting()
	return self.SyntaxHighlighting
end

return LuaSettings
