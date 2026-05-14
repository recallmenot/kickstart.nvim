vim.pack.add({
  -- Main plugin (can be a string or table with src)
  "https://github.com/m4xshen/hardtime.nvim",

  -- Dependencies
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
})

require("hardtime").setup({
  -- Add your opts here, e.g.:
  -- disable_mouse = false,
  -- hint = true,
})
