" Plugins
" ----------------------------------------------------------------
"
call plug#begin('~/.config/nvim/autoload')

" Completion
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'avdgaag/vim-phoenix', { 'for': 'elixir' }

" Visual
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'

" Commenting
Plug 'tpope/vim-commentary'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Fuzzy
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'

" Add plugins to &runtimepath
call plug#end()

" Color
" ---------------------------------------------------------------

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_invert_selection=0
silent! colorscheme gruvbox
set background=dark

" improve gruvbox Conceal highlighting
" 166 = grubox orange
highlight Conceal ctermfg=166 guifg=#d65d0e

" see https://github.com/neovim/neovim/issues/4946
" 124 = gruvbox red
highlight SpecialKey ctermfg=124 guifg=#cc241d

" Use deoplete
let g:deoplete#enable_at_startup = 1

" GitGutter
let g:gitgutter_override_sign_column_highlight = 0
highlight LineNr guibg=brightblack
highlight SignColumn guibg=brightblack
highlight GitGutterAdd guibg=brightblack guifg=#394d3a
highlight GitGutterChange guibg=brightblack guifg=orange
highlight GitGutterDelete guibg=brightblack guifg=red

" Vertical Split
hi VertSplit guifg=#363636 guibg=#363636

"  UI
" ---------------------------------------------------------------

set laststatus=0	   " Hide the title on the status line
set ruler                  " show the cursor position all the time
set cursorline		   " Show cursorline
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set numberwidth=3          " 3 digit line numbers don't get squashed
set relativenumber	   " Set relative line number
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=1                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set mousehide              " Hide the mouse pointer while typing
set scrolloff=5            " minimum lines to keep above and below cursor
set sidescrolloff=7
set sidescroll=1
set splitbelow             " splits that make more sense
set splitright
set synmaxcol=300          " Boost performance of rendering long lines
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" use cursor line only when in current window and out of insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" General
" --------------------------------------------------------------


" Mappings
" --------------------------------------------------------------

map <space> <Leader>
map <F12> :so $MYVIMRC<CR>
set pastetoggle=<leader>p

" Blank lines without insert
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Leader mapping
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Unite.vim
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-N>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
