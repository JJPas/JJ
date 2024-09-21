local KeywordBlocks = {}

KeywordBlocks.keywords = {
	"if", "for", "while", "function"
}

KeywordBlocks.blocks = {
	["if"] = "then\n    -- code here\nend",
	["for"] = "for i = 1, 10 do\n    -- code here\nend",
	["while"] = "while condition do\n    -- code here\nend",
	["function"] = "function myFunction()\n    -- code here\nend"
}

function KeywordBlocks:GenerateBlock(keyword)
	if self.blocks[keyword] then
		return self.blocks[keyword]
	else
		return nil
	end
end

return KeywordBlocks
