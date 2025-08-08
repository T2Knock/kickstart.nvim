return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    local custom_tokyonight = require 'lualine.themes.tokyonight'
    custom_tokyonight.normal.c.bg = '#1a1b26'

    local linter_progress = function()
      local linters = require('lint').get_running()
      if #linters == 0 then
        return ' '
      end

      return '󱉶 ' .. table.concat(linters, ', ')
    end

    local function formatter()
      local running_formatters = require('conform').list_formatters_to_run()

      if not running_formatters or #running_formatters == 0 then
        return '  '
      end

      local formatter_names = {}
      for _, formatter_info in ipairs(running_formatters) do
        table.insert(formatter_names, formatter_info.name)
      end

      return '  ' .. table.concat(formatter_names, ', ')
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
            path = 1,
          },
        },
        lualine_x = { 'lsp_status', formatter, linter_progress },
      },
    }
  end,
}
