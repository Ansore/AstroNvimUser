-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        scrolloff = 5, -- sets vim.opt.scrolloff
      },
      g = { -- vim.g.<key>
        codeium_enabled = false, -- setting codeium default
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- mappings seen under group name "Buffer"
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        -- quick save
        ["U"] = { ":UndotreeToggle<cr>", desc = "Quit" },
        -- ["Q"] = { ":q<cr>", desc = "Quit" },
        -- ["S"] = { ":w<cr>", desc = "Save File" },
        ["J"] = { "5j", desc = "Move cursor down 5 lines" },
        ["K"] = { "5k", desc = "Move cursor up 5 lines" },
        ["L"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["H"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["tt"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
        ["ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
        ["fF"] = {
          function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
          desc = "Find all files",
        },
        ["fh"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help" },
        ["fk"] = { function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" },
        ["fm"] = { function() require("telescope.builtin").man_pages() end, desc = "Find man" },
        ["fn"] = { function() require("telescope").extensions.notify.notify() end, desc = "Find notifications" },
        ["fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },
        ["ft"] = {
          function() require("telescope.builtin").colorscheme { enable_preview = true } end,
          desc = "Find themes",
        },
        ["fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
        ["fW"] = {
          function()
            require("telescope.builtin").live_grep {
              additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
            }
          end,
          desc = "Find words in all files",
        },
      },
      v = {
        ["J"] = { "5j", desc = "Move cursor down 5 lines" },
        ["K"] = { "5k", desc = "Move cursor up 5 lines" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      i = {
        ["C-a"] = { "<esc>A", desc = "Move cursor to end" },
      },
    },
  },
}
