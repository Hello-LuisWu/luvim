| 快捷键         | 模式  | 功能说明                                   | 映射命令                                                     |
|----------------|-------|--------------------------------------------|--------------------------------------------------------------|
| `jj`           | i     | 退出插入模式回到普通模式                   | `<C-[>`                                                      |
| `<C-k>`        | i     | 退出插入，上方新开一行                     | `<C-[>O`                                                     |
| `<C-j>`        | i     | 退出插入，下方新开一行                     | `<C-[>o`                                                     |
| `<Tab>`        | n     | 快速输入冒号进入命令行                     | `:`                                                          |
| `p`            | v     | 可视化粘贴不会覆盖剪贴板                   | `P`                                                          |
| `U`            | n     | 重做（等价默认Ctrl+r）                     | `<C-r>`                                                      |
| `-`            | n     | 数字减1                                    | `<C-x>`                                                      |
| `v[`           | n     | 选中方括号内全部内容                       | `vi[`                                                        |
| `+`            | n     | 数字加1                                    | `<C-a>`                                                      |
| `<S-Tab>`      | n     | 快速进入搜索                               | `/`                                                          |
| `<BS>`         | n     | 开关搜索高亮                               | `:set hlsearch!<CR>`                                         |
| `<leader><CR>` | n     | 开启/关闭自动换行                          | `:set wrap!<CR>`                                             |
| `<leader>j`    | n、x  | 拼接当前行与下一行                         | `J`                                                          |
| `gF`           | n、v  | 全文件自动格式化缩进                       | `gg=G`                                                       |
| `W`            | n     | 向前跳5个单词                              | `5w`                                                         |
| `B`            | n     | 向后跳5个单词                              | `5b`                                                         |
| `L`            | n/o/v | 跳到当前行末尾                             | `$`                                                          |
| `H`            | n/o/v | 跳到当前行开头                             | `0`                                                          |
| `J`            | n/o/v | 跳转到文件最后一行                         | `G`                                                          |
| `K`            | n/o/v | 跳转到文件首行                             | `gg`                                                         |
| `<leader>tn`   | n     | 新建标签页                                 | `<Cmd>tabnew<CR>`                                            |
| `<leader>tc`   | n     | 关闭当前标签页                             | `<Cmd>tabclose<CR>`                                          |
| `<C-Tab>`      | n     | 切换下一个Buffer                           | `:bnext<CR>`                                                 |
| `<leader>bh`   | n     | 切换上一个Buffer                           | `:bprevious<CR>`                                             |
| `<leader>bq`   | n     | 关闭当前Buffer                             | `:bd<CR>`                                                    |
| `<C-f>`        | n     | 向下翻页，光标居中                         | `<C-f>zz`                                                    |
| `<C-b>`        | n     | 向上翻页，光标居中                         | `<C-b>zz`                                                    |
| `n`            | n     | 正向搜下一项，屏幕居中                     | `nzzzv`                                                      |
| `N`            | n     | 反向搜上一项，屏幕居中                     | `Nzzzv`                                                      |
| `g,`           | n     | 跳变更历史，光标居中                       | `g,zz`                                                       |
| `<C-j>`        | v、x  | 选中代码块整体向下移动一行并自动缩进       | `:m '>+1<CR>gv=gv`                                           |
| `<C-k>`        | v、x  | 选中代码块整体向上移动一行并自动缩进       | `:m '<-2<CR>gv=gv`                                           |
| `<`            | v     | 选中内容向左缩进，缩进后保持选中           | `<gv`                                                        |
| `>`            | v     | 选中内容向右缩进，缩进后保持选中           | `>gv`                                                        |
| `<S-tab>`      | v     | 选中内容向左缩进，保持选区                 | `<gv`                                                        |
| `<tab>`        | v     | 选中内容向右缩进，保持选区                 | `>gv`                                                        |
| `<C-h>`        | v     | 选中内容向左缩进，保持选区                 | `<gv`                                                        |
| `<C-l>`        | v     | 选中内容向右缩进，保持选区                 | `>gv`                                                        |
| `j`            | n     | 软换行向下跳转（按屏幕行）                 | `gj`                                                         |
| `k`            | n     | 软换行向上跳转（按屏幕行）                 | `gk`                                                         |
| `hh`           | i     | 退出插入模式，光标回到当前字符前继续输入   | `<c-[>i`                                                     |
| `ll`           | i     | 退出插入模式，光标跳到当前字符后继续输入   | `<c-[>a`                                                     |
| `<c-d>`        | i     | 复制当前行并在下方粘贴，进入插入模式       | `<c-[>yypa`                                                  |
| `<c-d>`        | n     | 复制当前行并在下方粘贴                     | `<c-[>yyp`                                                   |
| `<leader>ha`   | n     | 全局替换光标单词，每次替换需确认           | `:%s/\\<<c-r><c-w>\\>//gc<left><left><left>`                 |
| `<leader>hj`   | n     | 全局替换，手动填写替换内容无确认           | `:%s/<c-r><c-w>/`                                            |
| `<leader>hj`   | n     | 空白匹配，手动输入新旧内容替换带确认       | `:%s//gc<left><left><left>`                                  |
| `<leader>hh`   | n     | 仅在本行替换光标单词                       | `:s/<c-r><c-w>//<left>`                                      |
| `<leader>hh`   | v     | 全局替换选中内容，全部直接替换             | `"hy:%s/<c-r>h//g<left><left>`                               |
| `<leader>hh`   | v     | 全局替换选中内容，每处替换弹窗确认         | `"hy:%s/<c-r>h//gc<left><left><left>`                        |
| `<leader>hw`   | n     | 高亮文档内所有和光标一致的单词             | `:let @/ = '\<'.expand('<cword>').'\>'<bar>set hlsearch<cr>` |
| `<leader>tt`   | n     | 背景透明                                   | ...                                                          |
| `<C-h>`        | n     | 光标跳转至左侧分屏                         | `<C-w>h`                                                     |
| `<C-j>`        | n     | 光标跳转至下方分屏                         | `<C-w>j`                                                     |
| `<C-k>`        | n     | 光标跳转至上方分屏                         | `<C-w>k`                                                     |
| `<C-l>`        | n     | 光标跳转至右侧分屏                         | `<C-w>l`                                                     |
| `<leader>wc`   | n     | 关闭当前窗口                               | `<cmd>close<CR>`                                             |
| `<leader>wo`   | n     | 只保留当前窗口，关闭其余所有分屏           | `<cmd>only<CR>`                                              |
| `<leader>ws`   | n     | 垂直拆分窗口                               | `<cmd>vsplit<CR>`                                            |
| `<leader>wS`   | n     | 水平拆分窗口                               | `<cmd>split<CR>`                                             |
| `<leader>wh`   | n     | 当前窗口移动到最左侧                       | `<C-w>H`                                                     |
| `<leader>wl`   | n     | 当前窗口移动到最右侧                       | `<C-w>L`                                                     |
| `<leader>wk`   | n     | 当前窗口移动到最顶部                       | `<C-w>K`                                                     |
| `<leader>wj`   | n     | 当前窗口移动到最底部                       | `<C-w>J`                                                     |
| `<leader>w=`   | n     | 所有分屏均分尺寸                           | `<C-w>=`                                                     |
| `<leader>wn`   | n     | 新建空白分屏窗口                           | `<C-w>n`                                                     |
| `<leader>wc`   | n     | 工作目录切换为当前文件所在文件夹并打印路径 | `<cmd>cd %:p:h<CR><cmd>echo getcwd()<CR>`                    |
| `<leader>wr`   | n     | 唤起文件重命名命令                         | `:Rename<space>`                                             |
| `<C-s>`        | n、v  | 保存文件                                   | `<cmd>w<CR>`                                                 |
| `<C-c>`        | v     | 复制选中内容到系统剪贴板                   | `"+y`                                                        |
| `<C-v>`        | i     | 系统剪贴板粘贴，粘贴后保持插入模式         | `<Esc>"+pa`                                                  |
| `<S-Left>`     | n     | 窗口宽度减少5列                            | `:vertical resize -5<CR>`                                    |
| `<S-Right>`    | n     | 窗口宽度增加5列                            | `:vertical resize +5<CR>`                                    |
| `<S-Up>`       | n     | 窗口高度减少5行                            | `:resize -5<CR>`                                             |
| `<S-Down>`     | n     | 窗口高度增加5行                            | `:resize +5<CR>`                                             |
| `<C-j>`        | i     | 退出插入模式，下方新开一行并进入插入       | `<C-[>o`                                                     |
| `<C-f>`        | i     | 退出插入模式，上方新开一行并进入插入       | `<C-[>O`                                                     |

