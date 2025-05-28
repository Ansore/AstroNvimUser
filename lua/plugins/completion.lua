-- if true then return {} end

return {
  "saghen/blink.cmp",
  event = { "BufReadPost", "BufNewFile" },
  version = "1.*",
  -- build = 'cargo build --release'
  dependencies = { "xzbdmw/colorful-menu.nvim", opts = {} },
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
      menu = {
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
              highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
            },
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
    },
  },
  keymap = {
    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
  },
  signature = {
    enabled = true,
  },
  cmdline = {
    completion = {
      menu = {
        auto_show = true,
      },
    },
  },
  sources = {
    providers = {
      snippets = { score_offset = 1000 },
    },
  },
}
