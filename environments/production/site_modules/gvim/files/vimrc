" Loading plugins
" ===============

" We want to turn off the default filetype controls for now because the way
" that vim caches filetype rules at runtime interferes with the way that vundle
" alters the runtime environment. We will change this back later:
set nocompatible
filetype off

" Next, we'll need to adjust vim's runtime path to include the vundle
" location we cloned from GitHub:
set rtp+=~/.vim/bundle/vundle/
" After that, we will call the vundle initialization function:
call vundle#rc()
"
" For GitHub repos, you specify plugins using the
" 'user/repository' format.

" This is the Vundle package, which can be found on GitHub:
Plugin 'gmarik/vundle'

" This is syntax highlighting for Scala:
Plugin 'derekwyatt/vim-scala'

" This is syntax highlightinh for Jade templates:
Plugin 'digitaltoad/vim-jade'

" This is syntax highlighting for Puppet:
Plugin 'rodjek/vim-puppet'

" This is syntax highlighting for GraphQL queries and schemas:
Plugin 'jparise/vim-graphql'


" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site, e.g.
"Plugin 'Buffergator'


" Now we can turn our filetype functionality back on
filetype plugin indent on


" Appearance
" ==========

" Use dark colorscheme:
colorscheme torte

" Change some colors of that scheme:
highlight LineNr ctermfg=darkgrey guifg=darkgrey
highlight Folded guifg=black

" Set default font:
set guifont="DejaVu Sans Mono 8"


" Ideosyncracies
" ==============

" Always set working dir according to the current file for easy switching
autocmd BufEnter * cd %:p:h

" Enable Unicode
if has("multi_byte")
    set encoding=utf-8
    " Detect encodings in this order:
    " 1) Unicode with Byte Order Mark (8/16/32 Bit), if that fails, try..
    " 2) UTF-8 (without BOM), if that fails, try..
    " 3) ISO-8859-15 = latin9 ~= ISO-8859-1/latin1 with Euro sign
    set fileencodings=ucs-bom,utf-8,iso-8859-15
    "language messages en   " Umlauts are not displayed correctly otherwise
endif

" I don't like leaving invisible litter, so I make it visible
" (This has to come after the unicode stuff)
set list listchars=tab:  ,trail:·
                      "^^ Special spaces since normal ones don't work



" Various settings
" ================

set backspace=indent,eol,start  " Allow backspacing over everything in insert mode

set mouse=a                     " Enable the mouse in all modes
set shortmess+=I                " No intro screen

set wildmenu                    " Autocompletion dropdown
set wildchar=<TAB>
set wildmode=longest,full       " First match only to the longest common string, then use full/wildmenu match
set complete=.,w,b,u,t,i,d      " Better autocomplete
set showfulltag                 " Show full tag completions

set nofoldenable                " No folding
set laststatus=1                " No status bar
set showmode                    " Shows current mode
set ruler                       " Shows current cursor position
set title                       " Name of current file in window title
set bs=2                        " Normal behaviour of the backspace key
set showcmd                     " Half-finished commands are shown
set ts=3 sw=3 expandtab         " Sensible <Tab> behaviour (Use 3 spaces for indent, no tabs)
set shiftround
set autoindent
set smartindent
set cinoptions+=(0              " Indent after nl within unclosed parentheses
set nohls                       " No highlighting of search results
set incsearch                   " Jump to result while typing search pattern
set guioptions-=T               " No toolbar in GUI mode
set number                      " Show line numbers
set virtualedit=all             " Free cursor movement
set nostartofline               " Do not jump to first character with page commands
set nowrap                      " Do not wrap long lines
set cpoptions+=n                " Make wrapped lines compatible with line numbering
set showbreak=+\ \ \ \ \ \ \ 
set guioptions+=c               " Use console dialogs (not those popups)
set display+=lastline           " A nicer way to show long wrapped lines
set linebreak
set ss=1                        " Nice sidescroll (single character steps)
set siso=9                      " Show 9 characters ahead when sidescrolling
set so=1                        " Show 1 line ahead when scrolling up/down
set keymodel=startsel           " Use windows-like shift-initiated visual mode
set selectmode=                 " Never go into select mode instead of visual
set selection=inclusive         " Always include the character the selection was started on
set mousemodel=extend           " Use mouse for visual and extend visual
set winminheight=0              " No minimum window height in split view (only titlebar visible)
set noequalalways               " All windows are equal, but some windows are more equal than others
set nrformats=alpha,hex         " Modify C-x and C-a behaviour (especially to _not_ use octal...)
"set clipboard+=unnamed          " Synchronize clipboard and 'unnamed' default register
set sessionoptions=blank,buffers,curdir,folds,resize,tabpages,winpos,winsize
set sessionoptions+=unix,slash  " make sessions files readable by both windows and unix
set hidden                      " Put buffers to the background without writing to disk and throwing history away

set ignorecase                  " ignore case in searches
set smartcase                   " BUT: not if an upper case letter is specified

let mapleader=","               " I don't even use this...
let html_use_css=1              " Use CSS when converting files to HTML (via :TOhtml)
