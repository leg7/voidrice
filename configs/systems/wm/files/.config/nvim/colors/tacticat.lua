colors = {
	white = {
		regular    = '#f5f5f5',
		dark = '#efefef',
		bright  = '#ffffff',
	},


	red = {
		regular = '#af0000',
		bright  = '#d70000'
	},

	orange = {
		regular = '#FF5F00',
		bright = '#FF8339',
		dark  = '#C54900'
	},

	yellow = {
		regular = '#FFF200',
		bright  = '#FFFA92',
		dark    = '#D8CE00'
	},

	blue = {
		bright  = '#394FB3',
		regular = '#1531AE',
		dark    = '#102586',
	},

	pink = {
		regular = '#D8005F',
		bright  = '#DA317B',
		dark = '#A70049'
	},

	purple = {
		regular = '#600CAC',
		bright  = '#7431B1',
		dark = '#4A0985'
	},

	black = {
		regular = '#000000',
		bright  = '#4f4f4f'
	},
}

vim.cmd('highlight clear')
vim.o.background = 'light'
vim.g.colors_name = 'tacticat'

set = vim.api.nvim_set_hl

-- Conceal -- Placeholder characters substituted for concealed text (see 'conceallevel').

-- set(0, 'Cursor', { fg = colors.white., bg = colors.black.regular, reverse = true })
-- set(0, 'lCursor', { link = 'Cursor' })
-- set(0, 'CursorIM', { link = 'Cursor' })

set(0, 'CursorLine', { fg = 'none', bg = colors.white.bright })
set(0, 'CursorColumn', { link = 'CursorLine' })
set(0, 'ColorColumn', { link = 'CursorLine' })

set(0, 'Directory', { link = 'Normal' })

set(0, 'DiffAdd',    { fg = '#00af00', bg = '#000000', reverse = true })
set(0, 'DiffChange', { fg = '#87afd7', bg = '#000000', reverse = true })
set(0, 'DiffDelete', { fg = '#d75f5f', bg = '#000000', reverse = true })
set(0, 'DiffText',   { fg = '#d787d7', bg = '#000000', reverse = true })

-- EndOfBuffer -- Filler lines (~) after the end of the buffer.
--
-- TermCursor
-- ErrorMsg
-- WinSeparator
--
-- Folded
-- FoldColumn
--
-- SignColumn
--

set(0, 'Search', { bg = colors.yellow.dark })
set(0, 'CurSearch', { bg = colors.yellow.regular })
set(0, 'IncSearch', { link = 'CurSearch'})
-- Substitute
--
-- LineNr
-- LineNrAbove
-- LineNrBelow
-- CursorLineNr
-- CursorLineFold
-- CursorLineSign

set(0, 'MatchParen', { fg = colors.black.regular, bg = colors.yellow.regular, bold = true })

-- ModeMsg
-- MsgArea
-- MsgSeparator
-- MoreMsg
--
-- set(0, 'NonText', { fg = colors.black.regular, bg = colors.background });

set(0, 'Normal', { fg = colors.black.regular, bg = colors.white.regular });
-- NormalFloat
-- FloatBorder
-- FloatTitle
-- FloatFooter
-- NormalNC
--
-- Pmenu
-- PmenuSel
-- PmenuKind
-- PmenuKindSel
-- PmenuExtra
-- PmenuExtraSel
-- PmenuSbar
-- PmenuThumb
-- PmenuMatch
-- PmenuMatchSel
--
-- ComplMatchIns
-- Question
-- QuickFixLine
--
-- SnippetTabstop
-- SpecialKey
--
-- SpellCap
-- SpellLocal
-- SpellRare
--
-- StatusLine
-- StatusLineNC
-- StatusLineTerm
-- StatusLineTermNC
--
-- TabLine
-- TabLineFill
-- TabLineSel
--
-- Title
--
set(0, 'Visual', { fg = colors.black.regular, bg = colors.yellow.regular })
set(0, 'VisualNOS', { link = 'Visual' })

-- WarningMsg
-- Whitespace
-- WildMenu
--
-- WinBar
-- WinBarNC

-- Syntax groups

set(0, 'Comment', { fg = colors.black.bright, bg = colors.white.dark })

