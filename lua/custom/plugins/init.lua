-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- A task runner and job management plugin for Neovim
    'stevearc/overseer.nvim',
    opts = {
      templates = { 'builtin', 'cmake.module' },
    },
  },
  { -- GitHub Copilot plugin for Neovim
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
        panel = { enabled = true },

        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
            -- disable for .env files
            return false
          end
          return true
        end,
      }
    end,
  },
  { -- Buffer line plugin for Neovim
    'akinsho/bufferline.nvim',
    opts = {
      options = {
        color_icons = true,
        show_tab_indicators = true,
        separator_style = 'slant',
        always_show_bufferline = true,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
            separator = true,
          },
        },
      },
    },
  },
  { -- Plugin to improve viewing Markdown files in Neovim
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
