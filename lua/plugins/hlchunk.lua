return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup {
      -- chunk = {
      --   enable = true,
      --   notify = true,
      --   use_treesitter = true,
      --   style = {
      --     { fg = "#806d9c" },
      --     { fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
      --   },
      --   chars = {
      --     horizontal_line = "─",
      --     vertical_line = "│",
      --     left_top = "╭",
      --     left_bottom = "╰",
      --     right_arrow = ">",
      --   },
      --   textobject = "",
      --   max_file_size = 1024 * 1024,
      --   error_sign = true,
      -- },
      -- indent = {
      --   enable = true,
      --   use_treesitter = false,
      --   chars = {
      --     "│",
      --   },
      --   style = {
      --     { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui") },
      --   },
      -- },
      -- blank = {
      --   enable = false,
      --   use_treesitter = true,
      --   chars = {
      --     "․",
      --   },
      --   style = {
      --     vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"),
      --   },
      -- },
      -- line_num = {
      --   enable = true,
      --   use_treesitter = false,
      --   style = "#806d9c",
      -- },
    }
  end,
}
