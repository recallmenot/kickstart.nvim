-- Add the plugin (install + load it)
vim.pack.add({
  {
    src = "https://github.com/xiyaowong/transparent.nvim",
    version = "main",  -- equivalent to the old 'branch = "main"'
  },
})

-- Configuration (runs after the plugin is available)
require("transparent").setup({
  -- table: default groups
  groups = {
    "Normal",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "CursorLine",
    "CursorLineNr",
    "StatusLine",
    "StatusLineNC",
    "EndOfBuffer",
  },
  -- table: additional groups that should be cleared
  extra_groups = {
    "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
    "NvimTreeNormal", -- NvimTree
  },
  -- table: groups you don't want to clear
  exclude_groups = {},
  -- function: code to be executed after highlight groups are cleared
  -- Also the user event "TransparentClear" will be triggered
  on_clear = function() end,
})

-- To enable permanently, run ':TransparentEnable' once (as noted in the original)
