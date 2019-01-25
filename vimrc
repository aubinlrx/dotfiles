" ----------------------------------------------------------
" KEY MAPS
" ----------------------------------------------------------
nmap \A :set formatoptions+=a<CR>:echo "autowrap enabled"<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shifttabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \a :set formatoptions-=a<CR>:echo "autowrap disabled"<CR>
nmap \b :set nocin tw=80<CR>:set formatoptions+=a<CR>
nmap \c :call TmuxPaneClear()<CR>
nmap \e :NERDTreeToggle<CR>
nmap \f mt:Goyo<CR>'tzz
nmap \g :Gstatus<CR>
nmap \i vip:sort<CR>
nmap \l :setlocal number!<CR>:setlocal number?<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap \o :set paste!<CR>:set paste?<CR>
nmap \p :ProseMode<CR>
nmap \q :nohlsearch<CR>
nmap \r :call TmuxPaneRepeat()<CR>
nmap \s :setlocal invspell<CR>
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \u :setlocal list!<CR>:setlocal list?<CR>
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap \x :cclose<CR>
nmap \z :w<CR>:!open %<CR><CR>

" Tuen off linewise keys. Normally, the 'j' and 'k' keys move the cursor down
" one entire line. with line wrapping on, this can cause the cursor to actually
" skip a few lines on the screen because it's moving from line N to line N+1 in
" the file. I want this to act more visually -- I want 'down' to mean the next
" line on the screen
nmap j gj
nmap k gk

nmap <C-e> :e#<CR>

" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Search for the word under the cursor in the current directory
nmap <M-k> mo:Ack! "\b<cword>\b" <CR>
nmap <Esc>k mo:Ack! "\b<cword>\b" <CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "User l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set backspace=2      " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile       " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set incsearch        " do incremental searching
set laststatus=2     " Always display the status line
set autowrite        " Automatically :write before running commands

" Line number
set number
set numberwidth=5
set relativenumber
set cursorline
set lazyredraw

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Syntax specific
" set ruby_space_errors = 1

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
inoremap jk <ESC>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Make the cursor stay on the same line when window switching
function! KeepCurrentLine(motion)
  let theLine = line('.')
  let theCol = col('.')
  exec 'wincmd' . a:motion
  if &diff
    call cursor(theLine, theCol)
  endif
endfunction
nnoremap <C-w>h :silent call KeepCurrentLine('h')<CR>
nnoremap <C-w>l :silent call KeepCurrentLine('l')<CR>

" -----------------------------------------------------------------------------
" ABBREVIATIONS
" -----------------------------------------------------------------------------

" I can't spell :(
abbr conosle console
abbr comopnent component

" Debugg helpers
autocmd BufEnter *.coffee iabbr xxx console.log 'XXX',
autocmd BufEnter *.coffee iabbr yyy console.log 'YYY',
autocmd BufEnter *.coffee iabbr zzz console.log 'ZZZ',
autocmd BufEnter *.js iabbr xxx console.log('XXX',
autocmd BufEnter *.js iabbr yyy console.log('YYY',
autocmd BufEnter *.js iabbr zzz console.log('ZZZ',

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" -------------------------------------------------
" PLUGIN SETTINGS
" -------------------------------------------------

" For any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" GitGutter styling to use instead of +/-
let g:gitgutter_sign_added = '.'
let g:gitgutter_sign_modified = '.'
let g:gitgutter_sign_removed = '.'
let g:gitgutter_sign_modified_removed = '.'

" SuperTab
let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1

" -----------------------------------------------------------------------------
" COLORS
" -----------------------------------------------------------------------------

" Theme
syntax on
set t_Co=16 "256 not working on Ubuntu 14.04
let g:solarized_termcolors=16 "256
set background=dark
colorscheme solarized

" Custom search colors
highlight clear Search
highlight Search term=NONE cterm=NONE ctermfg=white ctermbg=black

" Make highlighted matching parents less annoying
highlight clear MatchParen
highlight link MatchParen Search

" Make trailing spaces very visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" Markdown could be more fruit salady
highlight link markdownH1 PreProc
highlight link markdownH2 PreProc
highlight link markdownLink Character
highlight link markdownBold String
highlight link markdownItalic Statement
highlight link markdownCode Delimiter
highlight link markdownCodeBlock Delimiter 
highlight link markdownListMarker Todo 

" Custom mode for distraction-free editing
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colors solarized
endfunction
command! ProseMode call ProseMode()

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happend when dropping a file on gvim)
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
 
  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " ALE linting events
  if g:has_async
    set updatetime=1000
    let g:ale_line_on_text_changed = 0
    autocmd CursorHold * call ale#Lint()
    autocmd CursorHoldI * call ale#Lint()
    autocmd InsertEnter * call ale#Lint()
    autocmd InsertLeave * call ale#Lint()
  else
    echoerr "The aubinlrx dotfile require NeoVIm or Vim 8"
  endif
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space not two, after punctuations.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrl_p_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ =complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

