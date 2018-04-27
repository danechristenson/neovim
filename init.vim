call plug#begin('~/.nvim/plugged')
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote')}
Plug 'neomake/neomake', { 'on': 'Neomake'}
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"Javascript plugins
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install && install -g tern' }
Plug 'carlitux/deoplete-ternjs'
"Typescript Plugins
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Quramy/tsuquyomi', {'do': 'npm install -g typescript'}
Plug 'mhartington/deoplete-typescript'


Plug 'morhetz/gruvbox'
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'ludovicchabant/vim-gutentags' "ctags
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install -all'}


call plug#end()

"===========================================
"Deoplete settings
"===========================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
"call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

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
let g:neomake_javascript_enabled_makers = ['eslint']

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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

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

"===========================================
"FZF
"===========================================
"let g:fzf_action = {
"      \'ctrl-t': 'tab split',
"      \'ctrl-x': 'split',
"      \'ctrl-v': 'vsplit' }


"===========================================
"User defined
"===========================================
set syntax
set number
set tabstop=2 shiftwidth=2 expandtab
set autoread
set background=dark
colorscheme gruvbox

