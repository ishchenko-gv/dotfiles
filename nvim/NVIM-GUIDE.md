# Neovim Config Maintenance Guide

## File structure

```
nvim/
├── init.lua                    # Entry point — just loads config.lazy
├── lazyvim.json                # LazyVim extras registry (auto-managed by :LazyExtras)
├── lazy-lock.json              # Pinned plugin versions (commit to git!)
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # lazy.nvim bootstrap + plugin spec imports
│   │   ├── options.lua         # vim.opt / vim.g settings (loads BEFORE plugins)
│   │   ├── keymaps.lua         # Custom keymaps (loads on VeryLazy)
│   │   └── autocmds.lua        # Custom autocommands (loads on VeryLazy)
│   └── plugins/
│       ├── colorscheme.lua     # Themes and colorscheme selection
│       ├── editor.lua          # Telescope, trouble, treesitter
│       ├── lsp.lua             # LSP servers, mason, formatters, linters
│       └── ui.lua              # Snacks, lualine, noice, etc.
```

## Load order

1. `init.lua` → `config/lazy.lua`
2. `config/options.lua` — runs before any plugin loads
3. `lazyvim.plugins` — LazyVim core (always first in spec)
4. `lazyvim.plugins.extras.*` — LazyVim extras (always second)
5. `plugins/*` — your custom specs (last — can override anything above)
6. `config/keymaps.lua` + `config/autocmds.lua` — run on VeryLazy event

**Never** put `lazyvim.plugins.extras` imports inside `plugins/` files. They must go in `lazy.lua` between core and your plugins.

## Rules for plugin specs

### One spec per plugin
Each plugin should have **one** spec (or multiple non-conflicting specs). Never configure a plugin and then disable it in the same file.

### Don't pass empty opts
```lua
-- BAD: wipes all LazyVim defaults
{ "folke/snacks.nvim", opts = {} }

-- GOOD: only override what you need
{ "folke/snacks.nvim", opts = { picker = { win = { preview = { wo = { wrap = true } } } } } }

-- GOOD: omit the spec entirely if you don't need to change anything
```

### Don't pin commits in specs
`lazy-lock.json` handles reproducibility. Pinning `commit = "..."` in specs prevents updates and causes drift. Let the lock file do its job.

### Use `config/options.lua` for global settings
```lua
-- Put vim.g and vim.opt in options.lua, NOT in plugin files
vim.g.snacks_animate = false
```

### Use `init` vs `config` correctly
- `init` runs **before** the plugin loads — no plugin APIs available yet
- `config` runs **after** the plugin loads — safe to call plugin APIs
- If you get "attempt to index nil" errors in `init`, move the code to `config`

## Using LazyVim extras

LazyVim extras are curated bundles that set up LSP, treesitter, formatters, and linters for a language. Always prefer them over manual setup.

Browse available extras:
```
:LazyExtras
```

Add an extra by toggling it in `:LazyExtras` (updates `lazyvim.json` automatically) or manually in `lazy.lua`:
```lua
spec = {
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  { import = "lazyvim.plugins.extras.lang.typescript" },  -- extras go here
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "plugins" },                                  -- your specs last
},
```

## Updating plugins safely

### Before updating
```bash
# Commit your lock file so you can roll back
git add nvim/lazy-lock.json
git commit -m "nvim: snapshot lock file"
```

### Update
Inside Neovim:
```
:Lazy update
```

### If something breaks
```
:Lazy restore
```
This rolls back all plugins to the versions in `lazy-lock.json`.

Or from git:
```bash
git checkout -- nvim/lazy-lock.json
# then :Lazy restore inside Neovim
```

### After confirming updates work
```bash
git add nvim/lazy-lock.json
git commit -m "nvim: update plugins"
```

## Debugging

| Command | Purpose |
|---|---|
| `:checkhealth` | Diagnose common issues |
| `:Lazy health` | Check lazy.nvim health |
| `:Lazy log` | See recent plugin changes |
| `:Lazy profile` | Find slow plugins |
| `:Lazy restore` | Roll back to lock file |
| `nvim --clean` | Start without any config (isolate the problem) |

### Bisecting a broken config
1. Comment out all files in `plugins/` except one
2. Restart Neovim
3. Add files back one at a time until the error reappears
4. The last file you added contains the issue

## Adding a new plugin

1. Pick the right file in `plugins/` (or create a new one if it's a new category)
2. Add the minimal spec — only set `opts` you actually need to change
3. Restart Neovim (`:Lazy` will auto-install)
4. Commit both the plugin file and `lazy-lock.json`

## Adding a new language

1. Check `:LazyExtras` for an existing extra (e.g. `lazyvim.plugins.extras.lang.rust`)
2. If it exists, enable it there — done
3. If not, add treesitter parsers in `editor.lua`, LSP server in `lsp.lua`, and mason tools in `lsp.lua`