set(0, 'Constant',  { fg = colors.pink.regular })
set(0, 'String',    { link = 'Constant' })
set(0, 'Character', { link = 'Constant' })
set(0, 'Number',    { link = 'Constant' })
set(0, 'Boolean',   { link = 'Constant' })
set(0, 'Float',     { link = 'Constant' })

set(0, 'Identifier', { fg = colors.black.bright })
set(0, 'Function', { fg = colors.purple.regular })

set(0, 'Statement',   { fg = colors.black.regular })
set(0, 'Conditional', { fg = colors.black.regular, italic = true })
set(0, 'Repeat',      { fg = colors.black.regular, italic = true })
set(0, 'Label',       { fg = colors.black.regular, italic = true })
set(0, 'Operator',    { fg = colors.black.regular })
set(0, 'Keyword',     { fg = colors.black.regular, italic = true })
set(0, 'Exception',   { link = 'Statement' })

set(0, 'PreProc',   { link = 'Constant' })
set(0, 'Include',   { link = 'PreProc' })
set(0, 'Define',    { link = 'PreProc' })
set(0, 'Macro',     { link = 'PreProc' })
set(0, 'PreCondit', { link = 'PreProc' })

set(0, 'Type',         { fg = colors.blue.regular })
set(0, 'StorageClass', { link = 'Type' })
set(0, 'Structure',    { link = 'Type' })
set(0, 'Typedef',      { link = 'Type' })

set(0, 'Special',        { fg = colors.black.regular })
set(0, 'SpecialChar',    { link = 'Special' })
set(0, 'Tag',            { link = 'Special' })
set(0, 'Delimiter',      { link = 'Special' })
set(0, 'SpecialComment', { link = 'Special' })
set(0, 'Debug',          { link = 'Special' })

-- Underlined	text that stands out, HTML links

-- Ignore		left blank, hidden  |hl-Ignore|

set(0, 'Error', { bg = colors.red.regular })

set(0, 'Todo', { bg = colors.pink.bright })

set(0, 'Added', { link = 'Identifier' })
set(0, 'Changed', { link = 'Identifier' })
set(0, 'Removed', { link = 'Identifier' })

-- Tree sitter groups

set(0, '@variable',                    { link = 'Identifier' })
set(0, '@variable.builtin',            { link = '@variable' })
set(0, '@variable.parameter',          { link = '@variable' })
set(0, '@variable.parameter.builtin',  { link = '@variable' })
set(0, '@variable.member',             { link = '@variable' })

set(0, '@constant',                    { link = 'Constant' })
set(0, '@constant.builtin',            { link = '@constant' })
set(0, '@constant.macro',              { link = '@constant' })

set(0, '@module',                      { link = 'PreProc' })
set(0, '@module.builtin',              { link = '@module' })
set(0, '@label',                       { link = 'Label' })

set(0, '@string',                      { link = 'String' })
set(0, '@string.documentation',        { link = '@string' })
set(0, '@string.regexp',               { link = '@string' })
set(0, '@string.escape',               { link = '@string' })
set(0, '@string.special',              { link = '@string' })
set(0, '@string.special.symbol',       { link = '@string' })
set(0, '@string.special.path',         { link = '@string' })
set(0, '@string.special.url',          { link = '@string' })

set(0, '@character',                   { link = 'Character' })
set(0, '@character.special',           { link = '@character' })

set(0, '@boolean',                     { link = 'Boolean' })
set(0, '@number',                      { link = 'Number' })
set(0, '@number.float',                { link = 'Float' })

set(0, '@type',                        { link = 'Type'})
set(0, '@type.builtin',                { link = '@type'})
set(0, '@type.definition',             { link = '@type'})

set(0, '@attribute',                   { link = 'Identifier'})
set(0, '@attribute.builtin',           { link = '@attribute'})
set(0, '@property',                    { link = '@attribute'})

set(0, '@function',                    { link = 'Function' })
set(0, '@function.builtin',            { link = '@function' })
set(0, '@function.call',               { link = '@function' })
set(0, '@function.macro',              { link = '@function' })

set(0, '@function.method',             { link = '@function' })
set(0, '@function.method.call',        { link = '@function' })

set(0, '@constructor',                 { link = '@function' })
set(0, '@operator',                    { link = 'Operator' })

