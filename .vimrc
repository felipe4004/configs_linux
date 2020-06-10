set number
set relativenumber
set tabstop=2
set autoindent
set expandtab	
set smarttab
set shiftwidth=2
set ruler
set softtabstop=4
filetype plugin on
syntax on


set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug '907th/vim-auto-save'
Plug 'nvie/vim-flake8'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'

call plug#end()

"NERDTree settings

nmap <C-f> :NERDTreeToggle<CR>

"Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"Multiple cursors settings

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"Settings for vimtex


let g:vimtex_view_method = 'zathura'



inoremap <Space><Space> <Esc>/<<Enter>"_c4l

autocmd Filetype html inoremap ;i <em></em><Space><++><Esc>FeT>i

autocmd Filetype html inoremap ;b <b></b><Space><++><Esc>FbT>i

autocmd Filetype html inoremap ;p <p></p><Enter><Enter><++><Esc>2ki

autocmd Filetype html inoremap ;h1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd Filetype html inoremap ;h2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd Filetype html inoremap ;h3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd Filetype html inoremap ;h4 <h4></h4><Enter><Enter><++><Esc>2kf<i
autocmd Filetype html inoremap ;h5 <h5></h5><Enter><Enter><++><Esc>2kf<i
autocmd Filetype html inoremap ;h6 <h6></h6><Enter><Enter><++><Esc>2kf<i

autocmd Filetype html inoremap ;a <a<Space>href=""<++>><++></a><Enter><Enter><++><Esc>2kf"li
autocmd Filetype html inoremap ;ht <html><Enter><Enter><Enter><Enter></html><Esc>2ki
autocmd Filetype html inoremap ;he <head><Enter><Enter></head><Enter><++><Esc>2ki
autocmd Filetype html inoremap ;bo <body><Enter><++><Enter></body><Esc>2kFya
autocmd Filetype html inoremap ;br <br>
autocmd Filetype html inoremap ;im <img src="" alt="<++>"<++></img><Enter><Enter><++><Esc>2k0f"li
autocmd Filetype html inoremap ;bf <b></b><Space><++><Esc>FbT>i
autocmd Filetype html inoremap ;q <q></q><Space><++><Esc>FqT>i
autocmd Filetype html inoremap ;s <style><Enter><Enter></style><Esc>ki
autocmd Filetype html inoremap ;bu <button><++></button><Enter><Enter><++><Esc>2k0fna
autocmd Filetype html inoremap ;ul <ul><Enter><++><Enter></ul><Enter><Enter><++><Esc>4ki
autocmd Filetype html inoremap ;li <li></li><Space><++><Esc>0f>a
autocmd Filetype html inoremap ;ol <ol><Enter><++><Enter></ol><Enter><Enter><++><Esc>4ki
autocmd Filetype html inoremap ;d <div><Enter><++><Enter></div><Enter><Enter><++><Esc>4k0fva
autocmd Filetype html inoremap ;ti <title></title><Enter><++><Esc>k0f>a
autocmd Filetype html inoremap ;lk <link rel="" href="<++>"><Enter><++><Esc>kf"a
autocmd Filetype html inoremap ;me  <meta ><Enter><++><Esc>k0f>i
autocmd Filetype html inoremap ;sc  <script><Enter><Enter></script><Enter><++><Esc>2ki
autocmd Filetype html inoremap ;fu  function {<Enter><++><Enter>}<Enter><++><Esc>3k0f{i


"Tex 

autocmd Filetype tex inoremap ;mi \begin{minipage}{\textwidth}<Enter><++><Enter>\end{minipage}<Enter><++><Esc>3kF\i
autocmd Filetype tex inoremap ;fi \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=<++>\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>4k0i
autocmd Filetype tex inoremap ;sfi \begin{subfigure}[H]<Enter>\centering<Enter>\includegraphics[width=<++>\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter><++><Esc>4k0i
autocmd Filetype tex inoremap ;bf \textbf{}<Space><++><Esc>F}i
autocmd Filetype tex inoremap ;gt \begin{gather}<Enter><Enter>\end{gather}<Enter><++><Esc>2ki
autocmd Filetype tex inoremap ;sc   \section{}<Enter><Enter><++><Esc>2kf}i
autocmd Filetype tex inoremap ;ssc  \subsection{}<Enter><Enter><++><Esc><2kf}i
autocmd Filetype tex inoremap ;sssc \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd Filetype tex inoremap ;be   \begin{equation}<Enter><Enter>\end{equation}<Esc>ki
autocmd Filetype tex inoremap ;ci  \begin{figure}<Enter>\centering<Enter>\begin{circuitikz}[line width = .5pt, scale = .8, transform shape]<Enter>\draw<Enter><Enter>\end{circuitikz}<Enter>\caption{<++>}<Enter>\label{circ:<++>}<Enter>\end{figure}<Enter><Enter><++><Esc>6ki
autocmd Filetype tex inoremap ;sci  \begin{subfigure}<Enter>\centering<Enter>\begin{circuitikz}[line width = .5pt, scale = .8, transform shape]<Enter>\draw<Enter><Enter>\end{circuitikz}<Enter>\caption{<++>}<Enter>\label{circ:<++>}<Enter>\end{subfigure}<Enter><Enter><++><Esc>6ki
autocmd Filetype tex inoremap ;it   \begin{itemize}<Enter>\item<Enter>\end{itemize}<Enter><Enter><++><Esc>3kA
autocmd Filetype tex inoremap ;df   \dfrac{}{<++>}<Space><++><Esc>Fclli
