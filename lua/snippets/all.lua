local lss = require("luasnip")
local ls = require("luasnip")
--local ls = require("luasnip.functions")
-- some shorthands...
local snip = ls.snippet
local lspconfig = require("lspconfig")
local ts_utils = require("nvim-treesitter.ts_utils")
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = ls.s
local c = ls.choice_node

local time = function()
	return os.date("%d %H:%M")
end

local date = function()
	return { os.date("%Y-%m-%d") }
end

local snipDate = function(index)
	local args = { text("sss"), text("lll") }
	return dynamicn(index, function()
		return node(nil, args)
	end, {})
end

local same = function(index)
	return func(function(arg)
		return arg[1]
	end, { index, index })
end

local all = {
	snip({
		trig = "dateMyMy",
		namr = "Date",
		dscr = "Date in the form of YYYY-MM-DD",
	}, {
		func(time, {}),
	}),
	snip({
		trig = "learn",
		namr = "learn",
		dscr = "lets try to do somthing cool",
	}, { text("HIOHI") }),
	ls.parser.parse_snippet("lm", "local $1 = function($2)\n $0\nend"),
	s("reqMy", fmt("local {} = require('{}')", { insert(1, "default"), rep(1) })),
	s(
		"reqMyDD",
		fmt("local {}.{}.{} = require('{}')", { insert(1, "default"), rep(2), insert(2, "NotDefault"), rep(1) })
	),
	s(
		"myTest",
		fmt(
			[[
        1{}...{}
        ]],
			{
				c(1, { text("aaa"), text("bbb") }),
				insert(0),
			}
		)
	),

	s("myTyme", { func(time, {}) }),
	snip("sameMy", fmt([[example:{}, function: {}]], { insert(1), same(1) })),

	snip(
		"smartReq",
		fmt([[local {} = require "{}"]], {
			func(function(import_name)
				local parts = vim.split(import_name[1][1], ".", { plain = true })
				return parts[#parts] or ""
			end, { 1 }),
			insert(1),
		})
	),

	snip("myArgs", fmt([[{}]], { snipDate(1) })),
}
return all
