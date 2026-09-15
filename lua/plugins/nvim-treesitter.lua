return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opt = { 
    install_dir = vim.fn.stdpath('data') .. '/site',
  },
  config = function()
    require('nvim-treesitter').install { 'lua', 'rust', 'javascript', 'zig' }
  end
}
