-- plugins/llama.lua
local private_module_exists, private = pcall(require, 'custom.private')

local llama_config = {}

if private_module_exists then
  llama_config = {
    'ggml-org/llama.vim',
    init = function()
      vim.g.llama_config = {
        endpoint = private.get_key 'llm_url' .. '/infill',
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
        keymap_trigger = '<C-F>',
        keymap_accept_full = '<Tab>',
        keymap_accept_line = '<S-Tab>',
        keymap_accept_word = '<C-B>',
      }
    end,
    lazy = false,
  }
else
  -- Return an empty plugin table if private.lua doesn't exist
  llama_config = {}
end

return llama_config
