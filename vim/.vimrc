let mapleader = ","
set go=

"max line length no more than 80 characters.
set colorcolumn=80

"hightlight all the cursor occurrenced word
"Space to cancel the hightlight
"normal mode:
"    * find the cursor occurrenced word, cursor switch next word.
"    # the previous word.
"Type :help key-notation to see the keyboard symbol
set hlsearch
nnoremap <Space> :noh<return>

"switch tab shortcut, in normal mode
"  * shift+p: previous tab
"  * shift+n: next tab
"  * shift+t: new tab
"  * shift+c: close tab
nnoremap <S-P> :tabp<cr>
nnoremap <S-N> :tabn<cr>
nnoremap <S-T> :tabnew<cr>
nnoremap <S-c> :tabclose<cr>

" panel navigators
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map keys for vertical/horizontal split panel
nnoremap <leader>\ <C-w>v
nnoremap <leader>- <C-w>s

nnoremap <leader>vc :VimuxPromptCommand<CR>
nnoremap <leader>vr :VimuxRunLastCommand<CR>

" map keys for resize vertical/horizontal window:
nnoremap <silent> + :exe "resize " . (winheight(0) * 4/3)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 3/4)<CR>
nnoremap <silent> > :exe "vertical resize " . (winwidth(0) * 4/3)<CR>
nnoremap <silent> < :exe "vertical resize " . (winwidth(0) * 3/4)<CR>

"%F:show the total file path
"%= set right
"%l:show line number
"%c:show colom number
"%p:show percentage in lines
"reference: http://ihacklog.com/post/vim-statusline-settings.html
set statusline=%F\ %=row=%l\ col=%c\ %p%%
set laststatus=2

nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>
nnoremap <leader>5 5gt<cr>
nnoremap <leader>6 6gt<cr>
nnoremap <leader>7 7gt<cr>
nnoremap <leader>8 8gt<cr>
nnoremap <leader>9 9gt<cr>
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ff :FufFile<cr>
nnoremap <leader>fb :FufBuffer<cr>
nnoremap <leader>cc :CoffeeCompile vert<cr>
nnoremap <leader>cw :CoffeeWatch vert<cr>

"clang-format for formating cpp code
nnoremap <leader>cf :call FormatCode("Chromium")<cr>
nnoremap <leader>lf :call FormatCode("LLVM")<cr>
vnoremap <leader>cf :call FormatCode("Chromium")<CR>
vnoremap <leader>lf :call FormatCode("LLVM")<cr>
let g:autoformat_verbosemode = 1

func FormatCode(style)
  let firstline=line(".")
  let lastline=line(".")
  " Visual mode
  if exists(a:firstline)
    firstline = a:firstline
    lastline = a:lastline
  endif
  let g:formatdef_clangformat = "'clang-format --lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=" . a:style . "'"
  let formatcommand = ":" . firstline . "," . lastline . "Autoformat"
  exec formatcommand
endfunc

"UltiSnips setting
"<c-j>/<c-k> move to next/previous argument
let g:UltiSnipsSnippetsDir = "~/.vim/snippets/"
let g:UltiSnipsExpandTrigger="<leader><tab>"

"vundle plugin manage all the plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'ervandew/supertab.git'
Bundle 'winmanager'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'kelan/gyp.vim'
Bundle 'sirver/ultisnips'
Bundle 'Chiel92/vim-autoformat'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'benmills/vimuxp'
"Bundle 'AutoComplPop'

filetype plugin indent on

"" airline settings.
let g:airline_theme = 'simple'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
" show absolute file path in status line
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" show tab number in tab line
let g:airline#extensions#tabline#tab_nr_type = 1

"set encode and font
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"set Chinese language decode in windows
set fileencodings=ucs-bom,utf-8,gbk,big5
if has('gui_running')
    set guioptions=
    if has('win32')
        set encoding=utf-8
        set fileencoding=utf-8
        set termencoding=utf-8
        au GUIEnter * simalt ~x
        "language messages zh_CN.utf-8
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        set guifont=Consolas:h13:cANSI "set English font
        set guifontwide=SimHei:h11 "set Chinese font
    endif
endif

syntax on
set t_Co=16
set background=dark
colorscheme solarized

"set line number
set number

set cindent
set smartindent

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set c/c++ code style as chromium code style
"reference: http://yyq123.blogspot.com/2010/10/vim-indent.html
"set tab size to 2 spaces
"code indent wide, 2 spaces
"set keyboard tab key as 2 spaces
autocmd BufNewFile,BufReadPost *.coffee setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType c cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal et sta sw=2 sts=2

"set no swap file
set nobackup
set noswapfile

"set changline automatically
set linebreak
set wrap

"search real time
set incsearch

"Use system clipboard as defualt.
set clipboard=unnamed
"map ctrl+c, ctrl+p copy and paste
vnoremap <C-C> "+y
nnoremap <C-P> "+gP
inoremap <C-P> <ESC>l<C-V> i
nnoremap <C-A> <ESC>ggVG
inoremap jk <esc>

"move cursor to different windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

highlight ExtraWhitespace ctermbg=3
"clean trailing extra whitespace
nnoremap <leader>bc :StripWhitespace<cr>
"Toggle whitespaces hightlighting on/off
nnoremap <leader>bb :ToggleWhitespace<cr>

"open winmanager
nnoremap wm :WMToggle<cr>

if(has("win32") || has("win95") || has("win64") || has("win16")) 
    let g:iswindows=1
else
    let g:iswindows=0
endif
autocmd BufEnter * lcd %:p:h

map <F5> :w<CR>:call Do_OneFileMake()<CR>
function Do_OneFileMake()
  if expand("%:p:h")!=getcwd()
    echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
    return
  endif
  let sourcefileename=expand("%:t")
  if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c" && &filetype!="ruby"))
    echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
    return
  endif
  let deletedspacefilename=substitute(sourcefileename,' ','','g')
  if strlen(deletedspacefilename)!=strlen(sourcefileename)
    echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
    return
  endif
  if &filetype=="c"
    if g:iswindows==1
      set makeprg=gcc\ -o\ %<.exe\ %
    else
      set makeprg=gcc\ -o\ %<\ %
    endif
  elseif &filetype=="cpp"
    if g:iswindows==1
      set makeprg=g++\ -o\ %<.exe\ %
    else
      set makeprg=g++\ -std=c++11\ -o\ %<\ %
    endif
  elseif &filetype=="ruby"
    execute "!ruby %"
    return
  endif
  if(g:iswindows==1)
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','.exe','g')
    let toexename=outfilename
  else
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','','g')
    let toexename=outfilename
  endif

  if filereadable(outfilename)
    if(g:iswindows==1)
      let outdeletedsuccess=delete(getcwd()."\\".outfilename)
    else
      let outdeletedsuccess=delete("./".outfilename)
    endif
    if(outdeletedsuccess!=0)
      set makeprg=make
      echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
      return
    endif
  endif
  execute "silent make"
  set makeprg=make

  execute "normal :"
  if filereadable(outfilename)
    if(g:iswindows==1)
      execute "!".toexename
    else
      execute "!./".toexename
    endif
  endif
  "execute "copen"

endfunction

map <F6> :call Debug()<CR>
func Debug()
exec "w"
if &filetype == 'c'
exec "!gcc % -g -o %<"
exec "!cgdb %<"
elseif &filetype == "cpp"
exec "!g++ % -g -std=c++11 -o %<"
exec "!cgdb %<"
endif
endfunc
