if not pcall(require, "luasnip") then
    return
end
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/ljpurcell/snips/" })
local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = false,

    -- This one is cool cause if you have dynamic snippets, it updates as you type!
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    vim.keymap.set({ "i", "s" }, "<C-.>", function() ls.expand_or_jump() end, { silent = true }),
    vim.keymap.set({ "i", "s" }, "<C-,>", function() ls.jump(-1) end, { silent = true }),
}