## markdown 

| 快捷键   | 模式 | 功能说明                                 | 映射命令                                                                                       |
|----------|------|------------------------------------------|------------------------------------------------------------------------------------------------|
| `\\`     | i    | 搜索`<++>`占位符、取消搜索高亮并定位编辑 | `<ESC>/<++><CR>:nohls<CR>c4l`                                                                  |
| `<C-CR>` | i    | Markdown斜体                             | `<Esc>0yf o<Esc>p0<C-a>$a`                                                                     |
| `BB`     | i    | Markdown加粗                             | `**** <++><Esc>6hi`                                                                            |
| `DD`     | i    | Markdown粗斜体                           | `****** <++><Esc>7hi`                                                                          |
| `II`     | i    | Markdown斜体                             | `** <++><Esc>F*i`                                                                              |
| `SS`     | i    | Markdown删除线                           | `~~~~ <++><esc>6hi`                                                                            |
| `UU`     | i    | HTML下划线                               | `<u></u> <++><Esc>2F<i`                                                                        |
| `LS`     | i    | 生成details折叠块                        | `<details><Enter><summary></summary><Enter><++><Enter></details><Enter><Enter><++><Esc>4k$F<i` |
| `~~`     | i    | Markdown代码块                           | `~~~<Enter><Enter>~~~<Enter><++><Esc>2kA`                                                      |
| `PP`     | i    | Markdown图片格式                         | `![](<++>) <++><Esc>F[a`                                                                       |
| `AA`     | i    | Markdown超链接格式                       | `[](<++>) <++><Esc>F[a`                                                                        |
| `@@`     | i    | 二级标题 ##                              | `##<Space>`                                                                                    |
| `##`     | i    | 三级标题 ###                             | `###<Space>`                                                                                   |
| `$$`     | i    | 四级标题 ####                            | `####<Space>`                                                                                  |

