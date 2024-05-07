" taken from https://github.com/neoclide/coc.nvim#example-vim-configuration

function! CocInitialise()
  if !exists('g:did_coc_loaded')
    echo 'coc not installed!'
    return
  endif

  set updatetime=300
  set signcolumn=yes
  let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  autocmd CursorHold * silent call CocActionAsync('highlight')

  nmap <leader>rn <Plug>(coc-rename)

  function! FindCursorPopUp()
     let radius = get(a:000, 0, 2)
     let srow = screenrow()
     let scol = screencol()

     for r in range(srow - radius, srow + radius)
       for c in range(scol - radius, scol + radius)
         let winid = popup_locate(r, c)
         if winid != 0
           return winid
         endif
       endfor
     endfor

     return 0
   endfunction

   function! ScrollPopUp(down)
     let winid = FindCursorPopUp()
     if winid == 0
       return 0
     endif

     let pp = popup_getpos(winid)
     call popup_setoptions( winid,
           \ {'firstline' : pp.firstline + ( a:down ? 1 : -1 ) } )

     return 1
   endfunction

   nnoremap <expr> <c-d> ScrollPopUp(1) ? '<esc>' : '<c-d>'
   nnoremap <expr> <c-u> ScrollPopUp(0) ? '<esc>' : '<c-u>'

   # https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
   hi CocInlayHint guifg=#6c6c6c ctermfg=242
endfunction

autocmd! User coc.nvim call CocInitialise()
