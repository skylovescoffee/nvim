# Skylovescoffee's Neovim Config

## Barebone

- As close to zero-config as possible.
- Only quality of life features are enabled by default.

## Plugins

- Tokyonight (colorscheme)
- Telescope (fuzzy finder)
- Conform (auto-format on save)

## Keybindings

- <leader>ff: Telescope find files
- <leader>fg: Telescope live grep

### Tips

Run `:Lazy sync` or restart Neovim to install new plugins.

To enable format on save, nothing extra is needed. Conform runs automatically on `BufWritePre` for supported filetypes. Ensure the external formatters are installed (e.g., `stylua`, `prettier`, `black`, `shfmt`, `gofmt`).
