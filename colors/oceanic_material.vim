" ===============================================================
" Theme: Oceanice_Material
" Author: Glepnir
" License: MIT
" Source: http://github.com/hardcoreplayers/oceanic_material
" ===============================================================

" Initialization: {{{
"
hi clear

if exists("syntax_on")
  syntax reset
endif

set background=dark

let g:colors_name = "oceanic_material"
let s:oceanic_material_version = '0.2.2'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

let s:oceanic_material_transparent_background = get(g:,'oceanic_material_transparent_background',0)

let s:oceanic_material_background = get(g:,'oceanic_material_background','deep')

let s:oceanic_material_allow_bold = get(g:,'oceanic_material_allow_bold', 1)

let s:oceanic_material_allow_italic = get(g:,'oceanic_material_allow_italic',0)

let s:oceanic_material_allow_underline = get(g:,'oceanic_material_allow_underline',0)

let s:oceanic_material_allow_reverse = get(g:,'oceanic_material_allow_reverse',0)

let s:oceanic_material_allow_undercurl = get(g:,'oceanic_material_allow_undercurl',0)

let s:bold = s:oceanic_material_allow_bold ? ' cterm=bold gui=bold ': ''

let s:italic = s:oceanic_material_allow_italic ? ' cterm=italic gui=italic ': ''

let s:underline = s:oceanic_material_allow_underline ? ' cterm=underline gui=underline ': ''

let s:reverse = s:oceanic_material_allow_reverse ? ' cterm=reverse gui=reverse ': ''

let s:undercurl = s:oceanic_material_allow_undercurl? ' cterm=undercurl gui=undercurl ': ''

let s:background = {
      \'ocean' : ['#1b2b34', '235'],
      \'medium': ['#282C34', '235'],
      \'deep': ['#212121', 'NONE'],
      \'darker': ['#1d1f21', '234'],
      \}

let s:colors = {
      \ 'bg0':              s:background[s:oceanic_material_background],
      \ 'bg1':              ['#343d46',   '237'],
      \ 'bg2':              ['#282828',   '235'],
      \ 'bg3':              ['#3c3836',   '237'],
      \ 'bg4':              ['#3c3836',   '237'],
      \ 'bg5':              ['#504945',   '239'],
      \ 'fg0':              ['#d4be98',   '223'],
      \ 'fg1':              ['#ddc7a1',   '223'],
      \ 'fg3':              ['#4f5b66',   '17'],
      \ 'red':              ['#EC5f67',   '203'],
      \ 'magenta':          ['#d16d9e',   '205'],
      \ 'orange':           ['#e78a4e',   '208'],
      \ 'yellow':           ['#d8a657',   '214'],
      \ 'green':            ['#5faf5f',   '71'],
      \ 'cyan':             ['#56b6c2',   '73'],
      \ 'blue':             ['#6699cc',   '68'],
      \ 'purple':           ['#c594c5',   '176'],
      \ 'black':            ['#000000',    '0'],
      \ 'bg_red':           ['#ea6962',   '167'],
      \ 'grey0':            ['#7c6f64',   '243'],
      \ 'grey1':            ['#928374',   '245'],
      \ 'grey2':            ['#a89984',   '246'],
      \ 'operator':  ['#c0c5ce',   '251'],
      \ 'none':             ['NONE',      'NONE']
  \ }

function! g:OceanicMaterialPalette()
  return copy(s:colors)
endfunction

function! g:OceanicMaterial()
  echo s:oceanic_material_version
endfunction

function! s:create_color_variables() abort
  for key in keys(s:colors)
    let palette = get(s:colors,key)
    let {'s:fg_' . key} = ' guifg='.palette[0].' ctermfg='.palette[1].' '
    let {'s:bg_' . key} = ' guibg='.palette[0].' ctermbg='.palette[1]. ' '
  endfor
  let s:sp_red = ' guisp='.s:colors.red[0] . ' '
  let s:sp_blue = ' guisp='.s:colors.blue[0] . ' '
  let s:sp_cyan = ' guisp='.s:colors.cyan[0] . ' '
  let s:sp_yellow = ' guisp='.s:colors.yellow[0] . ' '
  let s:sp_purple = ' guisp='.s:colors.purple[0] . ' '
endfunction

