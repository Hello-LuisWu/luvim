if vim.g.neovide then
	local g = vim.g
	local opt = vim.opt
	-- opt.guifont = "Iosevka Nerd Font:h20"
	opt.linespace = 0 -- 行间距

	-- 不更改字体的情况下更改缩放比例
	g.neovide_scale_factor = 1.0

	-- 微调文本的伽玛值和对比度
	g.neovide_text_gamma = 0.8
	g.neovide_text_contrast = 0.1

	-- “RGBH”（红色在左，绿色在中，蓝色在右，水平排列）、
	-- “BGRH”（水平排列，但方向相反）、
	-- “RGBV”（红色在上，蓝色在下）、
	-- “BGRV”（蓝色在上，红色在下）
	-- 和“未知”（实际上禁用了子像素抗锯齿）。
	g.neovide_pixel_geometry = "RGBH"
	g.neovide_pixel_geometry = "RGBH"

	-- 内边距
	g.neovide_padding_top = 0
	g.neovide_padding_bottom = 0
	g.neovide_padding_left = 0
	g.neovide_padding_right = 0

	-- Neovide 整体透明度。
	g.neovide_opacity = 1.0

	-- Normal 的 highlight 背景透明度。
	g.neovide_normal_opacity = 1.0

	-- macOS 开启专用窗口背景模糊
	-- blur 强度会受到 neovide_opacity 的影响。
	g.neovide_window_blurred = true

	-- ╭──────────────────────────────────────────────────────────╮
	-- │ 7. Floating Window                                       │
	-- ╰──────────────────────────────────────────────────────────╯
	-- Floating Window 模糊。
	g.neovide_floating_blur_amount_x = 2.0
	g.neovide_floating_blur_amount_y = 2.0

	-- Floating Window 阴影。
	g.ide_floating_shadow = true

	-- Floating Window 的虚拟高度。 --
	-- 数值越大，阴影效果通常越明显。
	g.neovide_floating_z_height = 10

	-- 光源角度。
	g.neovide_light_angle_degrees = 45

	-- 光源半径。
	g.neovide_light_radius = 5

	-- 确定窗口从一个位置到另一个位置完成动画所需的时间（以秒为单位），例如:split。设置为0可禁用。
	g.neovide_position_animation_length = 0.15

	-- Floating Window 圆角。
	-- 0.0 = 无圆角
	-- 1.0 = 最大圆角
	g.neovide_floating_corner_radius = 0.25

	-- 自动跟随 macOS 深浅色模式。
	g.neovide_theme = "auto"

	-- 若 Neovim colorscheme 使用深色主题，
	-- 可以改成：
	-- vim.g.neovide_theme = "dark"
	-- 同时：
	-- vim.o.background = "dark"

	-- macOS 下是否显示窗口边框。
	g.neovide_show_border = true

	-- 不启用光标粒子效果。
	-- 可选：
	-- ""
	-- "railgun"
	-- "torpedo"
	-- "pixiedust"
	-- "sonicboom"
	-- "ripple"
	-- "wireframe"
	-- 对长期使用而言，建议关闭。
	g.neovide_cursor_vfx_mode = ""

	-- 只有关闭 VSync 时这个设置才真正控制刷新率。
	-- 如果不使用 --no-vsync， -- 可以不用设置。
	-- vim.g.neovide_refresh_rate = 120

	-- Neovide 不在前台时降低刷新率。
	-- 可以降低 CPU/GPU 占用。
	g.neovide_refresh_rate_idle = 5

	-- 不强制持续刷新。
	-- false = 正常模式
	-- true = 持续 redraw
	-- 一般保持 false。
	g.neovide_no_idle = false


	-- 记住上一次窗口大小。
	g.neovide_remember_window_size = true

	-- macOS 原生全屏。
	-- true：
	-- 隐藏 Dock 和菜单栏。
	-- 与普通 fullscreen 不完全相同。
	g.neovide_macos_simple_fullscreen = false

	-- ╭────────────────────────╮
	-- │ 15. macOS Option / Alt │
	-- ╰────────────────────────╯
	-- 将左 Option 键作为 Meta / Alt。
	-- "both"
	-- "only_left"
	-- "only_right"
	-- "none"
	-- vim.g.neovide_input_macos_option_key_is_meta = "only_left"

	-- 默认关闭 IME。然后只在 Insert Mode / 搜索时开启。
	g.neovide_input_ime = true

	-- macOS 原生括号匹配, 使用系统 Find Indicator 高亮匹配括号。
	-- 如使用 nvim-ts-autotag、rainbow-delimiters 或其他括号高亮插件，建议关闭，避免多个高亮机制冲突。
	-- g.neovide_highlight_matching_pair = false   -- 已废弃

	-- 在 macOS 标题栏显示当前文件的 Proxy Icon。
	g.neovide_proxy_icon = true

	-- 是否允许鼠标拖动选择消息区域内容。
	-- 例如：:messages, shell command 输出
	g.neovide_message_area_drag_selection = true

	-- 开始输入时自动隐藏鼠标。移动鼠标后会重新显示
	g.neovide_hide_mouse_when_typing = true

	-- 有未保存文件时退出需要确认。
	g.neovide_confirm_quit = true

	-- 如果 Neovide 连接远程 Neovim，退出时的行为：
	-- always_quit
	-- always_detach
	-- prompt
	-- 普通本地 Neovim 基本不需要修改。
	g.neovide_detach_on_quit = "prompt"

	-- 防止 cursor 在某些情况下错误闪到 command line。
	g.neovide_cursor_hack = true

	-- undercurl / underline 等线条粗细。
	g.neovide_underline_stroke_scale = 1.0

	-- Neovide 0.16+ 支持进度条。
	-- 如果不需要，可以关闭。
	g.neovide_progress_bar_enabled = true       -- 设置是否启用进度条
	g.neovide_progress_bar_height = 5.0         -- 设置进度条的高度（以像素为单位）。
	g.neovide_progress_bar_animation_speed = 200.0 -- 设置进度条动画的速度。
	g.neovide_progress_bar_hide_delay = 0.2     -- 设置进度条达到 100% 后隐藏前的延迟时间（以秒为单位）。

	-- 性能分析器。true 会在左上角显示 frame time graph。
	g.neovide_profiler = false

	-- 解决 CMD + V 不能粘贴的问题
	vim.keymap.set({ "n", "i", "c", "v", "t" }, "<D-v>", "<C-r>+", {
		desc = "从系统剪贴板粘贴",
	})
end
