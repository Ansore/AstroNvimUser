local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    -- modify the mapping part of the table
    opts.mapping["<Tab>"] = cmp.mapping.select_next_item()
    opts.mapping["<S-Tab>"] = cmp.mapping.select_prev_item()
    opts.mapping["<C-j>"] = cmp.mapping(
      function(fallback)
        -- if cmp.visible() then
        -- 	cmp.select_next_item()
        -- else
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }
    )
    opts.mapping["<C-k>"] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
      -- 	cmp.select_prev_item()
      -- else
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
    opts.mapping["<C-l>"] = cmp.mapping.confirm({ select = true })

    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip",  priority = 750 },
      { name = "buffer",   priority = 500 },
      { name = "path",     priority = 250 },
    }

    -- return the new table to be used
    return opts
  end,
}
