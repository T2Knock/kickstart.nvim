return {
  { 'folke/todo-comments.nvim', event = 'BufEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
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
      },
    },
  },
}
