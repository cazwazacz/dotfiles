set number
set tabstop=2
set shiftwidth=2
set autoindent
filetype on
filetype plugin on
filetype indent on

let mapleader=" "
nnoremap <SPACE> <Nop>

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-commentary'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" gruvbox theme
	" Plug 'morhetz/gruvbox'
	" Plug 'sainnhe/everforest'
	Plug 'sainnhe/sonokai'

  " :help ale
  Plug 'dense-analysis/ale'

  " Language Server Protocol
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

	" vim ruby
	Plug 'vim-ruby/vim-ruby'

  " Frontend
  Plug 'leafgarland/typescript-vim'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

  Plug 'jason0x43/vim-js-indent'
call plug#end()

" Lint with ALE
augroup ale
  autocmd!

  autocmd VimEnter *
    \ let g:ale_lint_on_enter = 1 |
    \ let g:ale_lint_on_text_changed = 0
augroup END

" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
let g:coc_global_extensions = [
  \ 'coc-prettier',
  \ 'coc-tsserver',
	\ 'coc-solargraph'
  \ ]

" Tab complete with COC
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Jump to definition, implementation, or call sites
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" When all else fails, grep word under cursor with "K"
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" FZF key bindings
" nnoremap <C-f> :FZF<CR>
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>b :Buffers<CR>
" ripgrep
nnoremap <silent> <Leader>f :Rg<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" save file
nnoremap <silent> <leader>fs :w<CR>

" initialize grubox theme
" autocmd vimenter * ++nested colorscheme everforest

" if !exists('g:syntax_on')
"   syntax on
" endif

" if !exists('g:loaded_color')
"   let g:loaded_color = 1

  " set background=light
"   " Put your favorite colorscheme here
"   colorscheme gruvbox
" endif

" colorscheme gruvbox
" colorscheme everforest
" colorscheme sonokai

" load ruby autocomplete stuff
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" make ripgrep not look at filenames
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