## markdown-table-mode

| 快捷键       | 模式 | 功能说明          | 映射命令       |
|--------------|------|-------------------|----------------|
| `<leader>mt` | n    | 打开/关闭表格模式 | `<cmd>Mtm<cr>` |

## img-clip

| 快捷键       | 模式 | 功能说明                                       | 映射命令              |
|--------------|------|------------------------------------------------|-----------------------|
| `<leader>mp` | n    | 剪贴板图片粘贴到当前目录并插入Markdown图片语法 | `<cmd>PasteImage<cr>` |

## markdown-preview

| 快捷键       | 模式 | 功能说明          | 映射命令                         |
|--------------|------|-------------------|----------------------------------|
| `<leader>md` | n    | 预览markdown 文件 | `<cmd>MarkdownPreviewToggle<cr>` |

## neotree

| 快捷键      | 模式 | 功能说明                            | 映射命令                                           |
|-------------|------|-------------------------------------|----------------------------------------------------|
| `<leader>e` | n、v | 开关Neo-tree，定位当前文件，        | `<cmd>Neotree toggle reveal source=filesystem<cr>` |
| `<c-e>`     | n    | 悬浮窗打开Neo-tree，展示Git变更状态 | `<cmd>Neotree toggle reveal float git_status<cr>`  |

## todo-comment

| 快捷键       | 模式 | 功能说明                         | 映射命令                                   |
|--------------|------|----------------------------------|--------------------------------------------|
| `<leader>tc` | n    | 初始化色彩插件，打开Todo提示列表 | 执行setup_culorizer()，运行TodoLocList命令 |

