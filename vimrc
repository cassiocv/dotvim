" .vimrc do Cassio C. Vieira
"
" Deve ficar no início do arquivo.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Plugins do Vundle:
Bundle 'jamessan/vim-gnupg'
Bundle 'Rykka/riv.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'bkbncn/vim-colorschemes-picker'
Bundle 'scrooloose/nerdcommenter'

" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" see :h vundle for more details or wiki for FAQ

filetype plugin indent on
autocmd filetype python setlocal expandtab
autocmd filetype text setlocal spell
syntax on
" Fim do 'Deve estar no início do arquivo'.

set incsearch
set hls
set linebreak
set autowrite
set hidden
set history=1000
set spelllang=pt_br
set undolevels=500
set autoindent
" set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=2
set showcmd
set showmode
set wildmenu
set visualbell
set ignorecase
set smartcase
set formatprg=par\ -qr
set foldcolumn=5

silent! set guifont=Inconsolata\ 12
set nu

map <F2> :set paste!<Bar>set paste?<CR>
map <F3> :set wrap!<Bar>set wrap?<CR>
map <F7> :set spell!<Bar>set spell?<CR>
map <F9> :set hls!<Bar>set hls?<CR>
map <F12> :set number!<Bar>set number?<CR>

" Movimentação entre as janelas facilitada:
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" Recarrega as configurações de .vimrc (após mudanças, por exemplo), com o uso
" de: \sv
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Apresenta caracteres não visíveis com \l:
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Para apagar a última pesquisa: \SPACE
nnoremap <leader><space> :noh<cr>

" Transforma a tecla F1 em ESC (ao invés de ":help")
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" \v seleciona um texto recém colado (mas acho que só funciona com o put):
" nnoremap <leader>v V`]

" \p chama o formatador de parágrafos ``par`` com algumas opções (já passando o
" valor de ``tw``:
nmap <leader>p vip:!par -qrw<c-r>=&tw<cr><cr>

" Opção para salvar o arquivo com \w:
nnoremap <leader>w :w<CR>

" Existe uma opção para utilizar somente as Expressões regulares oficiais do
" Python, no lugar daquelas utilizadas internamente por Vim. Descomente as
" linhas a seguir para utilizar as RegEx do Python:
" nnoremap / /\v
" vnoremap / /\v

" Transformar jj em ESC:
inoremap jj <ESC>

" Show syntax highlighting groups for word under cursor with Ctrl-Shift-P:
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Transforma vim num editor de textos:
func! WordProcessorMode() 
  " colorscheme taqua
  setlocal linespace=3
  silent! setlocal guifont=Inconsolata\ 13
  setlocal formatoptions=tcq2nwa
  setlocal textwidth=72
  setlocal wrapmargin=0
  setlocal noexpandtab 
  setlocal spell
  "set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  "set complete+=s
  "set formatprg=par
  "setlocal wrap 
  setlocal colorcolumn=+1
endfu 
com! WP call WordProcessorMode()

" Supostamente desfaz os efeitos de WordProcessorMode (:WP)
func! NormalMode()
  " colorscheme manuscript
  setlocal linespace=0
  silent! setlocal guifont=Inconsolata\ 12
  setlocal textwidth=0
  setlocal wrap
  setlocal nospell
  setlocal fo=tcq
  setlocal noexpandtab
  setlocal colorcolumn=0
endfu
com! NM call NormalMode()

" A FAZER
" Transformar ; em :
" Transformar \ em ,
