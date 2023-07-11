# Skylovescoffee's Neovim Config

Welcome to my personal Neovim configuration repository! This repo reflects my ongoing journey with Neovim as I tinker, explore, and slowly customize it to my liking. The goal isn't to achieve the 'best' configuration but rather to develop something unique that fits my own needs and preferences.

## About Neovim

Neovim is a highly configurable text editor built to enable efficient text editing. It's an extension of Vim that includes many refinements and new features making it one of the most potent text-editors available today.

## My Neovim Journey

As I venture into the world of Neovim, this repository will be updated periodically with the latest tweaks, plugins, and settings I've found useful or interesting. My current focus is exploring the versatility of Neovim and tailoring it to improve my personal workflow.

<!-- ## To-do -->

## Prerequisites
1. Install [ripgrep](https://github.com/BurntSushi/ripgrep).
2. (Optional) Prettier `npm i -g prettier`
3. (Optional) [jq](https://github.com/jqlang/jq) if you want to read tab width from .prettierrc
4. (Optional) [js-beautify](https://github.com/beautify-web/js-beautify)
   
## Getting Started

To use this configuration, follow the steps below:

1. Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

2. Clone this repository:

   ```
   git clone https://github.com/skylovescoffee/neovim-config.git ~/.config/nvim
   ```
3. Install the required plugins. This config uses [Packer](https://github.com/wbthomason/packer.nvim) as a package manager. Follow the instructions from Packer's official repository to install it. Once you've installed Packer, you can install the plugins with the following command inside Neovim:

   ```
   :PackerSync
   ```

Remember to restart Neovim to apply the changes.

4. Restart Neovim to apply the changes.

## Config Highlights

This configuration currently includes:

- Various settings for a smooth and user-friendly editing experience
- Keybinding customizations for more intuitive and efficient navigation
- A curated list of plugins for added functionality and ease of use

Remember, the main aim of this configuration isn't to be the 'best' or 'definitive' but to cater to my specific needs as they evolve over time. Feel free to fork, modify, or take inspiration from it for your personal journey with Neovim.

## Feedback and Contributions

I am open to feedback, suggestions, and improvements. If you have a cool trick or a plugin that you think I should know about, don't hesitate to open an issue or a pull request. 

## Disclaimer

As this is my personal configuration and it's constantly evolving, there might be occasional breakages or conflicts. It's best to understand what each line of code does before using it in your setup.

## License

This project is licensed under the [MIT License](LICENSE).

Happy Vimming!
