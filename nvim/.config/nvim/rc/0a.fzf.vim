nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>fh :Files ~<CR>
nnoremap <silent> <leader>ft :FZF %:p:h<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>fd :BCommits<CR>

if has('nvim')
  if exists('*nvim_open_win')
    " 让输入上方，搜索列表在下方
    let $FZF_DEFAULT_OPTS = '--layout=reverse'

    " 打开 fzf 的方式选择 floating window
    let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }


    function! OpenFloatingWin()
      let height = &lines - 3
      let width = float2nr(&columns - (&columns * 2 / 10))
      let col = float2nr((&columns - width) / 2)

      " 设置浮动窗口打开的位置，大小等。
      " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
      let opts = {
            \ 'relative': 'editor',
            \ 'row': height * 0.3,
            \ 'col': col,
            \ 'width': width,
            \ 'height': height * 2 / 3
            \ }

      let buf = nvim_create_buf(v:false, v:true)
      let win = nvim_open_win(buf, v:true, opts)

      " 设置浮动窗口高亮
      call setwinvar(win, '&winhl', 'Normal:Pmenu')

      setlocal
            \ buftype=nofile
            \ nobuflisted
            \ bufhidden=hide
            \ nonumber
            \ norelativenumber
            \ signcolumn=no
    endfunction
  endif
endif

"ag
if executable('ag')
    nnoremap <Leader>pf :Ag<cr>
    let s:fzf_custom_command = 'ag --hidden -l --nocolor --nogroup '.'
                \ --ignore "*.[odODaA]"
                \ --ignore "*.exe"
                \ --ignore "*.out"
                \ --ignore "*.hex"
                \ --ignore "cscope*"
                \ --ignore "*.so"
                \ --ignore "*.dll"
                \ --ignore ".git"
                \ -g ""'
    let $FZF_DEFAULT_COMMAND=s:fzf_custom_command
elseif executable('rg')
    let s:fzf_custom_command = 'rg --hidden --files --color=never --glob "!.git"'
    nnoremap <Leader>pf :Rg<cr>
    let $FZF_DEFAULT_COMMAND=s:fzf_custom_command
endif
