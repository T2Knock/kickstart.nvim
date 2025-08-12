return {
  { 'neovim/nvim-lspconfig', enabled = false },
  {
    'folke/todo-comments.nvim',
    event = 'BufEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
      {
        '<leader>st',
        function()
          require('snacks.picker').todo_comments()
        end,
        desc = 'Todo',
      },
      {
        '<leader>sT',
        function()
          require('snacks.picker').todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
        end,
        desc = 'Todo/Fix/Fixme',
      },
    },
  },
  { 'NMAC427/guess-indent.nvim', event = 'BufReadPost', opts = {} },
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
        { '<leader>c', group = '[C]ode', icon = '' },
        { '<leader>n', group = '[N]otes', icon = '' },
      },
    },
  },
}
