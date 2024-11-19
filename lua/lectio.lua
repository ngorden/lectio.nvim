local d = require 'lectio.divina'

vim.api.nvim_create_user_command('Lectio', d.lectio, { nargs = '?', range = true })
