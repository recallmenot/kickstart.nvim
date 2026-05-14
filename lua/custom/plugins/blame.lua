-- Add this in your plugin specification section (e.g. lua/plugins/blame.lua or directly in init.lua)
vim.pack.add({
  -- Main plugin (table requires `src`)
  {
    src = 'https://github.com/FabijanZulj/blame.nvim',
    branch = 'main',  -- or version = 'main' if you prefer the stable reference
  },
  -- Dependency
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
  },
})

-- Configuration (runs after the plugin is available)
require('blame').setup({
  date_format = '%Y.%m.%d',
  blame_options = { '-w' },  -- moved from opts (common pattern)
})

vim.keymap.set('n', '<leader>gb', '<cmd>BlameToggle<CR>', { desc = 'toggle blame' })
