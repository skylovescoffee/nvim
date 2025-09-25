# Skylovescoffee's Neovim Config

## Barebone

- As close to zero-config as possible.
- Only quality of life features are enabled by default.

## Plugins

- Tokyonight (colorscheme)
- Telescope (fuzzy finder)
- Conform (auto-format on save)
- Mason, Mason-LSPConfig, LSPConfig (LSP + TypeScript server)

## Keybindings

- <leader>ff: Telescope find files
- <leader>fg: Telescope live grep
- gd: LSP go to definition
- gD: LSP go to declaration
- gr: LSP references
- gi: LSP implementation
- K: LSP hover
- [d / ]d: Prev/Next diagnostic
- <leader>rn: LSP rename symbol
- <leader>ca: LSP code action

### Tips

Run `:Lazy sync` or restart Neovim to install new plugins.

To enable format on save, nothing extra is needed. Conform runs automatically on `BufWritePre` for supported filetypes. Ensure the external formatters are installed (e.g., `stylua`, `prettier`, `black`, `shfmt`, `gofmt`).

TypeScript LSP:

- Ensure Node.js is installed on your system.
- Run `:Lazy sync`, then `:Mason` to manage external tools.
- `ts_ls` should auto-install; if not, install it from the `:Mason` UI.
- Open a `.ts`/`.tsx` file to start the server. Use the LSP keys above.
- If something seems off, check `:LspInfo` and `:Mason` for status.
