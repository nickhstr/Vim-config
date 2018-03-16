" Font
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h14
set linespace=2

" Old Colorscheme
set background=dark
colorscheme hybrid_material
" hi NonText guifg=#282a2e guibg=#282a2e
" hi CursorLine guibg=#303236
" hi CursorLineNr guifg=#3c3e42 guibg=#212121
" hi LineNr guifg=#3c3e42
" hi VertSplit guifg=#282a2e guibg=#282a2e
" hi Normal guibg=#282a2e
hi Comment gui=italic
" hi Statement gui=bold
" hi Type gui=bold
" hi ColorColumn guibg=#2a2c30

" Nova Colorscheme
" colorscheme nova
" hi VertSplit guifg=#3C4C55 guibg=#3C4C55
" hi NonText guifg=#3C4C55 guibg=#3C4C55
" hi Normal guibg=#3C4C55
" hi EndOfBuffer guifg=#3C4C55

" Indent Guide
" let g:indentLine_color_gui = '#6A7D89'
" let g:indentLine_bgcolor_gui = '#3C4C55'

" Style Guide
" set colorcolumn=100

" GUI Options
set guioptions=egm

" Airline Options
let g:airline_theme = 'hybrid'

" ALE GUI settings
let g:ale_sign_column_always = 1

" Startup command
autocmd VimEnter * NERDTree
