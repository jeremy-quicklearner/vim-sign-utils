" File: autoload/vimSignUtils.vim
" Description: Sign-related utilities
" Author: Jeremy Lerner <github.com/jeremy-quicklearner>
" License: MIT

" Avoid installing twice
if exists('g:autoloaded_vimSignUtils')
    finish
endif
let g:autoloaded_vimSignUtils = 0

let s:colours = ['Red', 'Green', 'Yellow', 'Blue', 'Magenta', 'Cyan', 'White']

" Highlight groups for colouring lines different colours
for colour in s:colours
    execute 'highlight SignUtil' . colour .
           \' ctermfg=Black ctermbg=' . colour .
           \' cterm=none'

endfor

" Signs using the highlight groups above
for colour in s:colours
    execute 'sign define signUtil' . colour .
           \' text=' . g:vimSignUtils_text[:2] .
           \' texthl=SignUtil' . colour .
           \' linehl=SignUtil' . colour
endfor

" Get a number that isn't already being used as a sign id. Don't repeat IDs.
let s:lastSignId = 0
function! s:GetNewId()
    " Get existing signs and detemrine their IDs
    let signs = execute("sign place")
    let takenids = []
    for signline in split(signs, '\n')
        let signid = substitute( signline, '^.*id=\(\d*\).*$', '\1', '')
        call add(takenids, signid)
    endfor

    " Count up from the last returned sign ID until we find one that isn't
    " already in use
    let s:lastSignId += 1
    while index(takenids, s:lastSignId) !=# -1
        let s:lastSignId += 1
    endwhile
    return s:lastSignId
endfunction


" Place one of the above signs on a set of lines
function! vimSignUtils#PlaceUtilSigns(colour, lines)
    let colourStr = toupper(a:colour[0]) . tolower(a:colour[1:])
    for line in a:lines
        execute "sign place " . s:GetNewId() . " line=" . line .  " name=signUtil" . colourStr . " buffer=" . bufnr("%")
    endfor
endfunction

" Unplace one of the above signs on a set of lines
function! vimSignUtils#UnplaceUtilSigns(lines)
    " Get a list of the signs in the current buffer
    let signs = execute("sign place buffer=" . bufnr('%'))

    for line in a:lines
        " If there's a sign on the current line whose name starts with
        " signUtil, unplace it
        for signline in split(signs, '\n')
            if signline =~# '^\s*line=' . line . '\s*id=\S*\s*name=signUtil.*$'
                let signid = substitute( signline, '^.*id=\(\d*\).*$', '\1', '')
                execute "sign unplace " . signid
            endif
        endfor
    endfor
endfunction

" For autocompleting command arguments
function! vimSignUtils#CompleteColour(ArgLead, CmdLine, CursorPos)
    let candidates = []
    for c in s:colours
        if tolower(c) =~ '^' . tolower(a:ArgLead) . '.*$'
            call add(candidates, c)
        endif
    endfor
    return candidates
endfunction

