set mouse=a
set nu
set tabstop=4
set backspace=2
set softtabstop=4
set shiftwidth=4 
set ruler   
set nocompatible              " be iMproved, required
set spell
set spelllang=nl,en_us,cjk
set smarttab
syntax on
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red "ctermbg=blue
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap wq :wq<CR>
nnoremap qw :wq<CR>
nnoremap <C-k> :LL<CR>
nnoremap w :w<CR>
nnoremap z. :q<CR>
inoremap <C-k> <Esc>:LL<CR>i
vmap <C-c> "+y
vmap <C-v> "+p

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/tmath_snippets

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'vim-latex/vim-latex'
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jalvesaq/Nvim-R'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'SirVer/ultisnips'
Plugin 'preservim/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'preservim/nerdcommenter'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'heavenshell/vim-pydocstring'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'Valloric/YouCompleteMe'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'chrisbra/csv.vim'

Plugin 'Shougo/unite.vim' " for citation using citation.vim
Plugin 'jalvesaq/zotcite'   " for citation integration with zotero used in rmarkdown
Plugin 'rafaqz/citation.vim' " for citation used anywhere in md or rmd files

" snippet framework beginning
Plugin 'ncm2/ncm2'  " snippet engine
Plugin 'roxma/nvim-yarp' " dependency
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'gaalcaras/ncm-R' " snippets
Plugin 'ncm2/ncm2-ultisnips' " ncm and ultisnips integration

" snippets framework end

Plugin 'junegunn/goyo.vim' "for nice zoom effet when editing, see screenshot below
Plugin 'ferrine/md-img-paste.vim' "paste directly image in system clipboard to rmarkdown by putting images in an /img folder (created automatically
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-rmarkdown'
call vundle#end()            " required

filetype plugin indent on    " required

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf = 'open -a Skim'

autocmd filetype tex setl updatetime=1000

let g:livepreview_previewer = 'open -a Skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_confirm_extra_conf=0      
let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1   
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=2  
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc



"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
syntax on
map <leader>n <plug>NERDTreeTabsToggle <CR>         "设置打开目录树的快捷键
nmap <silent> <C-I> <Plug>(pydocstring)
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1
"set Tlist_Inc_Winwidth = 0
map <F3> :TlistToggle <CR>

function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction
nmap <F10> :call UpdateCtags()<CR>

" configuration for vim-pandoc and vim-rmarkdown 
let g:pandoc#syntax#conceal#use = 0 

autocmd BufWritePost *.Rmd RMarkdown pdf latex_engine="xelatex", toc=TRUE 
autocmd BufNewFile,BufRead *.Rmd UltiSnipsAddFiletypes r.tex

vmap <C-x> :!pbcopy<CR>   
vmap <C-c> :w !pbcopy<CR><CR>