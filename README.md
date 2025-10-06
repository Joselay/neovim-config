# Neovim Configuration

A modern, feature-rich Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager.

## Features

### Core Functionality
- **Plugin Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and efficient plugin management
- **LSP Support**: Full Language Server Protocol integration with auto-completion
- **Syntax Highlighting**: Tree-sitter for advanced syntax highlighting
- **Fuzzy Finding**: Telescope for file navigation and searching
- **File Explorer**: Neo-tree for sidebar file navigation
- **Git Integration**: Gitsigns and LazyGit for version control
- **AI Assistant**: Claude Code integration for AI-powered development

### Editor Enhancements
- **Auto-completion**: nvim-cmp with multiple sources
- **Auto-pairs**: Automatic bracket and quote pairing
- **Formatting**: conform.nvim for code formatting
- **Linting**: nvim-lint for code quality checks
- **Comments**: Smart commenting with Comment.nvim
- **Statusline**: Beautiful statusline with lualine.nvim
- **Indent Guides**: Visual indent guides with indent-blankline
- **Key Hints**: which-key for keybinding discovery
- **Dashboard**: Snacks.nvim for a beautiful start screen

### Theme
- **Catppuccin**: Modern and elegant color scheme

## Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, but recommended for icons)
- ripgrep (for Telescope live grep)
- A C compiler (for TreeSitter)

## Installation

1. **Backup your existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/Joselay/neovim-config.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

   lazy.nvim will automatically install all plugins on first launch.

4. **Install LSP servers**: Open Neovim and use Mason to install language servers:
   ```
   :Mason
   ```

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lockfile
└── lua/
    ├── config/
    │   ├── lazy.lua        # lazy.nvim bootstrap
    │   ├── options.lua     # Neovim options
    │   └── keymaps.lua     # Key mappings
    └── plugins/
        ├── lsp.lua         # LSP configuration
        ├── cmp.lua         # Completion
        ├── treesitter.lua  # Syntax highlighting
        ├── telescope.lua   # Fuzzy finder
        ├── neo-tree.lua    # File explorer
        ├── conform.lua     # Formatting
        ├── nvim-lint.lua   # Linting
        ├── gitsigns.lua    # Git signs
        ├── lazygit.lua     # Git UI
        ├── lualine.lua     # Statusline
        ├── catppuccin.lua  # Color scheme
        ├── autopairs.lua   # Auto pairs
        ├── comment.lua     # Commenting
        ├── which-key.lua   # Keybinding hints
        ├── indent-blankline.lua  # Indent guides
        ├── snacks.lua      # Dashboard & more
        └── claudecode.lua  # AI assistant
```

## Key Mappings

Leader key: `Space`

### General
| Key | Description |
|-----|-------------|
| `<Space>` | Leader key |
| `jk` / `kj` | Exit insert mode (if configured) |

### File Navigation
| Key | Description |
|-----|-------------|
| `<leader>e` | Toggle file explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help |

### LSP
| Key | Description |
|-----|-------------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |

### Git
| Key | Description |
|-----|-------------|
| `<leader>gg` | Open LazyGit |
| `]c` | Next git hunk |
| `[c` | Previous git hunk |

### Window Management
| Key | Description |
|-----|-------------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to down window |
| `<C-k>` | Move to up window |
| `<C-l>` | Move to right window |

> Check `:WhichKey` for a complete list of keybindings

## Customization

### Adding Plugins

Create a new file in `lua/plugins/` directory:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end
}
```

lazy.nvim will automatically detect and load it.

### Modifying Options

Edit `lua/config/options.lua` to change Neovim settings.

### Custom Keymaps

Add your custom keymaps in `lua/config/keymaps.lua`.

## Troubleshooting

### Plugins not loading
```vim
:Lazy sync
```

### LSP not working
1. Check if language server is installed: `:Mason`
2. Check LSP status: `:LspInfo`

### Treesitter issues
```vim
:TSUpdate
```

## Credits

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- And all other amazing plugin authors!

## License

MIT
