-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["Q"] = { ":q<cr>", desc = "Quit" },
    ["S"] = { ":w<cr>", desc = "Save File" },
    ["J"] = { "5j", desc = "Move cursor down 5 lines" },
    ["K"] = { "5k", desc = "Move cursor up 5 lines" },
    ["L"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc =
    "Next buffer" },
    ["H"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
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
    ["ft"] = { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Find themes" },
    ["fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
    ["fW"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end,
      desc = "Find words in all files",
    }
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
  }
}