set(0, '@keyword',                     { link = 'Keyword' })
set(0, '@keyword.coroutine',           { link = '@keyword' })
set(0, '@keyword.function',            { link = '@keyword' })
set(0, '@keyword.operator',            { link = '@keyword' })
set(0, '@keyword.import',              { link = '@keyword' })
set(0, '@keyword.type',                { link = 'Type' })
set(0, '@keyword.modifier',            { link = 'Type' })
set(0, '@keyword.repeat',              { link = '@keyword' })
set(0, '@keyword.return',              { link = '@keyword' })
set(0, '@keyword.debug',               { link = '@keyword' })
set(0, '@keyword.exception',           { link = '@keyword' })

set(0, '@keyword.conditional',         { link = '@keyword' })
set(0, '@keyword.conditional.ternary', { link = '@keyword' })

set(0, '@keyword.directive',           { link = '@keyword' })
set(0, '@keyword.directive.define',    { link = '@keyword' })

set(0, '@punctuation.delimiter',       { link = 'Delimiter' })
set(0, '@punctuation.bracket',         { link = 'Delimiter' })
set(0, '@punctuation.special',         { link = 'Special' })

set(0, '@comment',                     { link = 'Comment' })
set(0, '@comment.documentation',       { link = '@comment' })

set(0, '@comment.error',               { link = '@comment' })
set(0, '@comment.warning',             { link = '@comment' })
set(0, '@comment.todo',                { link = '@comment' })
set(0, '@comment.note',                { link = '@comment' })
--
-- set(0, '@markup.strong',               { link = '@markup.strong' })
-- set(0, '@markup.italic',               { link = '@markup.italic' })
-- set(0, '@markup.strikethrough',        { link = '@markup.strikethrough' })
-- set(0, '@markup.underline',            { link = '@markup.underline' })
--
-- set(0, '@markup.heading',              { link = '@markup.heading' })
-- set(0, '@markup.heading.1',            { link = '@markup.heading.1' })
-- set(0, '@markup.heading.2',            { link = '@markup.heading.2' })
-- set(0, '@markup.heading.3',            { link = '@markup.heading.3' })
-- set(0, '@markup.heading.4',            { link = '@markup.heading.4' })
-- set(0, '@markup.heading.5',            { link = '@markup.heading.5' })
-- set(0, '@markup.heading.6',            { link = '@markup.heading.6' })
--
-- set(0, '@markup.quote',                { link = '@markup.quote' })
-- set(0, '@markup.math',                 { link = '@markup.math' })
--
-- set(0, '@markup.link',                 { link = '@markup.link' })
-- set(0, '@markup.link.label',           { link = '@markup.link.label' })
-- set(0, '@markup.link.url',             { link = '@markup.link.url' })
--
-- set(0, '@markup.raw',                  { link = '@markup.raw' })
-- set(0, '@markup.raw.block',            { link = '@markup.raw.block' })
--
-- set(0, '@markup.list',                 { link = '@markup.list' })
-- set(0, '@markup.list.checked',         { link = '@markup.list.checked' })
-- set(0, '@markup.list.unchecked',       { link = '@markup.list.unchecked' })
--
-- set(0, '@diff.plus',                   { link = '@diff.plus' })
-- set(0, '@diff.minus',                  { link = '@diff.minus' })
-- set(0, '@diff.delta',                  { link = '@diff.delta' })
--
-- set(0, '@tag',                         { link = '@tag' })
-- set(0, '@tag.builtin',                 { link = '@tag.builtin' })
-- set(0, '@tag.attribute',               { link = '@tag.attribute' })
-- set(0, '@tag.delimiter',               { link = '@tag.delimiter' })

-- Diagnostics
--

