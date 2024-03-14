-- [[
-- 	Explore filesystem by `<Space>e`.
-- ]]
_G.explore = function()
    vim.cmd('Explore')
end
vim.api.nvim_set_keymap(
	'n', '<Space>e', '<cmd>lua explore()<CR>',
	{ noremap = true, silent = true })


-- [[
--	Use system clipboard.
-- ]] 
vim.o.clipboard = "unnamedplus"

