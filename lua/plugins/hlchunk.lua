return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup {
      chunk = {
        enable = true,
        style = {
          { fg = "#806d9c" },
          { fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
        use_treesitter = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        -- chars = {
        --   horizontal_line = "━",
        --   vertical_line = "┃",
        --   left_top = "┏",
        --   left_bottom = "┗",
        --   right_arrow = "━",
        -- },
      },
      indent = {
        enable = true,
        use_treesitter = false,
        chars = {
          "│",
        },
        style = {
          { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui") },
        },
      },
      blank = {
        enable = false,
        use_treesitter = true,
        chars = {
          "․",
        },
        style = {
          vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"),
        },
      },
      line_num = {
        enable = true,
        use_treesitter = true,
      },
      context = {
        enable = false,
        use_treesitter = true,
        chars = {},
      },
    }
  end,
}
