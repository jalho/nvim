_G.explore = function()
    vim.cmd('Explore')
end

vim.api.nvim_set_keymap(
	'n', '<Space>e', '<cmd>lua explore()<CR>',
	{ noremap = true, silent = true })

