return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    local custom_tokyonight = require 'lualine.themes.tokyonight'
    custom_tokyonight.normal.c.bg = '#1a1b26'

    local linter = function()
      local linters = require('lint').linters_by_ft[vim.bo.filetype] or {}
      if #linters == 0 then
        return ' '
      end

      return '󱉶 ' .. table.concat(linters, ', ')
    end

    require('lualine').setup {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        theme = custom_tokyonight,
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 3,
          },
        },
        lualine_x = { 'fileformat', linter, 'filetype' },
        lualine_z = { 'lsp_status' },
      },
    }
  end,
}
