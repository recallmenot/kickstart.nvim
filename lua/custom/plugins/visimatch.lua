vim.pack.add({
  { src = "https://github.com/wurli/visimatch.nvim" },
})

-- Setup (equivalent to lazy.nvim's `opts = {}` / require("visimatch").setup())
require("visimatch").setup({
  -- Your custom options here (defaults shown below)
  -- hl_group = "Search",
  chars_lower_limit = 3,
  -- lines_upper_limit = 30,
  strict_spacing = false,
  -- buffers = "filetype",
  -- case_insensitive = { "markdown", "text", "help" },
})
