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
		})
		vim.cmd.colorscheme("catppuccin")
	end,
	--
	--
	--
	-- "folke/tokyonight.nvim",
	-- priority = 1000, -- Make sure to load this before all the other start plugins.
	-- config = function()
	-- 	---@diagnostic disable-next-line: missing-fields
	-- 	require("tokyonight").setup({
	-- 		styles = {
	-- 			comments = { italic = false }, -- Disable italics in comments
	-- 		},
	-- 	})
	--
	-- 	-- Load the colorscheme here.
	-- 	-- Like many other themes, this one has different styles, and you could load
	-- 	-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	-- 	vim.cmd.colorscheme("tokyonight-night")
	-- end,
}