-- DiagnosticError
--     Used as the base highlight group.
--     Other Diagnostic highlights link to this by default (except Underline)
--
--                                                         *hl-DiagnosticWarn*
-- DiagnosticWarn
--     Used as the base highlight group.
--     Other Diagnostic highlights link to this by default (except Underline)
--
--                                                         *hl-DiagnosticInfo*
-- DiagnosticInfo
--     Used as the base highlight group.
--     Other Diagnostic highlights link to this by default (except Underline)
--
--                                                         *hl-DiagnosticHint*
-- DiagnosticHint
--     Used as the base highlight group.
--     Other Diagnostic highlights link to this by default (except Underline)
--
--                                                         *hl-DiagnosticOk*
-- DiagnosticOk
--     Used as the base highlight group.
--     Other Diagnostic highlights link to this by default (except Underline)
--
--                                         *hl-DiagnosticVirtualTextError*
-- DiagnosticVirtualTextError
--     Used for "Error" diagnostic virtual text.
--
--                                         *hl-DiagnosticVirtualTextWarn*
-- DiagnosticVirtualTextWarn
--     Used for "Warn" diagnostic virtual text.
--
--                                                 *hl-DiagnosticVirtualTextInfo*
-- DiagnosticVirtualTextInfo
--     Used for "Info" diagnostic virtual text.
--
--                                                 *hl-DiagnosticVirtualTextHint*
-- DiagnosticVirtualTextHint
--     Used for "Hint" diagnostic virtual text.
--
--                                                 *hl-DiagnosticVirtualTextOk*
-- DiagnosticVirtualTextOk
--     Used for "Ok" diagnostic virtual text.
--
--                                             *hl-DiagnosticVirtualLinesError*
-- DiagnosticVirtualLinesError
--     Used for "Error" diagnostic virtual lines.
--
--                                             *hl-DiagnosticVirtualLinesWarn*
-- DiagnosticVirtualLinesWarn
--     Used for "Warn" diagnostic virtual lines.
--
--                                             *hl-DiagnosticVirtualLinesInfo*
-- DiagnosticVirtualLinesInfo
--     Used for "Info" diagnostic virtual lines.
--
--                                             *hl-DiagnosticVirtualLinesHint*
-- DiagnosticVirtualLinesHint
--     Used for "Hint" diagnostic virtual lines.
--
--                                                 *hl-DiagnosticVirtualLinesOk*
-- DiagnosticVirtualLinesOk
--     Used for "Ok" diagnostic virtual lines.
--
--                                                 *hl-DiagnosticUnderlineError*
-- DiagnosticUnderlineError
--     Used to underline "Error" diagnostics.
--
--                                                 *hl-DiagnosticUnderlineWarn*
-- DiagnosticUnderlineWarn
--     Used to underline "Warn" diagnostics.
--
--                                                 *hl-DiagnosticUnderlineInfo*
-- DiagnosticUnderlineInfo
--     Used to underline "Info" diagnostics.
--
--                                                 *hl-DiagnosticUnderlineHint*
-- DiagnosticUnderlineHint
--     Used to underline "Hint" diagnostics.
--
--                                                 *hl-DiagnosticUnderlineOk*
-- DiagnosticUnderlineOk
--     Used to underline "Ok" diagnostics.
--
--                                                 *hl-DiagnosticFloatingError*
-- DiagnosticFloatingError
--     Used to color "Error" diagnostic messages in diagnostics float.
--     See |vim.diagnostic.open_float()|
--
--                                                 *hl-DiagnosticFloatingWarn*
-- DiagnosticFloatingWarn
--     Used to color "Warn" diagnostic messages in diagnostics float.
--
--                                                 *hl-DiagnosticFloatingInfo*
-- DiagnosticFloatingInfo
--     Used to color "Info" diagnostic messages in diagnostics float.
--
--                                                 *hl-DiagnosticFloatingHint*
-- DiagnosticFloatingHint
--     Used to color "Hint" diagnostic messages in diagnostics float.
--
--                                                 *hl-DiagnosticFloatingOk*
-- DiagnosticFloatingOk
--     Used to color "Ok" diagnostic messages in diagnostics float.
--
--                                                 *hl-DiagnosticSignError*
-- DiagnosticSignError
--     Used for "Error" signs in sign column.
--
--                                                 *hl-DiagnosticSignWarn*
-- DiagnosticSignWarn
--     Used for "Warn" signs in sign column.
--
--                                                 *hl-DiagnosticSignInfo*
-- DiagnosticSignInfo
--     Used for "Info" signs in sign column.
--
--                                                 *hl-DiagnosticSignHint*
-- DiagnosticSignHint
--     Used for "Hint" signs in sign column.
--
--                                                 *hl-DiagnosticSignOk*
-- DiagnosticSignOk
--     Used for "Ok" signs in sign column.
--
--                                                 *hl-DiagnosticDeprecated*
-- DiagnosticDeprecated
--     Used for deprecated or obsolete code.
--
--                                                 *hl-DiagnosticUnnecessary*
-- DiagnosticUnnecessary
--     Used for unnecessary or unused code.
