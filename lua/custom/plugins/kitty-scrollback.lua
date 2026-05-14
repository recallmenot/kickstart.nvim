vim.pack.add({
  {
    src = 'https://github.com/mikesmithgh/kitty-scrollback.nvim',
    version = vim.version.range('*'),  -- latest stable semver tag (recommended)
    -- version = vim.version.range('^9.0.0'),  -- pin major version if you prefer stability
  },
})

-- Configure the plugin (runs on the User event or when needed)
vim.api.nvim_create_autocmd('User', {
  pattern = 'KittyScrollbackLaunch',
  callback = function()
    require('kitty-scrollback').setup()
  end,
})

-- You can also call setup() directly if you prefer eager loading:
-- require('kitty-scrollback').setup()

--[[
find ~/.local/share/nvim -name kitty_scrollback_nvim.py

nvim ~/.config/kitty/kitty.conf

allow_remote_control yes
listen_on unix:/tmp/kitty
shell_integration enabled

# kitty-scrollback.nvim Kitten alias
action_alias kitty_scrollback_nvim kitten ~/.local/share/nvim/site/pack/core/opt/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py

# Browse scrollback buffer in nvim
map kitty_mod+h kitty_scrollback_nvim
# Browse output of the last shell command in nvim
map kitty_mod+g kitty_scrollback_nvim --config ksb_builtin_last_cmd_output
# Show clicked command output in nvim
mouse_map ctrl+shift+right press ungrabbed combine : mouse_select_command_output : kitty_scrollback_nvim --config ksb_builtin_last_visited_cmd_output
--]]