## fzf-lua

| 快捷键       | 模式 | 功能说明     | 映射命令           |
|--------------|------|--------------|--------------------|
| `<leader>ff` | n    | 查找文件     | `fzf.files`        |
| `<leader>fg` | n    | 查找字符     | `fzf.live_grep`    |
| `<leader>fb` | n    | 查找 buffers | `fzf.buffers`      |
| `<leader>fh` | n    | 查找帮助     | `fzf.help_tags`    |
| `<leader>fo` | n    | 历史文件     | `fzf.oldfiles`     |
| `<leader>fc` | n    | 查找主题     | `fzf.colorschemes` |
| `<leader>fd` | n    | 执行命令     | `fzf.commands`     |
| `<leader>fk` | n    | 快捷键       | `fzf.keymaps`      |
| `<leader>fe` | n    | Git文件      | `fzf.git_files`    |
| `<leader>fs` | n    | Git 状态     | `fzf.git_status`   |


## mini.align

| 快捷键      | 模式 | 功能说明                         | 映射命令                      |
|-------------|------|----------------------------------|-------------------------------|
| `<leader>a` | 全局 | 启动 mini.align 对齐，无实时预览 | mini.align start              |
| `<leader>A` | 全局 | 启动 mini.align 对齐，带实时预览 | mini.align start_with_preview |


## bufferline

| 快捷键             | 模式 | 功能说明                     | 映射命令                           |
|--------------------|------|------------------------------|------------------------------------|
| `<leader><Tab>c`   | n    | 关闭当前buffer               | `<cmd>bdelete<CR>`                 |
| `<leader><Tab>C`   | n    | 强制关闭当前buffer（不保存） | `<cmd>bdelete!<CR>`                |
| `<leader><Tab>[`   | n    | 关闭左侧buffer               | `<cmd>BufferLineCloseLeft<CR>`     |
| `<leader><Tab>]`   | n    | 关闭右侧buffer               | `<cmd>BufferLineCloseRight<CR>`    |
| `<leader><Tab>o`   | n    | 关闭除当前外所有buffer       | `<cmd>BufferLineCloseOthers<CR>`   |
| `<leader><Tab>p`   | n    | 固定/取消固定当前buffer      | `<cmd>BufferLineTogglePin<CR>`     |
| `<leader><Tab>B`   | n    | 按键选择关闭buffer           | `<cmd>BufferLinePickClose<CR>`     |
| `<leader><Tab>b`   | n    | 按键选择跳转buffer           | `<cmd>BufferLinePick<CR>`          |
| `<leader><Tab>h`   | n    | 切换上一个buffer             | `<cmd>BufferLineCyclePrev<CR>`     |
| `<leader><Tab>l`   | n    | 切换下一个buffer             | `<cmd>BufferLineCycleNext<CR>`     |
| `<leader><Tab>L`   | n    | buffer标签右移               | `<cmd>BufferLineMoveNext<CR>`      |
| `<leader><Tab>H`   | n    | buffer标签左移               | `<cmd>BufferLineMovePrev<CR>`      |
| `<leader><Tab>1~9` | n    | 跳转至第1~9号buffer          | `<cmd>BufferLineGoToBuffer x<CR>`  |
| `<leader><Tab>$`   | n    | 跳转最后一个buffer           | `<cmd>BufferLineGoToBuffer -1<CR>` |

## todo-comments

| 快捷键       | 模式 | 功能说明                               | 映射命令                                        |
|--------------|------|----------------------------------------|-------------------------------------------------|
| `<leader>tc` | n    | 初始化todo插件，打开全文件待办汇总列表 | 运行 `setup_TodoComments()`，执行 `TodoLocList` |
| `]t`         | n    | 跳到下一处 TODO/FIXME/NOTE 等注释标记  | `require("todo-comments").jump_next()`          |
| `[t`         | n    | 跳到上一处 TODO/FIXME/NOTE 等注释标记  | `require("todo-comments").jump_prev()`          |

## colorizer

