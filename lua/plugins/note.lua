return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    priority = 49,
    dependencies = {
      'saghen/blink.cmp',
    },
  },
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    event = {
      'BufReadPre ' .. vim.fn.expand '~' .. '/workspace/github.com/T2Knock/JT-notes/*.md',
      'BufNewFile ' .. vim.fn.expand '~' .. '/workspace/github.com/T2Knock/JT-notes/*.md',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/workspace/github.com/T2Knock/JT-notes',
        },
      },
      daily_notes = {
        folder = 'dailies',
        template = 'daily_note.md',
        default_tags = { 'daily-notes' },
        workdays_only = false,
      },
      completion = {
        nvim_cmp = false,
        blink = true,
      },
      picker = {
        name = 'snacks.pick',
      },
      templates = {
        subdir = 'templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
      },
      attachments = {
        img_folder = 'resources/imgs',
      },
      legacy_commands = false,
      ui = {
        enabled = false,
      },
    },
    keys = {
      { '<leader>nd', '<cmd>Obsidian today<cr>', desc = 'Today Note' },
      { '<leader>ny', '<cmd>Obsidian yesterday<cr>', desc = 'Yesteday Note' },
      { '<leader>nt', '<cmd>Obsidian tommorrow<cr>', desc = 'Tomorrow Note' },
      { '<leader>nf', '<cmd>Obsidian search<cr>', desc = 'Find in notes' },
      { '<leader>np', '<cmd>Obsidian paste_img<cr>', desc = 'Paste image from clipboard' },
      { '<leader>nc', '<cmd>Obsidian quick_switch<cr>', desc = 'Quick switch notes' },
      { '<leader>nn', '<cmd>Obsidian new<cr>', desc = 'Create a new note' },
      { '<leader>nh', '<cmd>Obsidian template<cr>', desc = 'Insert template' },
    },
  },
}
