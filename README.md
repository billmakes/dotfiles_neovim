# Neovim Keybinds Documentation

This document provides an organized overview of all the custom keybinds defined in my Neovim configuration.

**Leader key:** `<Space>`

## Navigation & Scrolling

| Mode | Key        | Action                                        |
|------|------------|-----------------------------------------------|
| `n`  | `<C-d>`    | Scroll down half page, keep cursor centered   |
| `n`  | `<C-u>`    | Scroll up half page, keep cursor centered     |
| `n`  | `n`        | Next search result, keep cursor centered      |
| `n`  | `N`        | Previous search result, keep cursor centered  |
| `n`  | `<S-TAB>`  | Switch to previous buffer                     |

---

## File Explorer (Oil)

| Mode | Key         | Action                  |
|------|-------------|-------------------------|
| `n`  | `<leader>e` | Open Oil file explorer  |

---

## Line Manipulation

| Mode | Key | Action                            |
|------|-----|-----------------------------------|
| `n`  | `J` | Join lines without moving cursor  |
| `v`  | `J` | Move selected lines down          |
| `v`  | `K` | Move selected lines up            |

---

## Indentation (Visual Mode)

| Mode | Key | Action                     |
|------|-----|----------------------------|
| `v`  | `<` | Indent left and reselect   |
| `v`  | `>` | Indent right and reselect  |

---

## Clipboard & Delete Operations

| Mode     | Key         | Action                            |
|----------|-------------|-----------------------------------|
| `x`      | `<leader>p` | Paste without replacing clipboard |
| `n`, `v` | `<leader>d` | Delete to black hole register     |

---

## Search & Replace

| Mode | Key         | Action                                |
|------|-------------|---------------------------------------|
| `n`  | `<Esc>`     | Clear search highlights               |
| `n`  | `<leader>s` | Replace word under cursor (on line)   |

---

## Quickfix List

| Mode | Key         | Action                                      |
|------|-------------|---------------------------------------------|
| `n`  | `<C-k>`     | Next quickfix item (centered)               |
| `n`  | `<C-j>`     | Previous quickfix item (centered)           |
| `n`  | `<leader>q` | Open quickfix list                          |
| `n`  | `<leader>Q` | Close quickfix list                         |

---

## Location List

| Mode | Key         | Action                                      |
|------|-------------|---------------------------------------------|
| `n`  | `<leader>k` | Next location list item (centered)          |
| `n`  | `<leader>j` | Previous location list item (centered)      |

---

## Mode & Config

| Mode | Key          | Action                       |
|------|--------------|------------------------------|
| `i`  | `<C-c>`      | Escape insert mode           |
| `n`  | `Q`          | Disabled (no-op)             |
| `n`  | `<leader>rl` | Reload Neovim config         |

---

## FzfLua (Fuzzy Finder)

| Mode | Key         | Action                         |
|------|-------------|--------------------------------|
| `n`  | `<leader>fc`| Open FzfLua command picker     |
| `n`  | `<leader>ff`| Find files in git repo         |
| `n`  | `<leader>fb`| List open buffers              |
| `n`  | `<leader>fg`| Grep across project            |
| `n`  | `<leader>fl`| Repeat last grep               |
| `n`  | `<leader>fh`| Search help tags               |
| `n`  | `<leader>fs`| Browse git stash               |
| `n`  | `<leader>fd`| Document diagnostics           |

### FzfLua Window Keybinds

| Context  | Key       | Action                    |
|----------|-----------|---------------------------|
| builtin  | `<C-f>`   | Scroll preview down       |
| builtin  | `<C-b>`   | Scroll preview up         |
| builtin  | `<C-p>`   | Toggle preview pane       |
| fzf      | `ctrl-a`  | Toggle all selections     |
| fzf      | `ctrl-t`  | Jump to first result      |
| fzf      | `ctrl-g`  | Jump to last result       |
| fzf      | `ctrl-d`  | Scroll results down       |
| fzf      | `ctrl-u`  | Scroll results up         |