| 快捷键       | 模式 | 功能说明                          | 映射命令                                                      |
|--------------|------|-----------------------------------|---------------------------------------------------------------|
| `<leader>oc` | n    | 初始化colorizer并切换颜色高亮显示 | 执行自定义Lua函数，调用 `setup_colorizer() + ColorizerToggle` |

## comment

| 快捷键       | 模式 | 功能说明                             | 映射命令       |
|--------------|------|--------------------------------------|----------------|
| `<C-\\>`     | n    | 单行注释/取消注释                    | toggler.line   |
| `<leader>\\` | n    | 块注释/取消块注释                    | toggler.block  |
| `<C-\\>`     | n/v  | 搭配动作实现多行选中行注释           | opleader.line  |
| `<leader>\\` | n/v  | 搭配动作实现选中块注释               | opleader.block |
| `<leader>ck` | all  | 光标上方新增注释行，自动切插入模式   | extra.above    |
| `<leader>cj` | all  | 光标下方新增注释行，自动切插入模式   | extra.below    |
| `<leader>ca` | all  | 在当前行末尾添加注释，自动切插入模式 | extra.eol      |

## lsp

| 快捷键 | 模式 | 功能说明                        | 映射命令                               |
|--------|------|---------------------------------|----------------------------------------|
| `gk`   | n    | 查看光标处悬停文档、类型说明    | `vim.lsp.buf.hover()`                  |
| `gd`   | n    | 跳转到变量/函数定义             | `vim.lsp.buf.definition()`             |
| `gD`   | n    | 跳转到声明位置                  | `vim.lsp.buf.declaration()`            |
| `gi`   | n    | 跳转接口、方法实现              | `vim.lsp.buf.implementation()`         |
| `go`   | n    | 跳转类型定义                    | `vim.lsp.buf.type_definition()`        |
| `gy`   | n    | 列出当前符号所有引用            | `vim.lsp.buf.references()`             |
| `gs`   | n    | 弹出函数参数签名提示            | `vim.lsp.buf.signature_help()`         |
| `gr`   | n    | 全局重命名符号                  | `vim.lsp.buf.rename()`                 |
| `gf`   | n、x | 异步格式化代码（普通/选中区域） | `vim.lsp.buf.format({async = true})`   |
| `gc`   | n    | 代码修复、自动操作（quickfix）  | `vim.lsp.buf.code_action()`            |
| `gwa`  | n    | 添加目录至LSP工作区             | `vim.lsp.buf.add_workspace_folder`     |
| `gwr`  | n    | 移除工作区目录                  | `vim.lsp.buf.remove_workspace_folder`  |
| `gwl`  | n    | 打印当前全部工作区路径          | `vim.lsp.buf.list_workspace_folders()` |

## flash

| 快捷键  | 模式        | 功能说明                           | 映射命令                               |
|---------|-------------|------------------------------------|----------------------------------------|
| `s`     | n、x、o     | Flash 全局字符快速跳转             | `require("flash").jump()`              |
| `S`     | n、x、o     | 基于 Treesitter 语法节点跳转       | `require("flash").treesitter()`        |
| `r`     | o           | Flash 远程跳转（操作模式远程定位） | `require("flash").remote()`            |
| `R`     | o、x        | Treesitter 语法范围检索跳转        | `require("flash").treesitter_search()` |
| `<c-s>` | c（命令行） | 命令行开启/关闭 Flash 搜索         | `require("flash").toggle()`            |

## lazygit

| 快捷键       | 模式 | 功能说明                            | 映射命令                                         |
|--------------|------|-------------------------------------|--------------------------------------------------|
| `<leader>gg` | n    | 打开LazyGit主界面                   | 执行函数调用 `lazygit_cmd("LazyGit")`            |
| `<leader>gG` | n    | 打开LazyGit并定位当前文件           | 执行函数调用 `lazygit_cmd("LazyGitCurrentFile")` |
| `<leader>gf` | n    | 打开LazyGit筛选查看项目所有提交记录 | 执行函数调用 `lazygit_cmd("LazyGitFilter")`      |




