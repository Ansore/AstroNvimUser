return {
  dartls = function(_, opts) require("flutter-tools").setup { lsp = opts } end,
  rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
}
