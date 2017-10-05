" Font
set guifont=Hack:h14
set linespace=5

" Colorscheme
colorscheme hybrid_material
hi NonText guifg=#282a2e guibg=#282a2e
hi CursorLine guibg=#303236
hi CursorLineNr guifg=#3c3e42 guibg=#212121
hi LineNr guifg=#3c3e42
hi VertSplit guifg=#282a2e guibg=#282a2e
hi Normal guibg=#282a2e
hi Comment guifg=#505256 gui=italic
" hi Statement gui=bold
" hi Type gui=bold
hi ColorColumn guibg=#2a2c30

" Indent Guide
let g:indentLine_enabled = 0
let g:indentLine_color_gui = '#3c3e42'
let g:indentLine_bgcolor_gui = '#282a2e'

" Style Guide
set colorcolumn=100

" GUI Options
set guioptions=egm

" Airline Options
let g:airline_theme = 'base16_google'

" ALE GUI settings
let g:ale_sign_column_always = 1

" Startup command
autocmd VimEnter * NERDTree
