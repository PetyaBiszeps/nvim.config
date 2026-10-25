# Neovim — mini.nvim experiment

Neovim **0.12+**, native APIs, `vim.pack`, [mini.nvim](https://github.com/nvim-mini/mini.nvim) for functionality, and [jb.nvim](https://github.com/nickkadutskyi/jb.nvim) for the WebStorm-like theme.

See **[MINI.md](MINI.md)** for architecture, keymaps, language-server installation, replacements, missing features and evaluation.

- Configuration: `nvim/`
- macOS setup: `sh init.sh` (refuses to replace an existing non-symlink config)
- Isolated validation: `sh scripts/validate.sh`
- External dependencies: Git; ripgrep for live grep; optional fd. Language servers are installed separately and inspected with `:LspTools`.

Leader is **Space**. Start with `<Space>ff` (files), `<Space>fg` (search), `<Space>e` (explorer), `<Space>d` (diagnostics), or pause after Space for key clues.
