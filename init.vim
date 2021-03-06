call plug#begin('~/.nvim/plugged')
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'neomake/neomake' "{ 'on': 'Neomake'}
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"Javascript plugins
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install && install -g tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'carlitux/deoplete-flow'
"Typescript Plugins
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Quramy/tsuquyomi', {'do': 'npm install -g typescript'}
"Plug 'mhartington/deoplete-typescript'
Plug 'mhartington/nvim-typescript'
Plug 'leafgarland/typescript-vim'

Plug 'rhysd/vim-clang-format' "clang format support
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'ludovicchabant/vim-gutentags' " ctags
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install --all'}
Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'
Plug 'raimondi/delimitmate' "close brackets
Plug 'vim-airline/vim-airline' "nicer statusline
Plug 'ernstvanderlinden/vim-coldfusion'
Plug 'cflint/cflint-syntastic' "cold fusion linting
Plug 'metakirby5/codi.vim' "live js running
Plug 'tpope/vim-surround' "cs{l}{r}

" Themes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next'
call plug#end()

"===========================================
"ClangFormat settings
"===========================================
autocmd FileType c, cpp, js ClangFormatAutoEnable
let g:clang_format#auto_format=0
let g:clang_format#auto_format_on_insert_leave=0  " turned off by default  until
                                                  " we start using git

au BufNewFile,BufRead *.cfm,*.cfc setf cfml
"===========================================
"Deoplete settings
"===========================================
let g:python3_host_prog="python3"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#sources#flow#flow_bin = 'flow'
let g:deoplete#sources#flow#filetypes = [
      \'jsx',
      \'javascript.jsx',
      \'js',
      \'javascript.js',
      \'ts',
      \'typescript.ts'
      \]

"===========================================
"Javascript settings
"===========================================
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_javascript_eslint_maker = {
      \ 'args':['--no-color', '--format','compact'],
      \ 'errorformat':'%f:line %l, col %c, %m'
      \}
let g:neomake_typescript_enabled_makers = ['eslint']
let g:neomake_typescript_eslint_maker = {
      \ 'args':['--no-color', '--format','compact'],
      \ 'errorformat':'%f:line %l, col %c, %m'
      \}
let g:neomake_cf_enabled_makers = ['cflint']
let g:neomake_cf_cflint_maker = {
      \ 'args':['--no-color', '--format','compact'],
      \ 'errorformat':'%f:line %l, col %c, %m'
      \}
let g:neomake_serialize=1
let g:neomake_serialize_abort_on_error = 1
let g:neosnippet#enable_completed_snippet = 1


"===========================================
"Typescript settings
"===========================================
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

"===========================================
"Syntastic settings
"===========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

autocmd! BufWritePost * Neomake
let g:neomake_warning_sign = {
    \ 'text': '?',
    \ 'texthl': 'WarningMsg',
    \}

let g:neomake_error_sign = {
    \'text': 'X',
    \'texthl': 'ErrorMsg',
    \}

set statusline+=%*
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['eslint', 'flow']
let g:syntastic_typescript_eslint_exec = 'eslint'
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_javascript_flow_exe = 'flow'
"let g:syntastic_cf_checkers = ['cflint']
"let syntastic_cf_cflint_exe = 'cflint'

"===========================================
"Jedi Vim settings
"===========================================
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#force_py_version=3
set omnifunc=jedi#completions

"===========================================
"FZF
"===========================================
let g:fzf_action = {
      \'ctrl-t': 'tab split',
      \'ctrl-x': 'split',
      \'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R F:\tags'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

"===========================================
"NeoMake
"===========================================
"call neomake#configure#automake('nrwi', 500)

"===========================================
"Airline
"===========================================
let g:airline#extensions#tabline#enabled = 2
let g:airline#extentions#tabline#fnamemod = ':t'
let g:airline#extentions#tabline#left_sep = ' '
let g:airline#extentions#tabline#left_alt_sep = '|'
let g:airline#extentions#tabline#right_sep = ' '
let g:airline#extentions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme='oceanicnext' "gruvbox'

"===========================================
"RainbowParentheses
"===========================================
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadChevrons

"Characters to show for expanded TABs, trailing whitespace,
"and EOL
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,preceeds:<,nbsp:+
endif
set list

"highlight all tabs and trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

"===========================================
"Work settings
"===========================================
set tags=F:\tags;
"===========================================
"User defined
"===========================================
let mapleader="\<SPACE>"
set syntax
set number
set autoread
set noswapfile
set ignorecase
set smartcase
set showmatch "show matching brackets
set background=dark
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set colorcolumn=80
set termguicolors
colorscheme oceanicNext "gruvbox
set foldmethod=syntax
set foldlevelstart=1
set clipboard+=unnamedplus

let javaScript_fold=1 "Javascript
let vimsyn_folding='af' "Vimscript

