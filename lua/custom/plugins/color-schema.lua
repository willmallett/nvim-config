vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Customize colors for hunk preview
		vim.cmd([[ highlight DiffAdd guifg=NONE guibg=#144212 ]])
		vim.cmd([[ highlight DiffChange guifg=NONE guibg=#244252 ]])
		vim.cmd([[ highlight DiffDelete guifg=NONE guibg=#421212 ]])
	end,
})

return {

	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Choose your preferred flavor: latte, frappe, macchiato, mocha
			integrations = {
				alpha = true, -- enable Catppuccin styling for alpha dashboard
			},
			-- transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin")
	end,

	-- "folke/tokyonight.nvim",
	-- priority = 1000, -- Make sure to load this before all the other start plugins.
	-- config = function()
	-- 	---@diagnostic disable-next-line: missing-fields
	-- 	require("tokyonight").setup({
	-- 		styles = {
	-- 			comments = { italic = false }, -- Disable italics in comments
	-- 		},
	-- 	})
	-- 	-- Load the colorscheme here.
	-- 	-- Like many other themes, this one has different styles, and you could load
	-- 	-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	-- 	vim.cmd.colorscheme("tokyonight-storm")
	-- end,

	-- "danilo-augusto/vim-afterglow",
	-- name = "afterglow",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd.colorscheme("afterglow")
	-- end,

	-- -- dim kanagawa (normal)
	-- "rebelot/kanagawa.nvim",
	-- name = "kanagawa",
	-- priority = 1000,
	-- config = function()
	--     require("kanagawa").setup({
	-- 	compile = false,             -- enable compiling the colorscheme
	-- 	undercurl = true,            -- enable undercurls
	-- 	commentStyle = { italic = true },
	-- 	functionStyle = {},
	-- 	keywordStyle = { italic = true},
	-- 	statementStyle = { bold = true },
	-- 	typeStyle = {},
	-- 	transparent = false,         -- do not set background color
	-- 	dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
	-- 	terminalColors = true,       -- define vim.g.terminal_color_{0,17}
	-- 	colors = {                   -- add/modify theme and palette colors
	-- 	    palette = {},
	-- 	    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	-- 	},
	-- 	overrides = function(colors) -- add/modify highlights
	-- 	    return {}
	-- 	end,
	-- 	theme = "dragon",              -- Load "wave" theme
	-- 	background = {               -- map the value of 'background' option to a theme
	-- 	    dark = "dragon",           -- try "dragon" !
	-- 	    light = "lotus"
	-- 	},
	--     })
	-- vim.cmd.colorscheme("kanagawa")
	-- end,

	-- kanagawa a bit more vibrant:
	-- "rebelot/kanagawa.nvim",
	-- name = "kanagawa",
	-- priority = 1000,
	-- config = function()
	-- require("kanagawa").setup({
	--     compile = false,
	--     undercurl = true,
	--     commentStyle = { italic = true },
	--     keywordStyle = { italic = true, bold = true },
	--     statementStyle = { bold = true },
	--     transparent = false,
	--     dimInactive = false,
	--     terminalColors = true,
	--     colors = {
	-- 	palette = {
	-- 	    fujiWhite = "#f8f8f8",   -- brighter foreground
	-- 	    oldWhite  = "#e0e0e0",   -- lighter secondary text
	-- 	    samuraiRed = "#ff5f5f",  -- vivid red
	-- 	    dragonBlue = "#7aa2f7",  -- more saturated blue
	-- 	    springGreen = "#9ece6a", -- punchier green
	-- 	},
	--     },
	--     overrides = function(colors)
	-- 	return {
	-- 	    Normal       = { bg = colors.palette.sumiInk1, fg = colors.palette.fujiWhite },
	-- 	    NormalFloat  = { bg = colors.palette.sumiInk2, fg = colors.palette.fujiWhite },
	-- 	    Comment      = { fg = "#a1a1a1", italic = true }, -- brighter comments
	-- 	    CursorLine   = { bg = "#2a2f4d" },                -- stronger line highlight
	-- 	    Visual       = { bg = "#3b4261" },                -- vivid selection
	-- 	    Keyword      = { fg = colors.palette.dragonBlue, bold = true },
	-- 	    Identifier   = { fg = colors.palette.springGreen },
	-- 	}
	--     end,
	--     theme = "wave",
	--     background = {
	-- 	dark = "wave",
	-- 	light = "lotus",
	--     },
	-- })
	-- vim.cmd.colorscheme("kanagawa")
	-- end,

	-- "ellisonleao/gruvbox.nvim",
	-- priority = 1000,
	-- config = function()
	-- 	require("gruvbox").setup({
	-- 		terminal_colors = true, -- add neovim terminal colors
	-- 		undercurl = true,
	-- 		underline = true,
	-- 		bold = true,
	-- 		italic = {
	-- 			strings = true,
	-- 			emphasis = true,
	-- 			comments = true,
	-- 			operators = false,
	-- 			folds = true,
	-- 		},
	-- 		strikethrough = true,
	-- 		invert_selection = false,
	-- 		invert_signs = false,
	-- 		invert_tabline = false,
	-- 		inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 		contrast = "soft", -- can be "hard", "soft" or empty string
	-- 		palette_overrides = {},
	-- 		overrides = {},
	-- 		dim_inactive = false,
	-- 		transparent_mode = false,
	-- 	})
	-- 	vim.cmd("colorscheme gruvbox")
	-- end,

	-- "shaunsingh/nord.nvim",
	-- name = "nord",
	-- priority = 1000,
	-- config = function()
	-- 	vim.g.nord_contrast = true
	-- 	vim.g.nord_borders = true
	-- 	vim.g.nord_disable_background = true
	-- 	vim.g.nord_italic = false
	-- 	vim.g.nord_uniform_diff_background = true
	-- 	vim.g.nord_bold = false
	-- 	-- Load the colorscheme
	-- 	require('nord').set()
	-- end,

	-- "santos-gabriel-dario/darcula-solid.nvim",
	-- dependencies = { "rktjmp/lush.nvim" },
	-- name = "darcula",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd.colorscheme("darcula-solid")
	-- end,

	-- "neanias/everforest-nvim",
	-- name = "everforest",
	-- priority = 1000,
	-- config = function()
	-- 	require("everforest").setup({
	-- 		background = "hard",
	-- 		transparent_background_level = 0,
	-- 		italics = true,
	-- 		disable_italic_comments = false,
	-- 		inlay_hints_background = "dimmed",
	-- 		on_highlights = function(hl, palette)
	-- 			hl["DiagnosticUnderlineWarn"] = { undercurl = true, sp = palette.yellow }
	-- 			hl.LspReferenceText = { bg = palette.bg_visual, bold = true }
	-- 			hl.LspReferenceRead = { bg = palette.bg_visual, bold = true }
	-- 			hl.LspReferenceWrite = { bg = palette.bg_visual, bold = true }
	-- 		end,
	-- 	})
	-- 	vim.cmd.colorscheme("everforest")
	-- end,

	-- 'AlexvZyl/nordic.nvim',
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	--     require('nordic').load()
	-- end

	-- "sainnhe/gruvbox-material",
	-- name = "gruvbox-material",
	-- priority = 1000,
	-- config = function()
	-- 	-- optional: set some globals before loading
	-- 	vim.g.gruvbox_material_background = "medium" -- options: 'soft', 'medium', 'hard'
	-- 	vim.g.gruvbox_material_foreground = "material" -- options: 'material', 'mix', 'original'
	-- 	vim.g.gruvbox_material_enable_bold = 1
	-- 	vim.g.gruvbox_material_enable_italic = 1
	-- 	vim.g.gruvbox_material_transparent_background = 0
	-- 	vim.cmd.colorscheme("gruvbox-material")
	-- end,

	-- "rose-pine/neovim",
	-- name = "rose-pine",
	-- config = function()
	-- 	require("rose-pine").setup({
	-- 		variant = "moon", -- auto, main, moon, or dawn
	-- 		dark_variant = "moon", -- main, moon, or dawn
	-- 		dim_inactive_windows = false,
	-- 		extend_background_behind_borders = true,
	-- 		enable = {
	-- 			terminal = true,
	-- 			legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
	-- 			migrations = true, -- Handle deprecated options automatically
	-- 		},
	-- 		styles = {
	-- 			bold = true,
	-- 			italic = true,
	-- 			transparency = false,
	-- 		},
	-- 		groups = {
	-- 			border = "muted",
	-- 			link = "iris",
	-- 			panel = "surface",
	-- 			error = "love",
	-- 			hint = "iris",
	-- 			info = "foam",
	-- 			note = "pine",
	-- 			todo = "rose",
	-- 			warn = "gold",
	-- 			git_add = "foam",
	-- 			git_change = "rose",
	-- 			git_delete = "love",
	-- 			git_dirty = "rose",
	-- 			git_ignore = "muted",
	-- 			git_merge = "iris",
	-- 			git_rename = "pine",
	-- 			git_stage = "iris",
	-- 			git_text = "rose",
	-- 			git_untracked = "subtle",
	-- 			h1 = "iris",
	-- 			h2 = "foam",
	-- 			h3 = "rose",
	-- 			h4 = "gold",
	-- 			h5 = "pine",
	-- 			h6 = "foam",
	-- 		},
	-- 		palette = {
	-- 			-- Override the builtin palette per variant
	-- 			-- moon = {
	-- 			--     base = '#18191a',
	-- 			--     overlay = '#363738',
	-- 			-- },
	-- 		},
	-- 		-- NOTE: Highlight groups are extended (merged) by default. Disable this
	-- 		-- per group via `inherit = false`
	-- 		highlight_groups = {
	-- 			-- Comment = { fg = "foam" },
	-- 			-- StatusLine = { fg = "love", bg = "love", blend = 15 },
	-- 			-- VertSplit = { fg = "muted", bg = "muted" },
	-- 			-- Visual = { fg = "base", bg = "text", inherit = false },
	-- 		},
	-- 		before_highlight = function(group, highlight, palette)
	-- 			-- Disable all undercurls
	-- 			-- if highlight.undercurl then
	-- 			--     highlight.undercurl = false
	-- 			-- end
	-- 			--
	-- 			-- Change palette colour
	-- 			-- if highlight.fg == palette.pine then
	-- 			--     highlight.fg = palette.foam
	-- 			-- end
	-- 		end,
	-- 	})
	-- 	vim.cmd("colorscheme rose-pine")
	-- end,

	-- "Mofiqul/vscode.nvim",
	-- name = "vscode",
	-- priority = 1000,
	-- config = function()
	-- 	local c = require('vscode.colors').get_colors()
	-- 	require("vscode").setup({
	-- 		-- Alternatively set style in setup
	-- 		-- style = 'light'
	-- 		-- Enable transparent background
	-- 		transparent = false,
	-- 		-- Enable italic comment
	-- 		italic_comments = true,
	-- 		-- Enable italic inlay type hints
	-- 		italic_inlayhints = true,
	-- 		-- Underline `@markup.link.*` variants
	-- 		underline_links = true,
	-- 		-- Disable nvim-tree background color
	-- 		disable_nvimtree_bg = true,
	-- 		-- Apply theme colors to terminal
	-- 		terminal_colors = true,
	-- 		-- Override colors (see ./lua/vscode/colors.lua)
	-- 		color_overrides = {
	-- 			-- vscBack = "#2c2c2c",
	-- 			vscLineNumber = '#FFFFFF',
	-- 		},
	-- 		-- Override highlight groups (see ./lua/vscode/theme.lua)
	-- 		group_overrides = {
	-- 			-- this supports the same val table as vim.api.nvim_set_hl
	-- 			-- use colors from this colorscheme by requiring vscode.colors!
	-- 			Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
	-- 			String = { fg = "#ffb86c" },
	-- 		}
	-- 	})
	-- 	vim.cmd.colorscheme("vscode")
	-- end,

-- 	"projekt0n/github-nvim-theme",
-- 	name = "github-theme",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	config = function()
-- 		require("github-theme").setup({
-- 		})
-- 		vim.cmd("colorscheme github_dark_dimmed")
-- 	end,

}
