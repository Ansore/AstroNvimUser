-- easily add or disable built in mappings added during LSP attaching
return {
  n = {
    ["g]"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
    ["g["] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostic" },
    ["gi"] = { function() vim.lsp.buf.implementation() end, desc = "Prev Diagnostic" },
    ["K"] = { "5k", desc = "" },
    ["M"] = {
      function() vim.lsp.buf.hover() end,
      desc = "Hover symbol details",
    }
  },
}
