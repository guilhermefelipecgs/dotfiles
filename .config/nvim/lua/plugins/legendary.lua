return {
	"mrjones2014/legendary.nvim",
	config = function()
		require('legendary').setup({
			keymaps = require('keymaps'),
			extensions = { lazy_nvim = true }
		})
	end
}
