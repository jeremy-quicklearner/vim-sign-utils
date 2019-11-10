" File: plugin/vimSignUtils.vim
" Description: Sign-related utilities
" Author: Jeremy Lerner <github.com/jeremy-quicklearner>
" License: MIT
"
" TODO: Add a command to put all the current buffer's signs into the current
" window's location list
" TODO: Add documentation
" TODO: Figure out limitations with earlier versions of Vim

" Suggested mappings
" " Place a sign on the current line
" nnoremap <silent> <leader>sr :PlaceUtilSigns Red<cr>
" nnoremap <silent> <leader>sg :PlaceUtilSigns Green<cr>
" nnoremap <silent> <leader>sy :PlaceUtilSigns Yellow<cr>
" nnoremap <silent> <leader>sb :PlaceUtilSigns Blue<cr>
" nnoremap <silent> <leader>sm :PlaceUtilSigns Magenta<cr>
" nnoremap <silent> <leader>sc :PlaceUtilSigns Cyan<cr>
" nnoremap <silent> <leader>sw :PlaceUtilSigns White<cr>
" 
" " Place signs on highlighted lines
" vnoremap <silent> <leader>sr :PlaceUtilSigns Red<cr>
" vnoremap <silent> <leader>sg :PlaceUtilSigns Green<cr>
" vnoremap <silent> <leader>sy :PlaceUtilSigns Yellow<cr>
" vnoremap <silent> <leader>sb :PlaceUtilSigns Blue<cr>
" vnoremap <silent> <leader>sm :PlaceUtilSigns Magenta<cr>
" vnoremap <silent> <leader>sc :PlaceUtilSigns Cyan<cr>
" vnoremap <silent> <leader>sw :PlaceUtilSigns White<cr>
" 
" " Remove signs from the current line
" nnoremap <silent> <leader>S :UnplaceUtilSigns<cr>
" 
" " Remove signs from highlighted lines
" vnoremap <silent> <leader>S :UnplaceUtilSigns<cr>

" Text for the sign column
if !exists('g:vimSignUtils_text')
    let g:vimSignUtils_text = '()'
endif

" Place signs on ranges of lines
command! -nargs=1
       \ -range
       \ -complete=customlist,vimSignUtils#CompleteColour
       \ PlaceUtilSigns
       \ :call vimSignUtils#PlaceUtilSigns(<f-args>, range(<line1>, <line2>))

" Unplace signs from ranges of lines
command! -nargs=0
       \ -range
       \ UnplaceUtilSigns
       \ :call vimSignUtils#UnplaceUtilSigns(range(<line1>, <line2>))

" Suggested mappings
" " Place a sign on the current line
" nnoremap <silent> <leader>sr :PlaceUtilSigns Red<cr>
" nnoremap <silent> <leader>sg :PlaceUtilSigns Green<cr>
" nnoremap <silent> <leader>sy :PlaceUtilSigns Yellow<cr>
" nnoremap <silent> <leader>sb :PlaceUtilSigns Blue<cr>
" nnoremap <silent> <leader>sm :PlaceUtilSigns Magenta<cr>
" nnoremap <silent> <leader>sc :PlaceUtilSigns Cyan<cr>
" nnoremap <silent> <leader>sw :PlaceUtilSigns White<cr>
" 
" " Place signs on highlighted lines
" vnoremap <silent> <leader>sr :PlaceUtilSigns Red<cr>
" vnoremap <silent> <leader>sg :PlaceUtilSigns Green<cr>
" vnoremap <silent> <leader>sy :PlaceUtilSigns Yellow<cr>
" vnoremap <silent> <leader>sb :PlaceUtilSigns Blue<cr>
" vnoremap <silent> <leader>sm :PlaceUtilSigns Magenta<cr>
" vnoremap <silent> <leader>sc :PlaceUtilSigns Cyan<cr>
" vnoremap <silent> <leader>sw :PlaceUtilSigns White<cr>
" 
" " Remove signs from the current line
" nnoremap <silent> <leader>S :UnplaceUtilSigns<cr>
" 
" " Remove signs from highlighted lines
" vnoremap <silent> <leader>S :UnplaceUtilSigns<cr>
