-- Ensure postgresql is installed (if using postgres): `brew install postgresql`
-- :DBUI and enter your connection string (ex: postgresql://my_cool_db:my_cool_db_ps@localhost:5432/my-db

return {
	"tpope/vim-dadbod",
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.dadbod_ui_execute_on_save = false
		end,
	},
	"kristijanhusak/vim-dadbod-completion",
}
