return {
	"nvim-telescope/telescope.nvim",
    tag = '0.1.1',
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{'<leader>gf', "<cmd>Telescope git_files<CR>", desc = 'Search [G]it [F]iles'},
		{'<leader>sf', "<cmd>Telescope find_files<CR>", desc = '[S]earch [F]iles'},
		{'<leader>sh', "<cmd>Telescope help_tags<CR>", desc = '[S]earch [H]elp'},
		{'<leader>sw', "<cmd>Telescope grep_string<CR>", desc = '[S]earch current [W]ord'},
		{'<leader>sw', "<cmd>Telescope grep_string<CR>", desc = '[S]earch current [W]ord'},
		{'<leader>sg', "<cmd>Telescope live_grep<CR>", desc = '[S]earch by [G]rep'},
		{'<leader>sd', "<cmd>Telescope diagnostics<CR>", desc = '[S]earch [D]iagnostics'}
	}
}
