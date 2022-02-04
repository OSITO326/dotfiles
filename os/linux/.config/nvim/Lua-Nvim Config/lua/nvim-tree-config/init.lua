vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 0

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  auto_close = true,
  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
  },
  diagnostics = {
  enable = true,
  icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  filters = {
    dotfiles = false,
    custom = {'.git', '.env', '.gitignore'}
  },
}

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '✗',
    staged = '✓',
    unmerged = '',
    renamed = '➜',
    untracked = '★',
    deleted = '',
    ignored = '◌',
  },
  folder = {
    default = '',
    open = '',
    arrow_open = '',
    arrow_closed = '',
    empty = ' ',
    empty_open = ' ',
    symlink = '',
    symlink_open = '',
  },
  lsp = { hint = ' ', info = ' ', warning = ' ', error = ' ' },
}
