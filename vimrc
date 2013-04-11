" Vim Addon Manager setup magic
fun! EnsureVamIsOnDisk(vam_install_path)
  let is_installed_c = "isdirectory(a:vam_install_path.'/vim-addon-manager/autoload')"
  if eval(is_installed_c)
    return 1
  else
    if 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
      call mkdir(a:vam_install_path, 'p')
      execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
      exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
    endif
    return eval(is_installed_c)
  endif
endf

fun! SetupVAM()
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  if !EnsureVamIsOnDisk(vam_install_path)
    echohl ErrorMsg
    echomsg "No VAM found!"
    echohl NONE
    return
  endif
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " Tell VAM which plugins to fetch & load:
  call vam#ActivateAddons(['UltiSnips','The_NERD_tree', 'The_NERD_Commenter', 'taglist', 'align', 'matchit.zip', 'Command-T', 'surround', 'repeat', 'ack', 'bufexplorer.zip', 'clang_complete', 'github:altercation/vim-colors-solarized', 'autoload_cscope', 'CCTree', 'Syntastic', 'vim-gitgutter', 'fugitive', 'powerline'], {'auto_install' : 0})
endfun
call SetupVAM()

" ack config
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

set nocompatible    " use vim defaults
set ls=2            " allways show status line
set expandtab
set tabstop=3       " numbers of spaces of tab character
set softtabstop=3   " numbers of spaces of tab character (for BS)
set shiftwidth=3    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case
set smartcase       " ignore itnorecase if upper case used
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

set nocindent  

set sm              " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines
set mouse=a
set ttymouse=xterm2
set background=dark
colorscheme solarized " use this color scheme (e.g. desert)

syntax on           " syntax highlighing
if has("gui_running")
    " See ~/.gvimrc
    set guifont=Monospace\ 10  " use this font
    set lines=50       " height = 50 lines
    set columns=100        " width = 100 columns
    "set selectmode=mouse,key,cmd
endif

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    
    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    au FileType cpp,c,java,sh,pl,php,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,asp  set cindent
    "au BufRead mutt*[0-9] set tw=72
    
    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  *.pc     set filetype=cpp
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
endif

set nocp
filetype plugin on

"map <Tab> :bn<Enter>
nnoremap <silent> <F7> :CommandT<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
map <F9> :NERDTreeToggle<Enter>
map <F10> :A<Enter>

"handle bracket autocompletion
inoremap {<CR> {<CR><BS>}<Esc>ko

nmap \q :nohlsearch<CR>

"set ctags for std lib
set tags+=~/.vim/tags/cpp
set tags+=./tags,/

let g:miniBufExplMapWindowNavVim = 1 " use ctrl + hjkl to move between windows
let g:miniBufExplMapWindowNavArrows = 1 " the same for arrows

"set mru plugin
let MRU_Auto_Close = 1
let MRU_Add_Menu = 0 

set autochdir " working directory is always the same as edited buffer
set colorcolumn=80
map <F2> :NERDTreeToggle<CR>

set ssop-=options " do not store global and local values in a session
set ssop-=folds " do not store folds
set foldmethod=marker

" highligh extra whitespace
" see http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
nnoremap <Leader>wn :match ExtraWhitespace /\s\+$/<CR>
nnoremap <Leader>wf :match<CR>

" highligh tab indent
highlight TabIndent ctermbg=darkgrey guibg=darkgrey
nnoremap <Leader>tn :match TabIndent /^\t\+/<CR>
nnoremap <Leader>tf :match<CR>

let g:clang_user_options='|| exit 0'

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 
