-- lua/custom/plugins/leap.lua

vim.pack.add({
  -- Main plugin
  { src = 'https://codeberg.org/andyg/leap.nvim.git' },

  -- Dependency
  'https://github.com/tpope/vim-repeat.git',
})

-- Keymaps (recommended by leap.nvim)
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')

-- Highly recommended: preview filter (reduces visual noise)
require('leap').opts.preview = function(ch0, ch1, ch2)
  return not (
    ch1:match('%s')
    or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
  )
end

-- Optional: clever traversal keys (<CR> and <BS> to repeat search)
do
  local clever = require('leap.user').with_traversal_keys
  vim.keymap.set({ 'n', 'x', 'o' }, '<cr>', function()
    require('leap').leap {
      ['repeat'] = true,
      opts = clever('<cr>', '<bs>'),
    }
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, '<bs>', function()
    require('leap').leap {
      ['repeat'] = true,
      opts = clever('<bs>', '<cr>'),
      backward = true,
    }
  end)
end
