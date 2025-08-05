local function git_blame_toggle(opts)
  return require('snacks.toggle').new({
    id = 'gitsigns_blame',
    name = 'Gitsigns Blame',
    icon = '',
    get = function()
      local gs_config = require('gitsigns.config').config
      local blame_active = gs_config.current_line_blame
      return blame_active
    end,
    set = function(state)
      if state then
        require('gitsigns').toggle_current_line_blame(true)
      else
        require('gitsigns').toggle_current_line_blame(false)
      end
    end,
  }, opts)
end

return {
  'lewis6991/gitsigns.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  event = 'BufRead',
  opts = {
    current_line_blame = true,
    signs = {
      delete = { text = '✖' },
      topdelete = { text = '▔' },
    },
  },

  keys = {
    -- Navigate to the next hunk.
    {
      ']h',
      function()
        if vim.wo.diff then
          return ']h'
        end
        vim.schedule(function()
          require('gitsigns').nav_hunk 'next'
        end)
        return '<Ignore>'
      end,
      desc = 'Next Hunk',
      expr = true,
    },
    -- Navigate to the previous hunk.
    {
      '[h',
      function()
        if vim.wo.diff then
          return '[h'
        end
        vim.schedule(function()
          require('gitsigns').nav_hunk 'prev'
        end)
        return '<Ignore>'
      end,
      desc = 'Prev Hunk',
      expr = true,
    },
    -- Preview the current hunk.
    {
      '<leader>hp',
      '<cmd>Gitsigns preview_hunk<cr>',
      desc = 'Preview Hunk',
    },
    -- Stage the current hunk.
    {
      '<leader>hs',
      '<cmd>Gitsigns stage_hunk<cr>',
      desc = 'Stage Hunk',
    },
    -- Undo the changes in the current hunk.
    {
      '<leader>hr',
      '<cmd>Gitsigns reset_hunk<cr>',
      desc = 'Reset Hunk',
    },
    -- Stage all changes in the file.
    {
      '<leader>hS',
      '<cmd>Gitsigns stage_buffer<cr>',
      desc = 'Stage Buffer',
    },
    -- Undo all changes in the file.
    {
      '<leader>hR',
      '<cmd>Gitsigns reset_buffer<cr>',
      desc = 'Reset Buffer',
    },
    -- Toggle blame information for the current line.
    {
      '<leader>hb',
      function()
        git_blame_toggle()
      end,
      desc = 'Toggle Blame',
    },
  },
}
