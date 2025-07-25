return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'xzbdmw/colorful-menu.nvim',
    },
    version = 'v1.*',
    event = 'InsertEnter',
    opts = {
      completion = {
        menu = {
          draw = {
            columns = { { 'kind_icon' }, { 'label', gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require('colorful-menu').blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require('colorful-menu').blink_components_highlight(
                    ctx
                  )
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
        },
      },
      keymap = { preset = 'default' },
      signature = { enabled = true },
    },
  },
}