function! s:set_color_variables() abort
  call s:create_color_variables()
  let s:terminal = {
        \ 'black':    s:colors.bg0,
        \ 'red':      s:colors.red,
        \ 'yellow':   s:colors.yellow,
        \ 'green':    s:colors.green,
        \ 'cyan':     s:colors.cyan,
        \ 'blue':     s:colors.blue,
        \ 'purple':   s:colors.purple,
        \ 'white':    s:colors.fg0,
        \ 'light_grey': s:colors.bg5,
        \ 'dark_grey': s:colors.grey0,
        \ }
  let g:terminal_color_0 = s:terminal.black[0]
  let g:terminal_color_1 = s:terminal.red[0]
  let g:terminal_color_2 = s:terminal.green[0]
  let g:terminal_color_3 = s:terminal.yellow[0]
  let g:terminal_color_4 = s:terminal.blue[0]
  let g:terminal_color_5 = s:terminal.purple[0]
  let g:terminal_color_6 = s:terminal.cyan[0]
  let g:terminal_color_7 = s:terminal.light_grey[0]
  let g:terminal_color_8 = s:terminal.dark_grey[0]
  let g:terminal_color_9 = s:terminal.red[0]
  let g:terminal_color_10 = s:terminal.green[0]
  let g:terminal_color_11 = s:terminal.yellow[0]
  let g:terminal_color_12 = s:terminal.blue[0]
  let g:terminal_color_13 = s:terminal.purple[0]
  let g:terminal_color_14 = s:terminal.cyan[0]
  let g:terminal_color_15 = s:terminal.white[0]
endfunction

