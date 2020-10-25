set shell=/bin/zsh
let mapleader = ","

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                VIM PLUG START                                "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nmap <C-p> :Buffer<CR>
call plug#begin('~/.vim/plugged')


"------------------------------------------------------------------------------"
"                                   nvim yarp                                  "
"------------------------------------------------------------------------------"
Plug 'roxma/nvim-yarp'


"------------------------------------------------------------------------------"
"                                   coc nvim                                   "
"------------------------------------------------------------------------------"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
	\ 'coc-tslint-plugin', 
	\ 'coc-tsserver', 
	\ 'coc-python', 
	\ 'coc-java',
	\ 'coc-xml',
	\ 'coc-emmet', 
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-yank',
	\ 'coc-prettier',
	\ 'coc-git',
	\ 'coc-highlight',
	\ 'coc-markdownlint',
	\ 'coc-python',
	\ 'coc-lua',
	\ 'coc-snippets'
\]

" adds the status line when something is being processed in the background
let g:airline#extensions#coc#enabled = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile

set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd :vsp<CR><Plug>(coc-definition)zz
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

command! -nargs=0 Format 	:call 		CocAction('format')
command! -nargs=? Fold 		:call 		CocAction('fold', <f-args>)
command! -nargs=0 OR   		:call		CocAction('runCommand', 'editor.action.organizeImport')

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand-jump)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-;> <Plug>(coc-snippets-expand)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"------------------------------------------------------------------------------"
"                                vim javascript                                "
"------------------------------------------------------------------------------"
Plug 'pangloss/vim-javascript'


"------------------------------------------------------------------------------"
"                                    vim tsx                                   "
"------------------------------------------------------------------------------"
Plug 'ianks/vim-tsx'


"------------------------------------------------------------------------------"
"                                typescript vim                                "
"------------------------------------------------------------------------------"
Plug 'leafgarland/typescript-vim'


"------------------------------------------------------------------------------"
"                                      fzf                                     "
"------------------------------------------------------------------------------"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ignore files and folders in git ignore
command! FZFGitIgnore call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))
nmap <C-p> :FZFGitIgnore <CR>
imap <C-p> <Esc>:FZFGitIgnore <CR>
nmap <C-B> :Buffers <CR>
nnoremap <C-L> :Lines <CR>
nmap <Leader>fzl <Esc>:Lines<CR>
nmap <Leader>fzb <Esc>:Buffers<CR>
nmap <Leader>fzc <Esc>:Commits<CR>


"------------------------------------------------------------------------------"
"                                  vim ariline                                 "
"------------------------------------------------------------------------------"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 0
let g:airline_statusline_ontop=1
let g:airline_detect_modified=1
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_disable_statusline = 0

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

let g:airline#extensions#wordcount#enabled = 0


"------------------------------------------------------------------------------"
"                                 vim surround                                 "
"------------------------------------------------------------------------------"
Plug 'tpope/vim-surround'



"------------------------------------------------------------------------------"
"                             vim multiple cursors                             "
"------------------------------------------------------------------------------"
Plug 'terryma/vim-multiple-cursors'



"------------------------------------------------------------------------------"
"                                   emmet vim                                  "
"------------------------------------------------------------------------------"
Plug 'mattn/emmet-vim'


"------------------------------------------------------------------------------"
"                                 vim gitgutter                                "
"------------------------------------------------------------------------------"
" vim gitgutter blocks the coc-nvim languale server validations in the editor
" Plug 'airblade/vim-gitgutter'


"------------------------------------------------------------------------------"
"                                  delimitMate                                 "
"------------------------------------------------------------------------------"
Plug 'Raimondi/delimitMate'


"------------------------------------------------------------------------------"
"                                nerd commenter                                "
"------------------------------------------------------------------------------"
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


"------------------------------------------------------------------------------"
"                                 comment frame                                "
"------------------------------------------------------------------------------"
Plug 'cometsong/CommentFrame.vim'


"------------------------------------------------------------------------------"
"                                   nerd tree                                  "
"------------------------------------------------------------------------------"
Plug 'scrooloose/nerdtree'
let NERDTreeMapOpenInTab='<Leader>ntt'
nnoremap <Leader>nt :NERDTree<CR>
nnoremap <Leader>ntf :NERDTreeFocus<CR>
nnoremap <Leader>1 :NERDTreeFocus<CR>
nnoremap <Leader>ntr :NERDTreeRefreshRoot<CR>
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



"------------------------------------------------------------------------------"
"                                   vim viki                                   "
"------------------------------------------------------------------------------"
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/workspace/wiki',  'syntax': 'markdown', 'ext': '.md'}]


