local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    { import = 'plugins' },
    { 'NMAC427/guess-indent.nvim', opts = {} },
    {
      'folke/which-key.nvim',
      event = 'VeryLazy',
      opts = {
        preset = 'helix',
        spec = {
          { '<leader>s', group = '[S]earch', icon = '󱙓' },
          { '<leader>t', group = '[T]oggle', icon = '' },
          { '<leader>f', group = '[F]ind', icon = '󰈞' },
          { '<leader>g', group = '[G]it', icon = '' },
          { '<leader>h', group = '[H]unk', icon = '' },
        },
      },
    },

    -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
    --
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).
    --
    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.indent_line',
    -- require 'kickstart.plugins.lint',
    -- require 'kickstart.plugins.autopairs',
    -- require 'kickstart.plugins.neo-tree',
    -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  },
}

-- vim: ts=2 sts=2 sw=2 et
