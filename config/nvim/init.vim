call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'stephenway/postcss.vim', { 'for': 'css' }
Plug 'ap/vim-css-color'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'chiel92/vim-autoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tpope/vim-dadbod'

call plug#end()

" ===                               SETTINGS                               === "
let g:python3_host_prog = '~/.pyenv/versions/py3nvim/bin/python' "special venv for neovim
let g:mapleader=','
map <leader>, :w<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :qa!<cr>
nmap <leader>- :set laststatus=0<cr> "almost goyo
nmap <leader>! :so $MYVIMRC<cr>
nmap <leader>bu :Buffers<cr>
nmap <leader>fi :Files<cr>
nmap <leader>wi :Windows<cr>
nmap <leader>ag :Ag<cr>
nmap <leader>li :Lines<cr>
nmap <leader>bl :BLines<cr>
nmap <leader>hi :History<cr>
nmap <leader>hc :History:<cr>
nmap <leader>co :Commands<cr>
nmap <leader>bd :bd!<cr>
nmap <leader>bn :e<Space>
nmap <leader>ev :e! ~/.config/nvim/init.vim<cr>
nmap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nmap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <leader>. :close<cr>
nmap <Space> :CocCommand explorer<cr>
nnoremap <silent> <leader>v :call WinMove('h')<cr>
nnoremap <silent> <leader>s :call WinMove('j')<cr>
nnoremap <silent> <leader>s :call WinMove('k')<cr>
nnoremap <silent> <leader>v :call WinMove('l')<cr>

" Basic file system commands
nnoremap <A-o> :!touch<Space>
nnoremap <A-d> :!mkdir<Space>
nnoremap <A-c> :!cd<Space>
nnoremap <A-m> :!mv<Space>
nnoremap <A-w> :!pwd<cr>
nnoremap <A-l> :!exa --icons -all -l --group-directories-first<cr>

" Fix indenting visual block
vmap < <gv
vmap > >gv

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

set gcr+=n:ver1-iCur
set gcr+=v:ver1-iCur
set gcr+=c:ver1-iCur
set mouse=a
set noshowcmd
set hidden
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab
set nowrap
set nocursorline
set noruler
set shortmess+=I
set termguicolors
set splitbelow
set splitright
set noshowmode
set winbl=10
set mouse=n
set clipboard+=unnamedplus
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set magic
set autoread
set wildmenu
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup
set nobackup
set noswapfile

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2

"Script Templates
iab pyhead <ESC>:-1read $HOME/.config/nvim/skeleton/python/head.py<ESC>

" ===                           PLUGIN SETUP                               === "
" === goyo
let g:goyo_height = 100
let g:goyo_linenr = 1

"fzf
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.9 } }

"vim-tmux-navigator
let g:tmux_navigator_save_on_switch = 2

" === vim airline ==== "
let g:airline_extensions = ['branch', 'coc']
let g:airline_theme='space'
let g:airline_section_z = "%p%% %l/%L %c"
let g:airline_skip_empty_sections = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" === autopair
let g:autopairsflymode = 1
" for fstrings in py
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'"})

" ------COC SETTINGS------
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-angular',
  \ 'coc-texlab',
  \ 'coc-python',
  \ 'coc-phpls',
  \ 'coc-vimtex',
  \ 'coc-emmet',
  \]

" From Coc Readme
set updatetime=300

" Better display for messages
set cmdheight=1
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use D to show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <rn> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>af  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Set floating window to be transparent
set winbl=0
" ===                      CUSTOM COLORSCHEME CHANGES                      === "

function! s:custom_colors()
" Make background transparent for many things
  hi Normal ctermbg=NONE guibg=NONE
  hi NonText ctermbg=NONE guifg=#16242c guibg=base00
  hi LineNr ctermfg=NONE guibg=NONE
  hi CursorLineNr guibg=NONE guifg=#c0c5ce
  hi SignColumn ctermfg=NONE guibg=NONE
  hi StatusLine guifg=NONE guibg=NONE
  " Try to hide vertical split and end of buffer symbol
  hi VertSplit gui=NONE guifg=NONE guibg=NONE
  hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#1b2b34

  " Make background color transparent for git changes
  hi SignifySignAdd guibg=NONE
  hi SignifySignDelete guibg=NONE
  hi SignifySignChange guibg=NONE

  " Highlight git change signs
  hi SignifySignAdd guifg=#99c794
  hi SignifySignDelete guifg=#ec5f67
  hi SignifySignChange guifg=#c594c5
endfunction

autocmd! ColorScheme OceanicNext call s:custom_colors()

" Editor theme
try
  colorscheme OceanicNext
catch
  colorscheme slate
endtry