"------------------------------------------------------------------------------"
"                                   auto save                                  "
"------------------------------------------------------------------------------"
Plug '907th/vim-auto-save'
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]


"------------------------------------------------------------------------------"
"                                    scalpel                                   "
"------------------------------------------------------------------------------"
Plug 'wincent/scalpel'


"------------------------------------------------------------------------------"
"                                  auto pairs                                  "
"------------------------------------------------------------------------------"
Plug 'jiangmiao/auto-pairs'


"------------------------------------------------------------------------------"
"                                 vim startify                                 "
"------------------------------------------------------------------------------"
" Plug 'mhinz/vim-startify'


"------------------------------------------------------------------------------"
"                                 smooth scroll                                "
"------------------------------------------------------------------------------"
Plug 'psliwka/vim-smoothie'


"------------------------------------------------------------------------------"
"                                   dev icons                                  "
"------------------------------------------------------------------------------"
Plug 'ryanoasis/vim-devicons'


"------------------------------------------------------------------------------"
"                                  quick scope                                 "
"------------------------------------------------------------------------------"
Plug 'unblevable/quick-scope'


"------------------------------------------------------------------------------"
"                                    themes                                    "
"------------------------------------------------------------------------------"
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
g:colorscheme_switcher_define_mappings=0
nnoremap <F8> :NextColorScheme<Cr>
nnoremap <F7> :PrevColorScheme<Cr>
let g:colorscheme_switcher_keep_background=1

Plug 'rafi/awesome-vim-colorschemes'
Plug 'tomasiser/vim-code-dark'

call plug#end()
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                 VIM PLUG END                                 "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"





"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                AUTO CMD START                                "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" au BufNewFile,BufRead *.ts setlocal filetype=typescript
" au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                 AUTO CMD END                                 "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"





"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                              VIM DEFAULTS START                              "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" color theme
colorscheme sonokai
set background=dark

set number
set relativenumber

" cursor
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" code folding
set foldmethod=syntax
" set foldlevelstart=-1
set nofoldenable

set spelllang=en

set shiftwidth=4
set tabstop=4

set incsearch
set ignorecase
set smartcase 

set formatoptions-=ro

set mouse=a

set splitbelow
set splitright

set scrolloff=10

" turn off status line
set laststatus=0

" clipboard copy and paste
set clipboard=unnamedplus

" replace yanked word
" binds: cpw, cpi(
nnoremap <silent> cp :let g:substitutemotion_reg = v:register
            \ <bar> set opfunc=SubstituteMotion<CR>g@

function! SubstituteMotion(type, ...)
	let l:reg = g:substitutemotion_reg
	if a:0
		silent exe "normal! `<" . a:type . "`>\"_c\<c-r>" . l:reg . "\<esc>"
	elseif a:type == 'line'
		silent exe "normal! '[V']\"_c\<c-r>" . l:reg . "\<esc>"
	elseif a:type == 'block'
		silent exe "normal! `[\<C-V>`]\"_c\<c-r>" . l:reg . "\<esc>"
	else
		silent exe "normal! `[v`]\"_c\<c-r>" . l:reg . "\<esc>"
	endif
endfunction


set t_Co=256
set nohlsearch
syntax on

" set paste is removed because it disable the coc autocompletion
" set paste

set fillchars+=vert:\|

" this is important for dev icons to work
set encoding=UTF-8


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               VIM DEFAULTS END                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"






"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                KEY BINDS START                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" go normal mode
imap <silent> jk <Esc>

" save
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" quit
nmap <c-q> :q<CR>
imap <c-q> <Esc>:q<CR>

" move line up and down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" move between split views
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" auto close bracket
" inoremap {<cr> {<cr>}<c-o>O
" inoremap {<cr> {<cr>}<c-o>O
" inoremap [<cr> [<cr>]<c-o>O<tab>
" inoremap (<cr> (<cr>)<c-o>O<tab>


" spell ckeck
map <F6> :setlocal spell! spelllang=en_us<CR>

" select functin
nnoremap <Leader>vf va{V

" switch to normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" open vimrc
nnoremap <space>e :vsp $MYVIMRC<cr>

" reload the .vimrc
nnoremap <space>r :so $MYVIMRC<cr>

" open terminal
nnoremap <Leader>tv :vsp<CR>:terminal<CR>i
nnoremap <Leader>th :sp<CR>10<C-w>_:terminal<CR>i

" remove & change the word under the cursor
nnoremap c* *Ncgn
nnoremap d* *Ndgn

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                 KEY BINDS END                                "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
