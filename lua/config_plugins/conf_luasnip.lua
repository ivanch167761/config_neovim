local ls = require "luasnip"
--local types = require "luasnip.utils.types"
ls.config.set_config{
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
---    [types.choiceNode] = {
---      active = {
---        virt_text = { {"<-", "Error"} },
---      }
---    },
  },
}
---