" Oceanic Material Transparent BackGround
function! s:apply_syntax_highlightings()
  if s:oceanic_material_transparent_background
    exec 'hi Normal' . s:fg_fg0 . s:bg_none
    exec 'hi Terminal' . s:fg_fg0 . s:bg_none
    exec 'hi FoldColumn' . s:fg_grey0 . s:bg_none
    exec 'hi SignColumn' . s:fg_fg0 . s:bg_none
    exec 'hi ToolbarLine' . s:fg_fg0 . s:bg_none
    exec 'hi VertSplit' . s:fg_black . s:bg_none . 'gui=NONE cterm=NONE'
  else
    exec 'hi Normal' . s:fg_fg0 . s:bg_bg0
    exec 'hi Terminal' . s:fg_fg0 . s:bg_bg0
    exec 'hi ToolbarLine' . s:fg_fg1 . s:bg_bg3
    exec 'hi SignColumn' . s:fg_fg0 . s:bg_bg0
    exec 'hi FoldColumn' . s:fg_grey0 . s:bg_bg2
    exec 'hi VertSplit' . s:fg_bg0 . s:bg_black
  endif
  exec 'hi Folded' . s:fg_grey1 . s:bg_bg2
  exec 'hi EndOfBuffer' . s:fg_bg0 . s:bg_none
  exec 'hi IncSearch'. s:fg_bg1 . s:bg_orange .' cterm=NONE gui=NONE '
  exec 'hi Search'. s:fg_bg0 . s:bg_green
  exec 'hi ColorColumn'. s:fg_none . s:bg_bg1
  exec 'hi Conceal'. s:fg_grey1 . s:bg_none
  exec 'hi Cursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi vCursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi iCursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi lCursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi CursorIM'. s:fg_none . s:bg_none . s:reverse
  exec 'hi CursorColumn'. s:fg_none. s:fg_bg1
  exec 'hi CursorLine'. s:fg_none . s:bg_bg1
  exec 'hi LineNr'. s:fg_grey0
  exec 'hi CursorLineNr'. s:fg_fg1
  exec 'hi DiffAdd'. s:fg_black . s:bg_green
  exec 'hi DiffChange'. s:fg_black. s:bg_yellow
  exec 'hi DiffDelete'. s:fg_black. s:bg_red
  exec 'hi DiffText'. s:fg_black . s:bg_fg0
  exec 'hi Directory'. s:fg_bg5. s:bg_none
  exec 'hi ErrorMsg'. s:fg_red. s:bg_none. s:bold . s:underline
  exec 'hi WarningMsg'. s:fg_yellow. s:bg_none. s:bold
  exec 'hi ModeMsg'. s:fg_fg0. s:bg_none. s:bold
  exec 'hi MoreMsg'. s:fg_yellow. s:bg_none. s:bold
  exec 'hi MatchParen'. s:fg_none. s:bg_bg4
  exec 'hi NonText'. s:fg_bg5
  exec 'hi Whitespace'. s:fg_bg5
  exec 'hi SpecialKey'. s:fg_bg5
  exec 'hi Pmenu'. s:fg_fg1. s:bg_bg1
  exec 'hi PmenuSbar'. s:fg_none. s:bg_fg3
  exec 'hi PmenuSel'. s:fg_bg3. s:bg_blue
  exec 'hi PmenuThumb'. s:fg_none. s:bg_operator
  exec 'hi WildMenu'. s:fg_bg3. s:bg_green
  exec 'hi Question'. s:fg_yellow
  exec 'hi NormalFloat' .s:fg_fg1 . s:bg_bg1
  " Tabline
  exec 'hi TabLineFill' . ' gui=NONE cterm=NONE'
  " Statusline
  exec 'hi StatusLine'. s:fg_fg1. s:bg_none .'gui=NONE'
  exec 'hi StatusLineNC'. s:fg_grey1 . s:bg_none .'cterm=NONE gui=NONE'
  " spell
  exec 'hi SpellBad'. s:fg_red. s:bg_none. s:undercurl. s:sp_red
  exec 'hi SpellCap'. s:fg_blue. s:bg_none. s:undercurl. s:sp_blue
  exec 'hi SpellLocal'. s:fg_cyan. s:bg_none. s:undercurl. s:sp_cyan
  exec 'hi SpellRare'. s:fg_purple. s:bg_none. s:undercurl. s:sp_purple

  exec 'hi Visual'. s:fg_black . s:bg_operator .s:reverse
  exec 'hi VisualNOS'. s:fg_black . s:bg_operator . s:reverse

  exec 'hi QuickFixLine'. s:fg_purple. s:bold
  exec 'hi Debug'. s:fg_orange
  exec 'hi debugPC'. s:fg_bg0. s:bg_green
  exec 'hi debugBreakpoint'. s:fg_bg0. s:bg_red
  exec 'hi ToolbarButton'. s:fg_bg0. s:bg_grey2

  " Syntax
  exec 'hi Boolean'. s:fg_orange
  exec 'hi Number'. s:fg_purple
  exec 'hi Float'. s:fg_purple
  exec 'hi PreProc'. s:fg_purple. s:italic
  exec 'hi PreCondit'. s:fg_purple. s:italic
  exec 'hi Include'. s:fg_purple. s:italic
  exec 'hi Define'. s:fg_purple. s:italic
  exec 'hi Conditional'. s:fg_purple  . s:italic
  exec 'hi Repeat'. s:fg_purple
  exec 'hi Keyword'. s:fg_red. s:italic
  exec 'hi Typedef'. s:fg_red. s:italic
  exec 'hi Exception'. s:fg_red. s:italic
  exec 'hi Statement'. s:fg_red. s:italic
  exec 'hi Error'. s:fg_red . s:bg_none
  exec 'hi StorageClass'. s:fg_orange
  exec 'hi Tag'. s:fg_orange
  exec 'hi Label'. s:fg_orange
  exec 'hi Structure'. s:fg_orange
  exec 'hi Operator'. s:fg_operator
  exec 'hi Title'. s:fg_orange. s:bold
  exec 'hi Special'. s:fg_yellow
  exec 'hi SpecialChar'. s:fg_yellow
  exec 'hi Type'. s:fg_yellow
  exec 'hi Function'. s:fg_magenta. 'gui=bold'
  exec 'hi String'. s:fg_green
  exec 'hi Character'. s:fg_green
  exec 'hi Constant'. s:fg_cyan
  exec 'hi Macro'. s:fg_cyan
  exec 'hi Identifier'. s:fg_blue

  " Comment
  exec 'hi Comment'. s:fg_grey1. s:italic
  exec 'hi SpecialComment'. s:fg_grey1. s:italic
  exec 'hi Todo'. s:fg_purple. s:italic

  exec 'hi Delimiter'. s:fg_fg0
  exec 'hi Ignore'. s:fg_grey1
  exec 'hi Underlined'. s:fg_none. s:underline

  " Markdown Filetype:
  "===============================================================
  exec 'hi markdownH1'. s:fg_red. s:bold
  exec 'hi markdownH2'. s:fg_orange. s:bold
  exec 'hi markdownH3'. s:fg_yellow. s:bold
  exec 'hi markdownH4'. s:fg_green. s:bold
  exec 'hi markdownH5'. s:fg_blue. s:bold
  exec 'hi markdownH6'. s:fg_purple. s:bold
  exec 'hi markdownUrl'. s:fg_blue. s:underline
  exec 'hi markdownItalic'. s:fg_none. s:italic
  exec 'hi markdownBold'. s:fg_none. s:bold
  exec 'hi markdownItalicDelimiter'. s:fg_grey1. s:italic
  exec 'hi markdownCode' .s:fg_green
  exec 'hi markdownCodeBlock' .s:fg_cyan
  exec 'hi markdownCodeDelimiter' .s:fg_cyan
  exec 'hi markdownBlockquote'.s:fg_grey1
  exec 'hi markdownListMarker'. s:fg_red
  exec 'hi markdownOrderedListMarker'. s:fg_red
  exec 'hi markdownRule'. s:fg_purple
  exec 'hi markdownHeadingRule'. s:fg_grey1
  exec 'hi markdownUrlDelimiter'. s:fg_grey1
  exec 'hi markdownLinkDelimiter'. s:fg_grey1
  exec 'hi markdownLinkTextDelimiter'. s:fg_grey1
  exec 'hi markdownHeadingDelimiter'. s:fg_grey1
  exec 'hi markdownLinkText'. s:fg_purple
  exec 'hi markdownUrlTitleDelimiter'. s:fg_green
  exec 'hi markdownIdDeclaration'. s:fg_purple
  exec 'hi markdownBoldDelimiter'. s:fg_grey1
  exec 'hi markdownId'. s:fg_yellow
  "===============================================================
  " Html: https://notabug.org/jorgesumle/vim-html-syntax {{{
  "===============================================================
  exec 'hi htmlH1'. s:fg_red. s:bold
  exec 'hi htmlH2'. s:fg_orange. s:bold
  exec 'hi htmlH3'. s:fg_yellow. s:bold
  exec 'hi htmlH4'. s:fg_green. s:bold
  exec 'hi htmlH5'. s:fg_blue. s:bold
  exec 'hi htmlH6'. s:fg_purple.s:bold
  exec 'hi htmlLink'. s:fg_none. s:underline
  exec 'hi htmlBold'. s:fg_none. s:bold
  exec 'hi htmlBoldUnderline'. s:fg_none. s:bold . s:underline
  exec 'hi htmlBoldItalic'. s:fg_none. s:bold . s:italic
  exec 'hi htmlBoldUnderlineItalic'. s:fg_none. s:bold . s:underline . s:italic
  exec 'hi htmlUnderline'. s:fg_none. s:fg_none. s:underline
  exec 'hi htmlUnderlineItalic'. s:fg_none. s:underline . s:italic
  exec 'hi htmlItalic'. s:fg_none. s:italic
  exec 'hi htmlTag'. s:fg_green
  exec 'hi htmlEndTag'. s:fg_blue
  exec 'hi htmlTagN'. s:fg_orange. s:italic
  exec 'hi htmlTagName'. s:fg_orange. s:italic
  exec 'hi htmlArg'. s:fg_cyan
  exec 'hi htmlScriptTag'. s:fg_purple
  exec 'hi htmlSpecialTagName'. s:fg_red.s:italic
  "===============================================================
  exec 'hi typescriptImport' . s:fg_purple
  exec 'hi typescriptAssign' . s:fg_operator
  exec 'hi typescriptBraces' . s:fg_operator
  exec 'hi typescriptParens' . s:fg_operator
  exec 'hi typescriptExport' . s:fg_red
  exec 'hi typescriptVariable' . s:fg_orange
  exec 'hi typescriptDestructureVariable' . s:fg_cyan
  exec 'hi jsxComponentName' . s:fg_blue
  "===============================================================
  " Lua:
  "===============================================================
  exec 'hi luaFunc' . s:fg_green  . s:bold
  exec 'hi luaTable' . s:fg_fg0
  exec 'hi luaIn' . s:fg_red  . s:italic
  " BetterLua.vim
  exec 'hi luaFunctionCall' . s:fg_yellow .'gui=bold'
  exec 'hi luaFunction' . s:fg_blue
  exec 'hi luaLocal' . s:fg_orange
  exec 'hi luaSpecialValue' . s:fg_green  . s:bold
  exec 'hi luaBraces' . s:fg_fg0
  exec 'hi luaBuiltIn' . s:fg_cyan
  exec 'hi luaNoise' . s:fg_grey1
  exec 'hi luaLabel' . s:fg_purple
  exec 'hi luaFuncKeyword' . s:fg_blue
  exec 'hi luaFuncArgName' . s:fg_cyan
  exec 'hi luaEllipsis' . s:fg_orange
  exec 'hi luaDocTag' . s:fg_green
  "===============================================================
  " Go:
  "===============================================================
  exec 'hi goDirective' . s:fg_purple  . s:italic
  exec 'hi goConstants' . s:fg_cyan
  exec 'hi goTypeDecl' . s:fg_purple  . s:italic
  exec 'hi goDeclType' . s:fg_orange  . s:italic
  exec 'hi goFunctionCall' . s:fg_yellow  . s:bold
  exec 'hi goSpaceError'. s:fg_grey1. s:bg_red
  exec 'hi goVarArgs' . s:fg_blue
  exec 'hi goBuiltins' . s:fg_purple
  exec 'hi goPredefinedIdentifiers' . s:fg_orange
  exec 'hi goVar' . s:fg_orange
  exec 'hi goField' . s:fg_cyan
  exec 'hi goDeclaration' . s:fg_blue
  exec 'hi goConst' . s:fg_orange
  exec 'hi goParamName' . s:fg_cyan
  "===============================================================
  " Rust:
  " builtin: https://github.com/rust-lang/rust.vim
  "===============================================================
  exec 'hi rustStructure' . s:fg_orange
  exec 'hi rustIdentifier' . s:fg_purple
  exec 'hi rustModPath' . s:fg_orange
  exec 'hi rustModPathSep' . s:fg_grey1
  exec 'hi rustSelf' . s:fg_blue
  exec 'hi rustSuper' . s:fg_blue
  exec 'hi rustDeriveTrait' . s:fg_purple  . s:italic
  exec 'hi rustEnumVariant' . s:fg_purple
  exec 'hi rustMacroVariable' . s:fg_blue
  exec 'hi rustAssert' . s:fg_cyan
  exec 'hi rustPanic' . s:fg_cyan
  exec 'hi rustPubScopeCrate' . s:fg_purple  . s:italic
  "===============================================================
  " VimL:
  "===============================================================
  exec 'hi vimCommentTitle'. s:fg_grey1. s:bold
  exec 'hi vimLet' . s:fg_orange
  exec 'hi vimVar' . s:fg_cyan
  exec 'hi vimFunction' . s:fg_magenta  . s:bold
  exec 'hi vimIsCommand' . s:fg_fg0
  exec 'hi vimCommand' . s:fg_blue
  exec 'hi vimNotFunc' . s:fg_purple  . s:bold
  exec 'hi vimUserFunc' . s:fg_yellow  . s:bold
  exec 'hi vimFuncName' . s:fg_yellow  . s:bold
  "===============================================================
  " Makefile:
  "===============================================================
  exec 'hi makeIdent' . s:fg_cyan
  exec 'hi makeSpecTarget' . s:fg_yellow
  exec 'hi makeTarget' . s:fg_blue
  exec 'hi makeCommands' . s:fg_orange
  "===============================================================
  " Json:
  "===============================================================
  exec 'hi jsonKeyword' . s:fg_orange
  exec 'hi jsonQuote' . s:fg_grey1
  exec 'hi jsonBraces' . s:fg_fg0
  "===============================================================
  " Yaml:
  "===============================================================
  exec 'hi yamlKey' . s:fg_orange
  exec 'hi yamlConstant' . s:fg_purple
  "===============================================================
  " Toml:
  "===============================================================
  exec 'hi tomlTable'. s:fg_purple. s:bold
  exec 'hi tomlKey' . s:fg_orange
  exec 'hi tomlBoolean' . s:fg_cyan
  exec 'hi tomlTableArray'. s:fg_purple. s:bold
  "===============================================================
  " Diff:
  "===============================================================
  exec 'hi diffAdded' . s:fg_green
  exec 'hi diffRemoved' . s:fg_red
  exec 'hi diffChanged' . s:fg_blue
  exec 'hi diffOldFile' . s:fg_yellow
  exec 'hi diffNewFile' . s:fg_orange
  exec 'hi diffFile' . s:fg_cyan
  exec 'hi diffLine' . s:fg_grey1
  exec 'hi diffIndexLine' . s:fg_purple
  "===============================================================
  " Git Commit:
  "===============================================================
  exec 'hi gitcommitSummary' . s:fg_red
  exec 'hi gitcommitUntracked' . s:fg_grey1
  exec 'hi gitcommitDiscarded' . s:fg_grey1
  exec 'hi gitcommitSelected' . s:fg_grey1
  exec 'hi gitcommitUnmerged' . s:fg_grey1
  exec 'hi gitcommitOnBranch' . s:fg_grey1
  exec 'hi gitcommitArrow' . s:fg_grey1
  exec 'hi gitcommitFile' . s:fg_green
  "===============================================================
  " liuchengxu/vista.vim
  "===============================================================
  exec 'hi VistaBracket' . s:fg_grey1
  exec 'hi VistaChildrenNr' . s:fg_orange
  exec 'hi VistaKind' . s:fg_purple
  exec 'hi VistaScope' . s:fg_red
  exec 'hi VistaScopeKind' . s:fg_blue
  exec 'hi VistaTag' . s:fg_green . s:bold
  exec 'hi VistaPrefix' . s:fg_grey1
  exec 'hi VistaColon' . s:fg_green
  exec 'hi VistaIcon' . s:fg_yellow
  exec 'hi VistaLineNr' . s:fg_fg0
  "===============================================================
  " airblade/vim-gitgutter
  "===============================================================
  exec 'hi GitGutterAdd' . s:fg_green  . s:bold
  exec 'hi GitGutterChange' . s:fg_blue  . s:bold
  exec 'hi GitGutterDelete' . s:fg_red  . s:bold
  exec 'hi GitGutterChangeDelete' . s:fg_purple  .s:bold
  "===============================================================
  " mhinz/vim-signify
  "===============================================================
  exec 'hi SignifySignAdd ' . s:fg_green  . s:bold
  exec 'hi SignifySignChange' . s:fg_blue  . s:bold
  exec 'hi SignifySignDelete' . s:fg_red  . s:bold
  "===============================================================
  " easymotion/vim-easymotion
  "===============================================================
  exec 'hi EasyMotionTarget'. s:fg_bg0 . s:bg_green
  exec 'hi EasyMotionShade' . s:fg_grey1
  "===============================================================
  " voldkiss/vim-floaterm
  "===============================================================
  exec 'hi Floaterm' .s:fg_none . s:bg_bg0
  exec 'hi FloatermBorder' .s:fg_blue . s:bg_none
  "===============================================================
  "kristijanhusak/vim-dadbod-ui
  "===============================================================
  exec 'hi dbui_tables' . s:fg_blue
  "===============================================================
  "Shougo/defx.nvim
  "===============================================================
  exec 'hi DefxIconsParentDirectory' . s:fg_orange
  exec 'hi Defx_filename_directory' . s:fg_blue
  exec 'hi Defx_filename_root' . s:fg_red
  "===============================================================
  "hardcoreplayers/dashboard-nvim
  "===============================================================
  exec 'hi DashboardShortCut' . s:fg_red . s:bold
  exec 'hi DashboardFooter' . s:fg_purple .s:bold
  exec 'hi DashboardHeader' . s:fg_blue .s:bold
  "===============================================================
  exec 'hi LspDiagnosticsError' . s:fg_red
  exec 'hi LspDiagnosticsWarning'. s:fg_yellow
  exec 'hi LspDiagnosticsInformation' . s:fg_blue
  exec 'hi LspDiagnosticsHint' . s:fg_cyan
  "===============================================================
  exec 'hi CursorWord0' .s:bg_fg3
  exec 'hi CursorWord1' .s:bg_fg3
  "===============================================================
  exec 'hi! TSFunction'. s:fg_yellow. s:bold
  exec 'hi! TSKeywordFunction'. s:fg_blue
  exec 'hi! TSProperty'. s:fg_cyan
endfunction

command! -nargs=0 OceanicMaterial :call g:OceanicMaterial()

call s:set_color_variables()
call s:apply_syntax_highlightings()

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
