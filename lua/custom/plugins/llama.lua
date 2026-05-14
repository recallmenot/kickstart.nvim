-- plugins/llama.lua
local private_module_exists, private = pcall(require, 'custom.private')

if not private_module_exists then
  -- No private keys → don't install/configure the plugin
  return
end

-- Define the config (same as before)
vim.g.llama_config = {
  endpoint_fim = private.get_key 'llm_url' .. '/infill',
  api_key = private.get_key 'llm_api_key',
  n_prefix = 256,
  n_suffix = 64,
  n_predict = 128,
  stop_strings = {},
  t_max_prompt_ms = 500,
  t_max_predict_ms = 500,
  show_info = 2,
  auto_fim = true,
  max_line_suffix = 8,
  max_cache_keys = 250,
  ring_n_chunks = 16,
  ring_chunk_size = 64,
  ring_scope = 1024,
  ring_update_ms = 1000,
  keymap_fim_trigger = '<C-F>',
  keymap_fim_accept_full = '<Tab>',
  keymap_fim_accept_line = '<S-Tab>',
  keymap_fim_accept_word = '<C-B>',
  enable_at_startup = false,
}

-- Keymaps (they can stay here – they don't depend on the plugin loading)
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>cle', '<cmd>LlamaEnable<cr>', { desc = 'enable llama.vim' })
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>cld', '<cmd>LlamaDisable<cr>', { desc = 'disable llama.vim' })
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>clt', '<cmd>LlamaToggle<cr>', { desc = 'toggle llama.vim' })

-- Register with vim.pack (this installs + loads it automatically as a start plugin)
vim.pack.add({
  {
    src = 'https://github.com/ggml-org/llama.vim',
    -- Optional: pin to a version/branch if you want reproducibility
    -- version = 'main',        -- or a semver range like vim.version.range('>=0.1')
  },
})
