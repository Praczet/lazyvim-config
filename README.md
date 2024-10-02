# 💤 LazyVim Configuration by Praczet

A customized configuration for [LazyVim](https://github.com/LazyVim/LazyVim), tailored to fit my personal workflow and plugin preferences.

## Introduction

This configuration is based on the original [LazyVim](https://github.com/LazyVim/LazyVim) template, which provides a modular and extensible framework for Neovim. My setup enhances the default settings by adding custom plugins and personal optimizations that make Neovim more suited for my daily use as a developer and note-taker.

![lazyvim-config](https://github.com/user-attachments/assets/5f3de384-bbd2-44ae-9256-d223877a1835)

## My Changes

Here are some of the significant changes I've made to the original LazyVim setup:

- **Disabled `cursorline`** for better performance.
- Set `foldlevel` to `201` and adjusted `foldlevelstart` to `-1` for improved folding behavior.
- Customized `foldcolumn` to `"1"` to show a single-column fold indicator.
- Tweaked `laststatus` to `2` to always display the status line.
- **Dashboard Customizations**: The dashboard has been extensively customized to improve productivity by integrating several of my plugins:
  - **Next-Birthday**: Displays upcoming birthdays using data from my personal markdown file (`~/Notes/me-social.md`). This ensures that important dates are easily visible right from my Neovim start screen.
  - **Little-Taskwarrior**: Integrates a lightweight task management interface directly into the dashboard, configured with an urgency threshold of `7`. This helps prioritize important tasks without leaving Neovim.
  - **Last Five Notes**: Displays the five most recently added or modified notes from my markdown collection, allowing quick access to the latest notes.

## My Plugins (Written and Used by Me)

Below is the list of plugins that I have personally developed and included in my configuration:

- **[Praczet/encrypt-text.nvim](https://github.com/Praczet/encrypt-text.nvim)**: A plugin to encrypt text directly within Neovim, providing a lightweight and convenient encryption solution.
- **[Praczet/next-birthday.nvim](https://github.com/Praczet/next-birthday.nvim)**: Keeps track of upcoming birthdays, using data from my personal markdown notes (`~/Notes/me-social.md`).
- **[Praczet/habits-tracker.nvim](https://github.com/Praczet/habits-tracker.nvim)**: A plugin to manage and track daily habits within Neovim. Configured to start the week on Monday, and allows tracking of multiple personal habits.

## Other Plugins That I Use

In addition to my own plugins, I've integrated several other useful plugins to enhance the Neovim experience:

- **neovim/nvim-lspconfig**: Provides easy configuration for Neovim's built-in LSP, enhancing language server support.
- **cmp.nvim**: Configured with a source for file paths to improve autocompletion experience.
- **MeanderingProgrammer/render-markdown.nvim**: A plugin for rendering markdown in a visually appealing way, optimized for various markdown-like formats including `norg`, `rmd`, and `org`.

## Installation

To use this configuration:

1. Clone the repository:
   ```sh
   git clone https://github.com/Praczet/lazyvim-config.git ~/.config/nvim
   ```
2. Install the dependencies as mentioned in the LazyVim [documentation](https://lazyvim.github.io/installation).

## Suggestions and Feedback

I always welcome feedback and suggestions for improvements. If you see opportunities to enhance this configuration further, feel free to open an issue or contribute directly through a pull request.
