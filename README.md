# 💤 LazyVim Configuration by Praczet

A customized configuration for [LazyVim](https://github.com/LazyVim/LazyVim), tailored to fit my personal workflow and plugin preferences.

## Introduction

This configuration is based on the original [LazyVim](https://github.com/LazyVim/LazyVim) template, which provides a modular and extensible framework for Neovim. My setup enhances the default settings by adding custom plugins and personal optimizations that make Neovim more suited for my daily use as a developer and note-taker.

![lazyvim-config](https://github.com/user-attachments/assets/5f3de384-bbd2-44ae-9256-d223877a1835)

## My Changes

Here are some of the significant changes I've made to the original LazyVim setup:

- **Dashboard Customizations**: The dashboard has been extensively customized to improve productivity by integrating several of my plugins:
  - **Next-Birthday**: Displays upcoming birthdays using data from my personal markdown file (`~/Notes/me-social.md`). This ensures that important dates are easily visible right from my Neovim start screen.
  - **Little-Taskwarrior**: Integrates a lightweight task management interface directly into the dashboard, configured with an urgency threshold of `7`. This helps prioritize important tasks without leaving Neovim.
  - **Last Five Notes**: Displays the five most recently added or modified notes from my markdown collection, allowing quick access to the latest notes.
- **PDFExport** - a function to export MarkDown file to PDF. It supports callouts, mermaid, darkTheme (I shall write more about it)
- **Custom fold_virt_text_handler** - a handler for [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) plugin. It puts second line of DocComment to the folded text.. I will show below (not now)

## My Plugins (Written and Used by Me)

Below is the list of plugins that I have personally developed and included in my configuration:

- **[Praczet/yaml-tags.nvim](https://github.com/Praczet/yaml-tags.nvim)**: A plugin to facilitate using tags in the yaml front matter
- **[Praczet/sql-command.nvim](https://github.com/Praczet/sql-command.nvim)**: Allows to run SQL query for specific database (current line or selection)
- **[Praczet/encrypt-text.nvim](https://github.com/Praczet/encrypt-text.nvim)**: A plugin to encrypt text directly within Neovim, providing a lightweight and convenient encryption solution.
- **[Praczet/next-birthday.nvim](https://github.com/Praczet/next-birthday.nvim)**: Keeps track of upcoming birthdays, using data from my personal markdown notes (`~/Notes/me-social.md`).
- **[Praczet/habits-tracker.nvim](https://github.com/Praczet/habits-tracker.nvim)**: A plugin to manage and track daily habits within Neovim. Configured to start the week on Monday, and allows tracking of multiple personal habits.
- **[Praczet/little-taskwarrior.nvim](https://github.com/Praczet/little-taskwarrior.nvim)**: A plugin to display Tasks from the taskwarriot. It can be integrated in dashboard.
- **[Praczet/words-the-def.nvim](https://github.com/Praczet/words-the-def.nvim)**: Displays a word's definition, synonyms. It uses datamuse.com's API
- **[Praczet/markdown-links.nvim](https://github.com/Praczet/markdown-links.nvim)**: LIttle helper for selecting files for markdown notes 

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
