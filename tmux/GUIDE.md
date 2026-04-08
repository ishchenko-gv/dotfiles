# Tmux Guide

Prefix is `C-a` (Ctrl+a). Most commands start with prefix.

## Sessions

| Command | Action |
|---|---|
| `tmux new -s name` | New session |
| `tmux attach -t name` | Attach to session |
| `tmux ls` | List sessions |
| `tmux kill-session -t name` | Kill session |
| `tmux kill-server` | Kill everything |
| `prefix d` | Detach |
| `prefix s` | Switch session (interactive) |
| `prefix $` | Rename session |
| `prefix (` / `prefix )` | Previous / next session |

## Windows (tabs)

| Key | Action |
|---|---|
| `prefix c` | New window |
| `prefix ,` | Rename window |
| `prefix n` / `prefix p` | Next / previous window |
| `prefix 1-9` | Jump to window by number |
| `prefix l` | Last (toggle) window |
| `prefix w` | List all windows (interactive picker) |
| `prefix &` | Close window |
| `prefix .` | Move window to another index |

## Panes

| Key | Action |
|---|---|
| `prefix \|` | Split horizontally |
| `prefix -` | Split vertically |
| `Alt+h/j/k/l` | Navigate panes (no prefix needed) |
| `prefix H/J/K/L` | Resize pane |
| `prefix x` | Close pane |
| `prefix z` | Toggle pane fullscreen (zoom) |
| `prefix q` | Show pane numbers, then press number to jump |
| `prefix {` / `prefix }` | Swap pane left / right |
| `prefix !` | Convert pane to a new window |
| `prefix Space` | Cycle through pane layouts |

## Copy mode

Enter with `prefix [`. Navigation is vim-style.

| Key | Action |
|---|---|
| `h/j/k/l` | Move cursor |
| `w` / `b` | Next / previous word |
| `0` / `$` | Start / end of line |
| `g` / `G` | Top / bottom of buffer |
| `C-u` / `C-d` | Half page up / down |
| `C-b` / `C-f` | Full page up / down |
| `/` / `?` | Search forward / backward |
| `n` / `N` | Next / previous search match |
| `v` | Start selection |
| `V` | Select line |
| `C-v` | Rectangle (block) selection |
| `y` | Copy to clipboard and exit |
| `Enter` | Copy to clipboard and exit |
| `Escape` | Clear selection |
| `q` | Exit copy mode |

Mouse wheel also enters copy mode and scrolls.

## Command mode

Press `prefix :` to enter the tmux command prompt. Useful commands:

| Command | Action |
|---|---|
| `list-keys` | Show all keybindings |
| `list-keys -T copy-mode-vi` | Show copy mode bindings |
| `show-options -g` | Show global options |
| `show-options -gw` | Show global window options |
| `display-message "#{...}"` | Show a tmux variable |
| `capture-pane -p` | Print pane contents to stdout |
| `swap-window -t N` | Swap current window with window N |
| `move-pane -t session:window` | Move pane to another window/session |
| `join-pane -t session:window` | Join pane into another window |
| `break-pane` | Convert pane to its own window |
| `select-layout tiled` | Arrange panes in a grid |

You can also run these from the shell with `tmux <command>`.

## Useful shell commands

```bash
tmux list-keys                        # all keybindings
tmux list-keys | grep <pattern>       # find a specific binding
tmux show-environment                 # environment variables
tmux display -p '#{pane_current_path}'  # current pane's working directory
tmux capture-pane -p -S -100          # dump last 100 lines of pane
tmux pipe-pane -o 'cat >> ~/tmux.log' # log pane output to file (toggle)
tmux source-file ~/.config/tmux/tmux.conf  # reload config from shell
```

## Plugins (TPM)

| Key | Action |
|---|---|
| `prefix I` | Install plugins |
| `prefix U` | Update plugins |
| `prefix alt+u` | Remove unlisted plugins |

Add plugins in `tmux.conf` before the TPM init line:

```tmux
set -g @plugin 'author/plugin-name'
```

## Resurrect (session persistence)

| Key | Action |
|---|---|
| `prefix C-s` | Save session |
| `prefix C-r` | Restore session |

Sessions survive system restarts. Saved to `~/.tmux/resurrect/`.

## Config maintenance

- Config lives at `~/.dotfiles/tmux/tmux.conf`
- Symlink: `ln -sf ~/.dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf`
- Reload: `prefix r`
- Plugin files live in `~/.tmux/plugins/` (managed by TPM, not in dotfiles)
- After editing plugin list: `prefix I` to install, `prefix alt+u` to clean up

## Troubleshooting

| Problem | Fix |
|---|---|
| Bindings not working | Reload config: `prefix r` |
| Colors look wrong | Check `default-terminal` and `terminal-overrides` in config |
| Copy not going to clipboard | Verify `pbcopy` works: `echo test \| pbcopy` |
| Plugin not loading | Make sure it's declared before `run '~/.tmux/plugins/tpm/tpm'` |
| Slow Escape in vim | `escape-time` should be `0` in config |
| Can't find a keybinding | `prefix :list-keys` or `tmux list-keys \| grep <pattern>` |
