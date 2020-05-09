" Install vim-plug if needed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =============================================================================
call plug#begin('~/.vim/plugged')
" =============================================================================

Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bagrat/vim-buffet'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-bookmark', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-calc', {'do': 'yarn install --frozen-lockfile'}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'antonk52/coc-cssmodules', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'pappasam/coc-jedi', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-svg', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-tasks', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-template', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-texlab', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-todolist', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'fannheyward/coc-xml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}

Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }

" =============================================================================
call plug#end()
" =============================================================================

set number
set relativenumber
set cursorline
set mouse=a
let mapleader=" "
set encoding=UTF-8
set listchars=tab:>.
set list
set autoindent
set smartindent
set scrolloff=4
set foldmethod=indent
set foldlevel=99
set foldenable
set ignorecase
set smartcase
set expandtab
set tabstop=4
set shiftwidth=4

nnoremap <silent> <leader>gc  :<C-u>e $MYVIMRC<cr>
nnoremap <silent> <leader>sr  :<C-u>source $MYVIMRC<cr>
nnoremap <silent> <leader>pu  :<C-u>source $MYVIMRC<cr>:PlugUpdate<cr>
nnoremap <silent> <leader>pc  :<C-u>source $MYVIMRC<cr>:PlugClean<cr>

" =============================================================================
" {{{ Coc start
" =============================================================================
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr><c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <leader>la  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <leader>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <leader>lc  :<C-u>CocList commands<cr>
" Search workspace symbols.
nnoremap <silent> <leader>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leaer>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>lk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>lp  :<C-u>CocListResume<CR>
" Resume latest coc list.
nnoremap <silent> <leader>lS  :<C-u>CocList --auto-preview --interactive symbols<CR>
nnoremap <silent> <leader>ls  viwy:<C-u>CocList --auto-preview --interactive symbols<CR>:sleep 100ms<CR><C-r>0
xnoremap <silent> <leader>ls  y:<C-u>CocList --auto-preview --interactive symbols<CR>:sleep 100ms<CR><C-r>0
" Find symbol of current document.
nnoremap <silent> <leader>lO  :<C-u>CocList --auto-preview outline<cr>
nnoremap <silent> <leader>lo  viwy:<C-u>CocList --auto-preview outline<cr>:sleep 100ms<CR><C-r>0
xnoremap <silent> <leader>lo  y:<C-u>CocList --auto-preview outline<cr>:sleep 100ms<CR><C-r>0

" Resume latest coc list.
nnoremap <silent> <leader>in  :<C-u>CocInstall
" Explore
nnoremap <silent> <leader>fe  :<C-u>CocCommand explorer<CR>

" append result on current expression
nmap <silent> <Leader>ca <Plug>(coc-calc-result-append)
" replace result on current expression
nmap <silent> <Leader>cr <Plug>(coc-calc-result-replace)

nmap <silent> <Leader>bt <Plug>(coc-bookmark-toggle)
nmap <silent> <Leader>ba <Plug>(coc-bookmark-annotate)
nmap <silent> <Leader>lb :<C-u>CocList --auto-preview bookmark<CR>

" =============================================================================
" Coc end }}}
" =============================================================================


" =============================================================================
" {{{ vim-buffet start
" =============================================================================
nmap <silent> <leader>1 <Plug>BuffetSwitch(1)
nmap <silent> <leader>2 <Plug>BuffetSwitch(2)
nmap <silent> <leader>3 <Plug>BuffetSwitch(3)
nmap <silent> <leader>4 <Plug>BuffetSwitch(4)
nmap <silent> <leader>5 <Plug>BuffetSwitch(5)
nmap <silent> <leader>6 <Plug>BuffetSwitch(6)
nmap <silent> <leader>7 <Plug>BuffetSwitch(7)
nmap <silent> <leader>8 <Plug>BuffetSwitch(8)
nmap <silent> <leader>9 <Plug>BuffetSwitch(9)
nmap <silent> <leader>0 <Plug>BuffetSwitch(10)
" =============================================================================
" vim-buffet end }}}
" =============================================================================

" =============================================================================
" {{{ Clap start
" =============================================================================
let g:clap_theme = 'material_design_dark'
nnoremap <silent> <C-p>  :<C-u>Clap files<CR>
xnoremap <silent> <C-p>  y:<C-u>Clap files<CR><C-r>0

nnoremap <silent> <leader>cR  :<C-u>Clap grep<CR>
nnoremap <silent> <leader>cr  viwy:<C-u>Clap grep<CR><C-r>0
xnoremap <silent> <leader>cr  y:<C-u>Clap grep<CR><C-r>0

nnoremap <silent> <leader>cM  :<C-u>Clap grep2<CR>
nnoremap <silent> <leader>cm  viwy:<C-u>Clap grep2<CR><C-r>0
xnoremap <silent> <leader>cm  y:<C-u>Clap grep2<CR><C-r>0
" =============================================================================
" Clap end }}}
" =============================================================================
