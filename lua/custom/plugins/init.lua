-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- A task runner and job management plugin for Neovim
    'stevearc/overseer.nvim',
    opts = {
      templates = { 'builtin', 'mvn.spring-boot-run' },
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
      }
    end,
  },
}
