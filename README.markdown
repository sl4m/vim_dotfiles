# vim-dotfiles

This repo contains both vim and Neovim configurations. Choose your own path.

* [Neovim](#neovim-requirements)
* [Vim](#vim-requirements)

## Neovim Requirements

* neovim
* fzf (fuzzy finder)

For macOS, install the latest stable `neovim` and `fzf via homebrew:

    homebrew install fzf neovim

For Linux, use your distro's package manager.

These dotfiles work on neovim 0.9.2 or later.

### Install

After cloning the project, run the following setup script for neovim:

    ./setup_nvim

WARNING: running `./setup_nvim` will overwrite the existing init.lua and files under `~/.config/nvim/`

### LSP/DAP

[mason.nvim](https://github.com/williamboman/mason.nvim) is included to install LSPs, DAPs, linters, and formatters. The following LSP/DAPs are added by default. See [here](nvim/lua/config/daplsp_list.lua).

### Notes

This uses [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins, [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting, and Chris Kempson's [Tomorrow Night](https://github.com/chriskempson/vim-tomorrow-theme/) colorscheme by default.

Default languages installed are available [here](nvim/lua/config/lang_list.lua).

Supported languages are available [here](https://github.com/nvim-treesitter/nvim-treesitter/?tab=readme-ov-file#supported-languages).

### Credit

Some things were also taken from [here](https://github.com/jonhoo/configs).


## Vim Requirements

For macOS, install the latest stable `vim` via homebrew:

    homebrew install vim

For Linux, install the latest vim using your distro's package manager

These dotfiles work on vim 8.0.1453 and up.

### Install

After cloning the project, run the following setup script for vim:

    ./setup_vim

WARNING: running `./setup_vim` will overwrite the existing .vim and .vimrc in your home directory.

### Requirements for coc.nvim plugin

[coc.nvim](https://github.com/neoclide/coc.nvim) plugin provides an intellisense engine plus full support for the language server protocol.

For MacOS, install `node` via homebrew:

    homebrew install node

For Linux, install the latest node (>= 8.10) using your distro's package manager

To enable Rust Analyzer extension for Rust:

    # Start vim
    vim
    :CocInstall coc-rust-analyzer

For other languages, browse [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions) for coc extensions.

### Notes

This uses [vim-plug](https://github.com/junegunn/vim-plug) for managing plugins. It also uses Chris Kempson's [Tomorrow Night](https://github.com/chriskempson/vim-tomorrow-theme/) colorscheme by default.

### Credit

This was originally a fork of Drew Olsen's [vim_dotfiles](https://github.com/drewolson/vim_dotfiles). Some things were also taken from [here](https://bitbucket.org/sjl/dotfiles).
