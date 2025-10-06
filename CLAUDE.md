# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration repository using lazy.nvim as the plugin manager. The configuration follows a modular structure where each plugin gets its own configuration file.

## Architecture

### Bootstrap Flow
1. `init.lua` - Entry point that sets leader keys, bootstraps lazy.nvim, and loads core configs
2. `lua/config/lazy.lua` - Bootstraps lazy.nvim, auto-imports all plugins from `lua/plugins/`
3. `lua/config/options.lua` - General Neovim settings (line numbers, tabs, search, etc.)
4. `lua/config/keymaps.lua` - Global keybindings

### Plugin System
- **Auto-loading**: Any Lua file added to `lua/plugins/` is automatically loaded by lazy.nvim
- Each plugin file returns a table/array of plugin specs
- lazy.nvim handles installation, loading, and dependency management

### Key Plugin Architecture Patterns

**LSP Setup** (`lua/plugins/lsp.lua`):
- Uses Mason for LSP server installation
- mason-lspconfig bridges Mason and nvim-lspconfig
- Capabilities are enhanced with cmp-nvim-lsp for completion support
- Each language server is configured in the mason_lspconfig handlers

**Completion** (`lua/plugins/cmp.lua`):
- nvim-cmp orchestrates multiple completion sources
- Sources: LSP, buffer text, filesystem paths, luasnip snippets
- Integrates with LuaSnip for snippet expansion

**Formatting & Linting**:
- `conform.nvim` for formatting (format on save enabled)
- `nvim-lint` for linting (triggered on text change and buffer events)
- Both are configured per-filetype

## Development Workflow

### Testing Configuration Changes
1. Edit files in `lua/config/` or `lua/plugins/`
2. Restart Neovim or run `:source %` to reload current file
3. For plugin changes, run `:Lazy sync` to update plugins

### Adding New Plugins
Create a new file in `lua/plugins/` with this structure:
```lua
return {
  "author/plugin-name",
  dependencies = { "optional-dependency" },
  config = function()
    -- Plugin setup here
  end
}
```

### Installing LSP Servers
- Open `:Mason` to browse and install language servers
- Or configure in `lua/plugins/lsp.lua` ensure_installed table for auto-installation

### Managing Plugins
- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Install/update/clean plugins
- `:Lazy update` - Update all plugins

### Debugging
- `:checkhealth` - Run health checks for Neovim and plugins
- `:LspInfo` - Check LSP server status
- `:TSUpdate` - Update Tree-sitter parsers
- `:Mason` - Check installed LSP servers, formatters, linters

## Configuration Locations

### Core Settings
- Editor options: `lua/config/options.lua`
- Keybindings: `lua/config/keymaps.lua`
- Leader key: Space (set in `init.lua`)

### Plugin-Specific Keybindings
Most plugin keybindings are defined within their respective plugin config files, not in `lua/config/keymaps.lua`. Check the plugin file directly for its keybindings.

## Important Notes

- **Lazy Loading**: Plugins can be lazy-loaded based on events, commands, or filetypes in their spec
- **Lock File**: `lazy-lock.json` pins plugin versions - commit this for reproducible installs
- **Data Directory**: Plugins install to `~/.local/share/nvim/lazy/`
- **Undo History**: Persistent undo stored in `~/.vim/undodir/`