### FzfLua File Actions

| Key       | Action                              |
|-----------|-------------------------------------|
| `ctrl-q`  | Send selection to quickfix          |
| `ctrl-n`  | Toggle gitignore filter             |
| `ctrl-h`  | Toggle hidden files                 |
| `enter`   | Open file or send multiple to qf    |

---

## LSP

| Mode | Key         | Action                          |
|------|-------------|---------------------------------|
| `n`  | `K`         | Show hover documentation        |
| `n`  | `gd`        | Go to definition                |
| `n`  | `gr`        | Show references                 |
| `n`  | `<C-f>`     | Format buffer                   |
| `n`  | `<leader>la`| Code action menu                |
| `n`  | `<leader>ld`| Show diagnostic in float        |
| `n`  | `<leader>lj`| Next diagnostic                 |
| `n`  | `<leader>lk`| Previous diagnostic             |
| `n`  | `<leader>lb`| List buffer diagnostics (FzfLua)|
| `n`  | `<leader>lg`| List workspace diagnostics      |
| `n`  | `<leader>lr`| List references (FzfLua)        |

---

## Gitsigns

### Hunk Navigation

| Mode | Key  | Action                              |
|------|------|-------------------------------------|
| `n`  | `]c` | Next git hunk (or diff change)      |
| `n`  | `[c` | Previous git hunk (or diff change)  |

### Staging & Reset

| Mode | Key          | Action                    |
|------|--------------|---------------------------|
| `n`  | `<leader>hs` | Stage hunk under cursor   |
| `n`  | `<leader>hr` | Reset hunk under cursor   |
| `v`  | `<leader>hs` | Stage selected lines      |
| `v`  | `<leader>hr` | Reset selected lines      |
| `n`  | `<leader>hS` | Stage entire buffer       |
| `n`  | `<leader>hR` | Reset entire buffer       |

### Preview & Diff

| Mode | Key          | Action                    |
|------|--------------|---------------------------|
| `n`  | `<leader>hp` | Preview hunk in popup     |
| `n`  | `<leader>hi` | Preview hunk inline       |
| `n`  | `<leader>hd` | Diff against index        |
| `n`  | `<leader>hD` | Diff against last commit  |

### Blame & Quickfix

| Mode | Key          | Action                            |
|------|--------------|-----------------------------------|
| `n`  | `<leader>hb` | Show full blame for current line  |
| `n`  | `<leader>hq` | Send buffer hunks to quickfix     |
| `n`  | `<leader>hQ` | Send all hunks to quickfix        |

### Toggles

| Mode | Key          | Action                |
|------|--------------|-----------------------|
| `n`  | `<leader>tb` | Toggle inline blame   |
| `n`  | `<leader>tw` | Toggle word diff      |

### Text Object

| Mode     | Key  | Action              |
|----------|------|---------------------|
| `o`, `x` | `ih` | Select hunk (inner) |

---

## Blink.cmp (Completion)

| Mode | Key       | Action                              |
|------|-----------|-------------------------------------|
| `i`  | `<CR>`    | Accept completion or newline        |
| `i`  | `<C-y>`   | Toggle completion/docs              |
| `i`  | `<C-n>`   | Select and accept completion        |
| `i`  | `<C-k>`   | Select previous item                |
| `i`  | `<C-j>`   | Select next item                    |
| `i`  | `<C-b>`   | Scroll docs down                    |
| `i`  | `<C-f>`   | Scroll docs up                      |
| `i`  | `<C-l>`   | Jump to next snippet placeholder    |
| `i`  | `<C-h>`   | Jump to previous snippet placeholder|

### Command Line Completion

| Mode | Key    | Action                      |
|------|--------|-----------------------------|
| `c`  | `<CR>` | Accept and execute command  |
