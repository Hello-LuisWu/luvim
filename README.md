# 目录
- [🔖 nvim-pack-config](#🔖-nvim-pack-config)
  - [🧰 所需外部依赖软件](#🧰-所需外部依赖软件)
    - [额外知识补充](#额外知识补充)
  - [🔨 install neovim](#🔨-install-neovim)
    - [macOS](#macos)
    - [Arch(manjaro)](#arch(manjaro))
    - [Ubuntu](#ubuntu)
    - [Windows](#windows)
  - [🧹 清除旧配置（重装建议）](#🧹-清除旧配置（重装建议）)
    - [macOS/Linux 备份旧配置](#macos/linux-备份旧配置)
    - [Windows 备份旧配置](#windows-备份旧配置)
  - [⛓️‍💥 克隆配置文件](#⛓️‍💥-克隆配置文件)
  - [🗃️ Files](#🗃️-files)
  - [🚀 启动与首次初始化](#🚀-启动与首次初始化)

# 🔖 nvim-pack-config

**高性能·模块化·开箱即用**:基于 neovim pack 原生插件管理器, 适用于开发者的 Neovim 配置，支持 LSP、自动补全、代码格式化、语法高亮、美化 UI 等功能。

---

## 🧰 所需外部依赖软件

以下是使用本配置前需要在系统中安装的软件：

- 💚 [Neovim](https://neovim.io/doc/install/): >= 0.12.3; nvim 是整个配置的核心软件
- 🐙 [Git](https://git-scm.com/install/): >= 2.19.0; 下载和更新插件
- 🔎 [fzf](https://github.com/junegunn/fzf): 被 [fzf-lua](https://github.com/ibhagwan/fzf-lua) 用于文件搜索
- 🔖 [ripgrep (rg)](https://github.com/BurntSushi/ripgrep):  被 fzf-lua 用于全局内容搜索。
- 🌳 [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md): 生成、调试和管理语法解析器。
- 🗜️ [gcc](https://github.com/Hello-LuisWu/DataBank/blob/main/01-%E8%AE%A1%E7%AE%97%E6%9C%BA/tools/gcc/gcc-install.md)：编译部分 C 的插件（如 Treesitter 语法解析器编译依赖）
- 🛠️ [cl](https://visualstudio.microsoft.com/zh-hans/downloads/?utm_source=chatgpt.com#remote-tools-for-visual-studio-2026): Windows 下编译 C 的插件
- 🔩 [make](https://www.gnu.org/software/make/): 某些插件需要构建步骤
- 🧵 [Node](https://nodejs.org/zh-cn/download): 安装 LSP/格式化/markdown 等与 js 相关的工具
- 🌐 [curl](https://curl.se/download.html): 用于 blink.cmp 等插件下载/请求资源
- 🏞️ [pngpaste](https://github.com/jcsalterego/pngpaste) (macOS): 被 [img-clip](https://github.com/HakonHarnes/img-clip.nvim) 插件用于图片粘贴。
    - Linux: [xclip](https://github.com/astrand/xclip) (x11) or  [wl-clipboard](https://github.com/bugaevc/wl-clipboard) (Wayland)
    - Windows: 没有要求
- 🌀 [Nerd Font](https://www.nerdfonts.com/#home): 有图标的编程字体，用于美化界面。

### 额外知识补充

Neovim 内置 Tree-sitter 负责“运行/调用已经存在的语法解析器（Parser）”；tree-sitter-cli 主要负责“生成、编译、测试和调试语法解析器”。

查看有哪些 Parser:

- 查看当前已安装的 Parser: `lua print(vim.inspect(vim.api.nvim_get_runtime_file("parser/*.so", true)))`
    - 简洁查看: `:lua for _, v in ipairs(vim.api.nvim_get_runtime_file("parser/*.so", true)) do print(v) end`
- 查看当前文件使用的 Parser: `:InspectTree`
- 查看 Parser 是否正常: `:checkhealth vim.treesitter`


## 🔨 install neovim

### macOS 

```sh
brew install neovim
```

### Arch(manjaro)

```sh
sudo pacman -S neovim
```

### Ubuntu

```sh
# instsll using apt
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# Or use snap for installation
sudo snap install nvim --classic
```

### Windows



## 🧹 清除旧配置（重装建议）

如需重新安装配置，先清除旧版本相关目录：

### macOS/Linux 备份旧配置

```sh
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

## 或者直接删除目录
rm -rf ~/.config/nvim/ ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/
```

将删除以下目录(macOS/Linux)：

- `~/.config/nvim/`：主配置目录
- `~/.local/share/nvim/`：插件安装目录
- `~/.local/state/nvim/`：状态信息目录
- `~/.cache/nvim/`：缓存目录

### Windows 备份旧配置

```sh
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

## ⛓️‍💥 克隆配置文件

```sh
# macOS/Linux
git clone --depth 1 https://github.com/Hello-LuisWu/luvim ~/.config/nvim

# Windows
git clone --depth 1 https://github.com/Hello-LuisWu/luvim $env:LOCALAPPDATA\nvim
```

## 🗃️ Files

nvim 主目录文件树

```sh
 .
├──  init.lua
├──  keymaps.md
├──  lua
│   ├──  config
│   │   ├──  autocmd.lua
│   │   ├──  keymap.lua
│   │   ├──  option.lua
│   │   └──  pack.lua
│   ├──  plugins
│   │   ├──  align.lua
│   │   ├──  alpha.lua
│   │   ├──  autopairs.lua
│   │   ├──  blink.lua
│   │   ├──  bufferline.lua
│   │   ├──  colorizer.lua
│   │   ├──  comment.lua
│   │   ├──  flash.lua
│   │   ├──  fzf.lua
│   │   ├──  lazygit.lua
│   │   ├──  lsp.lua
│   │   ├──  lualine.lua
│   │   ├──  md-autolist.lua
│   │   ├──  md-img-clip.lua
│   │   ├──  md-preview.lua
│   │   ├──  md-table-mode.lua
│   │   ├──  neotree.lua
│   │   ├──  surround.lua
│   │   ├──  todo-comments.lua
│   │   ├──  treesitter.lua
│   │   └──  wk.lua
│   └──  utils
│       └──  loader.lua
├──  nvim-pack-lock.json
├── 󰂺 README.md
└──  telescope.lua
```

## 🚀 启动与首次初始化

第一次运行：

```sh
nvim
```

> ⚠️ **注意：** 首次启动 Neovim 时，需要从 [GitHub](https://www/github.com) 下载并克隆插件到本地; treesitter 也要从 GitHub 下载语法解析器。请确认当前网络可以正常访问 GitHub；如果无法访问，请先配置代理后再启动 Neovim，否则插件将无法正常安装和运行。

如果报错，请根据提示排除，检查网络问题，或手动安装缺失依赖。

> 你可以在这里查看所有的快捷键映射: ⌨️ [keymaps](https://github.com/Hello-LuisWu/luvim/blob/main/keymaps.md)

🤓 欢迎提交 [issue](https://github.com/Hello-LuisWu/luvim/issues/new) 或联系作者优化配置：[Luis Wu](https://github.com/Hello-LuisWu) 
