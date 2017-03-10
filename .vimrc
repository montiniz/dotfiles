set number

" Author: Mike Hartington
" repo  : https://github.com/mhartington/dotfiles/
"

"F1: NERDTreeToggleAndFind() [show current file]
"F2: NERDTreeToggle()
"F3: Unite file_mru
"F4: toggle tagbar
"F5: :Autoformat
"F6: toggle wrap
"F7: toggle number
"F8: close empty buffers
"F9: run with python (taking the interpreter from the first line)
"F10: --
"F11: --
"F12: --

" Set up leaders
let mapleader=","
let maplocalleader="\\"

"=============================================================================
" NeoBundle setup
"=============================================================================

" Check and auto install NeoBundle
let iCanHazNeoBundle=1
let NeoBundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(NeoBundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

if has ('vim_starting')
    if &compatible
        " Be iMproved
        set nocampatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


call neobundle#begin(expand('~/.vim/bundle/'))
let pluginsExist = 1
" Let NeoBundle manage Neobundle
"Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'neomake/neomake'
" Autocomplete for python
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'zchee/deoplete-jedi'
NeoBundle 'Vimjas/vim-python-pep8-indent'
" Do not load vim-pyenv until *.py is opened and
" make sure that it is loaded after jedi-vim is loaded
" Remove extraneous whitespace when edit mode is exited
NeoBundleLazy 'lambdalisue/vim-pyenv', {
            \ 'depends': ['davidhalter/jedi-vim'],
            \ 'autoload': {
            \ 'filetypes': ['python2', 'python3'],
            \ }}
NeoBundle 'thirtythreeforty/lessspace.vim'

" Tab completion
NeoBundle 'ervandew/supertab'

" Toggle relative absolute numbers
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'

" Required
call neobundle#end()

" Required
filetype plugin indent on
let pluginsExist=1

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"=============================================================================
"End NeoBundle Scripts-----------------------------------------------------
"=============================================================================


let g:deoplete#enable_at_startup = 1

""""""" Jedi-VIM """""""
" Don't mess up undo history
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart#smart_auto_mappings = 0
" Use:  :PyenvActivate :PyenvDeactivate
if jedi#init_python()
    function! s:jedi_auto_force_py_version() abort
        let major_version = pyenv#python#get_internal_major_version()
        call jedi#force_py_version(major_version)
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif
""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

""""""""""""General coding stuff""""""""""""
" Highlight 80th column
set colorcolumn=80
" always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" Highlight 80th column
""""""""""""Python specific""""""""""""""""
syntax enable
set showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1
let g:python_host_prog = '/home/montiniz/.pyenv/shims/python2'
let g:python3_host_prog = '/home/montiniz/.pyenv/shims/python'
""""""""""""""""Keybindings""""""""""""

