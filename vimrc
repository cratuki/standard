" --------------------------------------------------------
"   exhaustive list of vim options to blast out
"   whatever braindead defaults the current
"   distribution is trying to foist on me.
" --------------------------------------------------------
set t_Co=256
colorscheme evening

set ambiwidth=single
set autoindent
set backupcopy=auto
set backupext=~
set backupskip=~/.vim.tmp/*
set backspace=2
set bufhidden=
set buflisted
set buftype=
set cdpath=,,
set cedit=^F
set charconvert=
set cinoptions=
"set cmdheight=1
"set cmdwinheight=7
"set columns=148
set cscopepathcomp=0
set cscopeprg=cscope
set cscopequickfix=
set cscopetagorder=0
set debug=
set dictionary=
set diffexpr=
set diffopt=filler
set display=
set eadirection=both
set encoding=latin1
set endofline
set equalalways
set equalprg=
set esckeys
set eventignore=
set fileencoding=
set fileformat=unix
set filetype=
set formatoptions=cq
set formatprg=
"set helpheight=20
set helplang=
set history=50
set iconstring=
set iminsert=0
set imsearch=0
set includeexpr=
set indentexpr=
set isprint=@,161-255
set nojoinspaces
set key=
set keymap=
set keymodel=
set keywordprg=man
set langmap=
set langmenu=
set laststatus=1
"set lines=51
set listchars=eol:$
set loadplugins
set magic
set makeef=
set makeprg=make
set matchtime=5
set maxfuncdepth=100
set maxmapdepth=1000
set maxmem=72824
set maxmemtot=72824
set menuitems=25
set modeline
set modelines=5
set modifiable
set modified
set more
set mouse=
set mousemodel=extend
set mousetime=500
set noallowrevins
set noaltkeymap
set noarabic
set noautoread
set noautowrite
set noautowriteall
set nobackup
set nobinary
set nobomb
set nocindent
set nocompatible
set noconfirm
set nocopyindent
set nocscopetag
set nocscopeverbose
set nodelcombine
set nodiff
set nodigraph
set noedcompatible
set noerrorbells
set expandtab
set noexrc
set nofkmap
set nogdefault
set nohidden
set nohkmap
set nohkmapp
set nohlsearch
set noicon
set noignorecase
set noincsearch
set noinfercase
set noinsertmode
set nolazyredraw
set nolinebreak
set nolisp
set nolist
set nonumber
set nopaste
set nopreserveindent
set nopreviewwindow
set noreadonly
set norevins
set norightleft
set noscrollbind
set nosecure
set noshiftround
set noshortname
set noshowcmd
set noshowfulltag
set noshowmatch
set nosmartcase
set nosmartindent
set nosmarttab
set nosplitbelow
set nosplitright
set notermbidi
set noterse
set notextmode
set notildeop
set notitle
set nottimeout
set novisualbell
set noweirdinvert
set nowildmenu
"set nowinfixheight
set nowriteany
set pastetoggle=
set patchexpr=
set patchmode=
"set previewheight=12
set printdevice=
set printencoding=
set printfont=courier
set printoptions=
set remap
set report=2
set ruler
set rulerformat=
"set scroll=25
set scrolljump=1
set scrolloff=0
set selectmode=
set shell=/bin/bash
set shellcmdflag=-c
set shellquote=
set shellxquote=
set shiftwidth=2
set showbreak=
set showmode
set sidescroll=0
set sidescrolloff=0
set softtabstop=0
set startofline
set statusline=
set suffixesadd=
set swapfile
set swapsync=fsync
set switchbuf=
set syntax=
set tabstop=4
set tagbsearch
set taglength=0
set tagrelative
set tagstack
set term=vt100
set termencoding=
set textauto
set textwidth=0
set thesaurus=
set notimeout " affects leader key timeout
set timeoutlen=1000
set titlelen=85
set titlestring=
set ttimeoutlen=-1
set ttybuiltin
set ttyfast
set ttymouse=
set ttyscroll=999
set ttytype=vt100
set undolevels=1000
set updatecount=200
set updatetime=4000
set verbose=0
"set viminfo='20,"50
set virtualedit=
set warn
set whichwrap=b,s
set wildchar=<Tab>
set wildcharm=0
set wildignore=
set wildmode=full
"set winheight=1
"set winminheight=1
set winminwidth=1
set winwidth=20
set wrap
set wrapmargin=0
set wrapscan
set write
set writebackup
set writedelay=0


" --------------------------------------------------------
"   functions
" --------------------------------------------------------
function! ToggleSyntax()
    if exists("g:syntax_on")
       silent syntax off
    else
       silent syntax enable
    endif
endfunction

function! NiceWrap()
    if &l:textwidth == 0
        let b:clear_wrap = 1
        set textwidth=78
    else
        let b:clear_wrap = 0
    endif
    :normal gq}
    if b:clear_wrap
        set textwidth=0
    endif
    unlet b:clear_wrap
endfunction


" --------------------------------------------------------
"   favourite aliases
" --------------------------------------------------------
let mapleader=" "

nmap <leader>- :set noai<CR>
nmap <leader>= :set ai<CR>
"
" Vertical split. Close with :q, not with buffer delete.
nmap <leader>\ :vsplit<CR>
"
" Once you have a vsplit, you can switch between sides
" using these shortcuts.
nmap <leader>[ :wincmd h<CR>
nmap <leader>] :wincmd l<CR>

nmap <leader><BS> :bdelete<CR>

nmap <leader>' :call NiceWrap()<CR>

nmap <leader>j gj
nmap <leader>k gk
nmap <leader>h :bp<CR>
nmap <leader>l :bn<CR>

" make and run
nmap <leader>m :make<CR>
nmap <leader>, :!./app<CR>
nmap <leader>. :make test<CR>
nmap <leader>/ :!./run_tests<CR>
nmap <leader><CR> :make debug<CR>

nmap <leader>e :e<SPACE>
nmap <leader>r :r<SPACE>
nmap <leader>w :w<CR>
nmap <leader>W :!sudo tee % > /dev/null
vmap <leader>p :!pwspace<CR>
nmap <leader>P :%!pwspace<CR>
nmap <leader>p :!pwd<CR>
nmap <leader>q :q<CR>
nmap <leader>x :qa!<CR>
nmap <leader>s :call ToggleSyntax()<CR>

nmap <leader>` :silent !retag<CR>
"nmap <leader>n :silent !nano<CR><C-F><C-B>
nmap <leader>t :set textwidth=78<CR>
nmap <leader>y :set textwidth=0<CR>

nmap <leader>; :
map <leader>1 :!
nmap <leader>2 :retab<CR>
nmap <leader>@ :set expandtab!<CR>:set expandtab?<CR>
nmap <leader>3 O#<CR><ESC>O#<CR><ESC>kO# <ESC>a
nmap <leader># O--<CR><ESC>O--<CR><ESC>kO-- <ESC>a
nmap <leader>4 O--------------------------------------------------------<ESC>O--------------------------------------------------------<ESC>o<SPACE><SPACE><SPACE><SPACE>
nmap <leader>5 :set ai<CR>O<ESC>a    =========================================<ESC>O<ESC>a    =========================================<ESC>O
nmap <leader>% :set ai<CR>O<ESC>a    =========================================<ESC>O<ESC>a^   =========================================<ESC>O    :
nmap <leader>6 O# --------------------------------------------------------<ESC>O# --------------------------------------------------------<ESC>o#   :<ESC>a
nmap <leader>& O// --------------------------------------------------------<ESC>O// --------------------------------------------------------<ESC>o//  <ESC>a
nmap <leader>7 O-------------------------------------------------------- */<ESC>O/* --------------------------------------------------------<ESC>o@<ESC>a
nmap <leader>8 O------------------------------------------------------ --]]<ESC>O--[[ ------------------------------------------------------<ESC>o   <ESC>a

" This is useful for backing out in autoindent
map <C-o> <BS><BS><BS><BS>


" --------------------------------------------------------
"   config niceties
" --------------------------------------------------------
"
" syntax highlighting
set background=dark
if has("gui_running")
  set background=light
endif
set ttytype=ansi
"
" http://www.linusakesson.net/programming/syntaxhighlighting/
sy on
"
" danger is my middle name
set backupcopy=auto
"
" abolish 'this file has changed since you last..' msg
set autoread
"
" allow multiple buffers to be open at once
set hidden
"
" trim message sizes
set shortmess=atIT
"
" no beeping please
set visualbell
"
" to do with the way files are loaded
set wildmode=longest,list
set wildmenu


" --------------------------------------------------------
"   makefiles
" --------------------------------------------------------
" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0


" --------------------------------------------------------
"   ctags
" --------------------------------------------------------
" http://blog.vinceliu.com/2007/08/vim-tips-for-java-2-using-exuberant.html
autocmd FileType java set tags=~/.java_tags

"set tags=./tags;~/Projects
set tags=./tags


" --------------------------------------------------------
"   hacks to get around annoyances
" --------------------------------------------------------
"
" disable the title bar in gvim
set guioptions-=T

"
" turns off some rubbish in a linux distribution
" somewhere that annoyed the hell out of me at some time.
filetype indent off
filetype plugin off
filetype plugin indent off

"
" terra syntax highlighting
au BufRead,BufNewFile *.terra setfiletype terra


" --------------------------------------------------------
"   unicode
" --------------------------------------------------------
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

