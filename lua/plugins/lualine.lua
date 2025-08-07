return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    local custom_tokyonight = require 'lualine.themes.tokyonight'
    custom_tokyonight.normal.c.bg = '#1a1b26'

    require('lualine').setup {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        theme = custom_tokyonight,
      },
      sections = {
        lualine_z = { 'lsp_status' },
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 3,
          },
        },
      },
    }
  end,
}
