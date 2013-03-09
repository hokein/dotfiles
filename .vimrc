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
"  * shift+x: close tab
nnoremap <S-P> :tabp<cr>
nnoremap <S-N> :tabn<cr>
nnoremap <S-T> :tabnew<cr>
nnoremap <S-X> :tabclose<cr>
"%F:show the total file path
"%= set right
"%l:show line number
"%c:show colom number
"%p:show percentage in lines
"reference: http://ihacklog.com/post/vim-statusline-settings.html 
set statusline=%F\ %=row=%l\ col=%c\ %p%%
set laststatus=2

nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ff :FufFile<cr>
nnoremap <leader>fd :FufDir<cr>
nnoremap <leader>fb :FufBuffer<cr>

let g:SupertabDefaultCompletionType = "<C-X><C-O>"

"vundle plugin manage all the plugins
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'taglist.vim'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'ervandew/supertab.git' 
Bundle 'winmanager'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'AutoComplPop'
Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on

"set encode and font
set enc=utf-8
"set fileencoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set guifont=Consolas:h13:cANSI

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

"set c/c++ code style as chromium code style
"refernce: http://yyq123.blogspot.com/2010/10/vim-indent.html 
"set tab size to 2 spaces
set tabstop=2
"auto code indentation
set smartindent 
"code indent wide, 2 spaces
set shiftwidth=2
"set keyboard tab key as 2 spaces
set expandtab

"set no swap file
set nobackup
set noswapfile

"set changline automatically
set linebreak
set wrap

"search real time
set incsearch

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

"<C-x><C-o> autocomplete
"close the omnicomplete scratch preview dialog
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

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
  if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c" &&
      &filetype!= "ruby"))
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
      set makeprg=g++\ -o\ %<\ %
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
exec "!gdb %<"
elseif &filetype == "cpp"
exec "!g++ % -g -o %<"
exec "!gdb %<"
endif
endfunc

map <F8> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

map <F3> :silent! Tlist<CR> 
let Tlist_Ctags_Cmd='ctags' 
let Tlist_Use_Right_Window=1 
let Tlist_Show_One_File=0 
let Tlist_File_Fold_Auto_Close=1 
let Tlist_Exit_OnlyWindow=1 
let Tlist_Process_File_Always=0 
let Tlist_Inc_Winwidth=0

"fuzzyfinder
function! GetAllCommands()
  redir => commands
  silent command
  redir END
  return map((split(commands, "\n")[3:]),
      \      '":" . matchstr(v:val, ''^....\zs\S*'')')
endfunction

let g:fuf_com_list=[':FufBuffer',':FufFile',':FufCoverageFile',':FufDir',
            \':FufMruFile',':FufMruCmd',':FufBookmarkFile',
            \':FufBookmarkDir',':FufTag',':FufBufferTag',
            \':FufTaggedFile',':FufJumpList',':FufChangeList',
            \':FufQuickfix',':FufLine',':FufHelp',
            \":FufFile \<C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]\<CR>",
            \":FufDir \<C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]\<CR>",
            \]       
nnoremap <silent> <S-F4> :call fuf#givencmd#launch('','select cmd>', GetAllCommands())<CR>
nnoremap <silent> <F4> :call fuf#givencmd#launch('', 0, 'select>', g:fuf_com_list)<CR>

map <F2> : i<cr>#include <iostream><cr>#include <cstdio><cr>#include <cstring><cr>using namespace std;<cr><cr>int main() {<cr>  freopen("test.txt", "r", stdin);<cr><cr>  return 0;<cr>} <ESC>
