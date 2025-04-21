return {
	"nvim-neotest/neotest",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	opts = {},

	config = function(_, opts)
		local status_ok, neotest = pcall(require, "neotest")
		if not status_ok then
			return
		end

		local jest = require("neotest-jest")

		neotest.setup({
			summary = {
				open = "botright vsplit | vertical resize 80",
			},
			adapters = {
				-- working for all unit tests, not acceptance tests in acceptanct dir
				jest({
					jestCommand = "npm run spec --",
					cwd = function(path)
						return vim.fn.getcwd()
					end,
					filter_dir = function(name, rel_path, root)
						return name ~= "node_modules"
					end,

					testMatch = {
						"**/__tests__/**/*.[jt]s?(x)",
						"**/tests/**/*.[jt]s?(x)",
						"**/?(*.)+(spec|test).[jt]s?(x)",
					},

					-- env = {
					-- 	NODE_ENV = "test",
					-- },
					jest_test_discovery = true,
					args = {
						"--verbose",
					},
				}),
			},

			discovery = {
				enabled = true,
			},
		})
	end,
  -- stylua: ignore
  keys = {
    {"<leader>t", "", desc = "+test"},
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File (Neotest)" },
    { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files (Neotest)" },
    { "<leader>td", function() require("neotest").run.run({strategy = 'dap'}) end, desc = "[D]ebug Nearest (Neotest)" },
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest (Neotest)" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last (Neotest)" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel (Neotest)" },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop (Neotest)" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch (Neotest)" },
  },
}
