require("luasnip").config.setup({
	region_check_events = "InsertLeave",
})

local ls = require("luasnip")
ls.add_snippets(nil, {
	all = require("snippets.all"),
})
