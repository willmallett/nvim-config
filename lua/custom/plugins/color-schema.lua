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
}
