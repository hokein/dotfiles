##Destop Shotcuts

`win+d`: show desktop
`alt+tab`: next application
`alt+tab+shift`: previous application
`win+->`: next workspace
`win+<-`: previous workspace
`win+t`: open terminal
`win+x`: close application
`alt+m`: move the current window

##Xfce4 Terminal Shotcuts

`ctrl+shift+t`: open a new tab
`ctrl+shift+x`: close the tab
`ctrl+,`: previous tab
`ctrl+.`: next tab

##Vim 

My vim use [Vundle](https://github.com/gmarik/vundle) to manage all the plugins. 
It easy to keep the same on three platforms(Windows/Linux/Mac).

###Installation 

For windows, please install Vundle first, refer to the [tutorial](https://github.com/gmarik/vundle/wiki/Vundle-for-Windows) for more details.

If ~/.vim/bundle directory is not exit, create first.

    ~/$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ~/$ git clone https://github.com/hokein/dotfiles.git
    ~/$ ln -s ~/dotfiles/.vimrc ~/.vimrc

open vim, then run the command to install all the plugins:

    :BundleInstall

###Vim Shotcuts

**Normal mode**

`<leader>`: ","

`shift+n`: next tab
`shift+p`: previous tab
`shift+x`: close tab
`shift+t`: new tab
`space`: cancel search highlight
`ctrl+a`: select all the content in visual mode

`F2`: cpp template
`F3`: ctag list
`F5`: compile the current cpp/c file
`F6`: use gdb to debug the compile file
`wm`: open the winmanager

`leader ev`: open a new tab edit .vimrc
`leader sv`: source .vimrc
`leader ff`: open fuf file list.
`leader fb`: open fuf buffer list.
`leader fd`: open fuf dir list.

**Insert mode**

`jk`: return to Normal mode
`ctrl+p`: paste the system clipboard content

**Visual mode**

`ctrl+c`: copy the select content to system clipboard
`ctrl+p`: paste the system clipboard content
