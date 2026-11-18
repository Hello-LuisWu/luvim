## lazy.nvim 与 Neovim 事件对照

| lazy.nvim 配置         | Neovim Autocmd 事件 | 触发时机          |
|------------------------|---------------------|-------------------|
| event = "VimEnter"     | VimEnter            | Neovim 启动完成   |
| event = "UIEnter"      | UIEnter             | UI 连接完成       |
| event = "BufReadPre"   | BufReadPre          | 读取文件之前      |
| event = "BufRead"      | BufRead             | 读取文件时        |
| event = "BufReadPost"  | BufReadPost         | 读取文件之后      |
| event = "BufNewFile"   | BufNewFile          | 创建新文件        |
| event = "BufEnter"     | BufEnter            | 进入 Buffer       |
| event = "BufWinEnter"  | BufWinEnter         | Buffer 显示到窗口 |
| event = "BufLeave"     | BufLeave            | 离开 Buffer       |
| event = "BufWritePre"  | BufWritePre         | 保存文件之前      |
| event = "BufWritePost" | BufWritePost        | 保存文件之后      |
| event = "FileType"     | FileType            | 文件类型确定      |
| event = "Syntax"       | Syntax              | 语法高亮启用      |
| event = "InsertEnter"  | InsertEnter         | 进入插入模式      |
| event = "InsertLeave"  | InsertLeave         | 离开插入模式      |
| event = "CmdlineEnter" | CmdlineEnter        | 进入命令行模式    |
| event = "CmdlineLeave" | CmdlineLeave        | 离开命令行模式    |
| event = "TextChanged"  | TextChanged         | 普通模式文本变化  |
| event = "TextChangedI" | TextChangedI        | 插入模式文本变化  |
| event = "CursorMoved"  | CursorMoved         | 光标移动          |
| event = "CursorMovedI" | CursorMovedI        | 插入模式光标移动  |
| event = "FocusGained"  | FocusGained         | 获得窗口焦点      |
| event = "FocusLost"    | FocusLost           | 失去窗口焦点      |
| event = "WinEnter"     | WinEnter            | 进入窗口          |
| event = "WinLeave"     | WinLeave            | 离开窗口          |
| event = "TabEnter"     | TabEnter            | 进入标签页        |
| event = "TabLeave"     | TabLeave            | 离开标签页        |
| event = "VimResume"    | VimResume           | 从挂起状态恢复    |

## 推荐使用的懒加载事件

按照插件的使用场景分类：

| 场景             | 推荐事件                 | 适用插件              |
|------------------|--------------------------|-----------------------|
| 启动后加载       | VimEnter                 | Alpha                 |
| 启动 UI 后加载   | UIEnter                  | 状态栏、启动统计      |
| 打开文件后加载   | BufReadPost              | 文件浏览、文件分析    |
| 打开或新建文件   | BufReadPost + BufNewFile | 文件相关插件          |
| 进入指定文件类型 | FileType                 | Markdown、Python、Lua |
| 进入插入模式     | InsertEnter              | 补全、自动配对        |
| 离开插入模式     | InsertLeave              | 编辑辅助插件          |
| 进入命令行       | CmdlineEnter             | 命令行补全            |
| 保存文件前       | BufWritePre              | 格式化、自动整理      |
| 第一次光标移动   | CursorMoved              | 光标辅助插件          |
| 第一次进入窗口   | WinEnter                 | 窗口辅助插件          |


 h
