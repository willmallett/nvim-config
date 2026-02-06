-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		filesystem = {
			-- Prevent large nested directories from freezing neovim
			use_libuv_file_watcher = true,
			async_directory_scan = "always",
			scan_mode = "shallow",

			-- Fill the whole buffer with the tree
			window = {
				position = "current",
				mappings = {
					["\\"] = "close_window",
				},
				width = 60,
			},
		},
	},
}

