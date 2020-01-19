" tab or buf 1
nnoremap <silent> <leader>1 :call functions#tab_buf_switch(1)<cr>
" tab or buf 2
nnoremap <silent> <leader>2 :call functions#tab_buf_switch(2)<cr>
" tab or buf 3
nnoremap  <silent> <leader>3 :call functions#tab_buf_switch(3)<cr>
" tab or buf 4
nnoremap  <silent> <leader>4 :call functions#tab_buf_switch(4)<cr>
" tab or buf 5
nnoremap  <silent> <leader>5 :call functions#tab_buf_switch(5)<cr>
" tab or buf 6
nnoremap  <silent> <leader>6 :call functions#tab_buf_switch(6)<cr>
" tab or buf 7
nnoremap  <silent> <leader>7 :call functions#tab_buf_switch(7)<cr>
" tab or buf 8
nnoremap  <silent> <leader>8 :call functions#tab_buf_switch(8)<cr>
" tab or buf 9
nnoremap  <silent> <leader>9 :call functions#tab_buf_switch(9)<cr>

" tab navigation like zsh
nnoremap <silent> <leader>h :bp<CR>
nnoremap <silent> <leader>l :bn<CR>
nnoremap <silent> <leader>w :call functions#tab_buf_close()<CR>
