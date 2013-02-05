" set pasting
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
noremap <C-S-Insert> "+gP
inoremap <C-S-Insert> <esc>"+gPi
set foldmethod=marker
" bidings for moving current tab left or right
nnoremap <silent> <C-S-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-S-PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>
