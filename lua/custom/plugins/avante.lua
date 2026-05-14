-- lua/custom/plugins/avante.lua

local private_module_exists, private = pcall(require, 'custom.private')

if not private_module_exists then
  return
end

-- Set API key in environment
vim.env[private.get_key 'llm_api_key_name'] = private.get_key 'llm_api_key'

local function gh(repo)
  return 'https://github.com/' .. repo
end

-- Register plugins with vim.pack
vim.pack.add({
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',

  -- Optional but recommended
  gh 'echasnovski/mini.pick',
  gh 'nvim-telescope/telescope.nvim',
  gh 'hrsh7th/nvim-cmp',
  gh 'ibhagwan/fzf-lua',
  gh 'stevearc/dressing.nvim',
  gh 'folke/snacks.nvim',
  gh 'nvim-tree/nvim-web-devicons',
  gh 'zbirenbaum/copilot.lua',

  -- img-clip
  {
    src = gh 'HakonHarnes/img-clip.nvim',
    name = 'img-clip.nvim',
  },

  -- render-markdown
  {
    src = gh 'MeanderingProgrammer/render-markdown.nvim',
    name = 'render-markdown.nvim',
  },

  -- Main plugin
  {
    src = gh 'yetone/avante.nvim',
    name = 'avante.nvim',
  },
})

-- ==================== Configurations ====================

require('img-clip').setup({
  default = {
    embed_image_as_base64 = false,
    prompt_for_file_name = false,
    drag_and_drop = { insert_mode = true },
    use_absolute_path = true,
  },
})

require('render-markdown').setup({
  file_types = { 'markdown', 'Avante' },
})

require('avante').setup({
  provider = 'llamacpp',
  providers = {
    ['llamacpp'] = {
      __inherited_from = 'openai',
      endpoint = private.get_key 'llm_url' .. '/v1',
      model = private.get_key 'llm_model_name',
      api_key_name = private.get_key 'llm_api_key_name',
      timeout = 30000,
    },
  },
})

-- ==================== Critical Build Hook for vim.pack ====================

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local spec = ev.data.spec
    if spec.name ~= 'avante.nvim' then
      return
    end

    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then
      return
    end

    local cwd = spec.path
    vim.notify('🔨 Building avante.nvim...', vim.log.levels.INFO)

    -- Run make synchronously
    local result = vim.system({ 'make' }, {
      cwd = cwd,
      text = true,
    }):wait()

    vim.schedule(function()
      if result.code == 0 then
        vim.notify('✅ avante.nvim built successfully!', vim.log.levels.INFO)

        -- Force reload the native libs
        package.loaded['avante_lib'] = nil
        pcall(require, 'avante_lib')
        pcall(function() require('avante_lib').load() end)

        -- Optional: force a full plugin reload
        vim.cmd('packloadall!')
      else
        vim.notify('❌ avante.nvim build failed!\n' .. (result.stderr or result.stdout or ''), vim.log.levels.ERROR)
      end
    end)
  end,
})

vim.api.nvim_create_user_command('AvanteBuild', function()
  local cwd = require('avante.path').get_plugin_root() -- or hardcode the path
  vim.system({ 'make' }, { cwd = cwd }):wait()
  vim.notify('Avante rebuilt!')
end, {})
