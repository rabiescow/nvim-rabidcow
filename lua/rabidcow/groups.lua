---@class Highlight
---@variable.member fg string color name or "#RRGGBB"
---@variable.member foreground string same fg, color name or "#RRGGBB"
---@variable.member bg string color name or "#RRGGBB"
---@variable.member background string same bg, color name or "#RRGGBB"
---@variable.member sp string color name or "#RRGGBB"
---@variable.member special string same sg, color name or "#RRGGBB"
---@variable.member blend integer value between 0 and 100
---@variable.member bold boolean
---@variable.member standout boolean
---@variable.member underline boolean
---@variable.member undercurl boolean
---@variable.member underdouble boolean
---@variable.member underdotted boolean
---@variable.member underdashed boolean
---@variable.member strikethrough boolean
---@variable.member italic boolean
---@variable.member reverse boolean
---@variable.member nocombine boolean
---@variable.member link string name of another highlight group to link to, see |:hi-link|.
---@variable.member default string Don't override existing definition |:hi-default|
---@variable.member ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@variable.member ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@variable.member cterm table cterm attribute map, like |highlight-args|.
---@alias HighlightGroups table<string, Highlight>
---setup highlight groups
---@param configs RabidCowConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
    local colors = configs.colors
    local endOfBuffer = {
        fg = configs.show_end_of_buffer and colors.selection or colors.bg
    }

    return {
        Normal = {fg = colors.fg, bg = colors.bg},
        NormalFloat = {fg = colors.fg, bg = colors.bg},
        Comment = {fg = colors.comment, italic = true},
        Constant = {fg = colors.fg},
        String = {fg = colors.teal},
        Character = {fg = colors.yellow},
        Number = {fg = colors.orange},
        Boolean = {fg = colors.red},
        Float = {fg = colors.teal},
        FloatBorder = {fg = colors.fg},
        Operator = {fg = colors.purple},
        Keyword = {fg = colors.purple},
        Keywords = {fg = colors.purple},
        Identifier = {fg = colors.yellow},
        Function = {fg = colors.yellow},
        Statement = {fg = colors.purple},
        Conditional = {fg = colors.purple},
        Repeat = {fg = colors.purple},
        Label = {fg = colors.teal},
        Exception = {fg = colors.purple},
        PreProc = {fg = colors.teal},
        Include = {fg = colors.purple},
        Define = {fg = colors.purple},
        Title = {fg = colors.teal},
        Macro = {fg = colors.purple},
        PreCondit = {fg = colors.teal},
        Type = {fg = colors.fg},
        StorageClass = {fg = colors.purple},
        Structure = {fg = colors.teal},
        TypeDef = {fg = colors.teal},
        Special = {fg = colors.yellow},
        SpecialComment = {fg = colors.comment, italic = true},
        Error = {fg = colors.red},
        Todo = {fg = colors.purple, bold = true, italic = true},
        Underlined = {fg = colors.teal, underline = true},

        Cursor = {reverse = true},
        CursorLineNr = {fg = colors.active_line_nr, bold = true},

        SignColumn = {bg = colors.bg},

        Conceal = {fg = colors.comment},
        CursorColumn = {bg = colors.black},
        CursorLine = {bg = colors.selection},
        ColorColumn = {bg = colors.selection},

        StatusLine = {fg = colors.fg, bg = colors.black},
        StatusLineNC = {fg = colors.comment},
        StatusLineTerm = {fg = colors.fg, bg = colors.black},
        StatusLineTermNC = {fg = colors.comment},

        Directory = {fg = colors.teal},
        DiffAdd = {fg = colors.bg, bg = colors.teal},
        DiffChange = {fg = colors.blue},
        DiffDelete = {fg = colors.red},
        DiffText = {fg = colors.comment},

        ErrorMsg = {fg = colors.red},
        VertSplit = {fg = colors.black},
        WinSeparator = {fg = colors.black},
        Folded = {fg = colors.comment},
        FoldColumn = {},
        Search = {fg = colors.black, bg = colors.blue},
        IncSearch = {fg = colors.blue, bg = colors.comment},
        LineNr = {fg = colors.line_nr},
        MatchParen = {fg = colors.fg, reverse = true},
        NonText = {fg = colors.comment},
        Pmenu = {fg = colors.fg, bg = colors.bg},
        PmenuSel = {fg = colors.fg, bg = colors.selection},
        PmenuSbar = {bg = colors.bg},
        PmenuThumb = {bg = colors.selection},

        Question = {fg = colors.purple},
        QuickFixLine = {fg = colors.black, bg = colors.teal},
        SpecialKey = {fg = colors.comment},

        SpellBad = {fg = colors.red, underline = true},
        SpellCap = {fg = colors.teal},
        SpellLocal = {fg = colors.teal},
        SpellRare = {fg = colors.teal},

        TabLine = {fg = colors.comment},
        TabLineSel = {fg = colors.fg},
        TabLineFill = {bg = colors.bg},
        Terminal = {fg = colors.fg, bg = colors.black},
        Visual = {bg = colors.selection},
        VisualNOS = {fg = colors.selection},
        WarningMsg = {fg = colors.teal},
        WildMenu = {fg = colors.black, bg = colors.fg},
        EndOfBuffer = endOfBuffer,

        -- TreeSitter
        ["@type"] = {fg = colors.dark_purple},
        ["@type.ocaml"] = {fg = colors.dark_purple},
        ["@type.builtin"] = {fg = colors.orange, italic = true, bold = true},
        ["@type.qualifier"] = {fg = colors.purple},
        ["@type.module.open"] = {fg = colors.dark_red, italic = false},
        ["@type.module.name"] = {fg = colors.dark_red},

        ["@constructor"] = {fg = colors.dark_yellow},

        ["@variable"] = {fg = colors.fg},
        ["@variable.go"] = {fg = colors.bright_orange},
        ["@variable.ocaml"] = {fg = colors.fg},

        ["@variable.builtin"] = {fg = colors.blue},
        ["@variable.member"] = {fg = colors.fg},
        ["@variable.parameter"] = {fg = colors.fg, bold = true},
        ["@variable.parameter.reference"] = {fg = colors.fg},

        ["@character"] = {fg = colors.yellow},
        ["@character.special"] = {fg = colors.teal},

        ["@function"] = {fg = colors.dark_yellow, italic = true},
        ["@function.ocaml"] = {fg = colors.dark_yellow},

        ["@function.builtin"] = {fg = colors.bright_yellow},
        ["@function.call"] = {fg = colors.bright_yellow},
        ["@function.let"] = {fg = colors.fg},
        ["@function.macro"] = {fg = colors.bright_yellow},
        ["@function.method"] = {fg = colors.orange},
        ["@function.method.call"] = {fg = colors.orange},
        ["@function.argument.name"] = {fg = colors.gray},
        ["@function.argument.func"] = {fg = colors.gray},

        ["@operator"] = {fg = colors.purple},
        ["@operator.ocaml"] = {fg = colors.purple},
        ["@_operator"] = {fg = colors.yellow, bold = true},

        -- ~init: ~f: etc
        ["@label"] = {fg = colors.gray, italic = true},

        ["@comment"] = {fg = colors.comment, italic = true},
        ["@comment.documentation"] = {fg = colors.comment, italic = true},

        ["@constant"] = {fg = colors.fg},
        ["@constant.builtin"] = {fg = colors.fg},
        ["@constant.macro"] = {fg = colors.teal},

        ["@number"] = {fg = colors.orange},
        ["@number.float"] = {fg = colors.orange},

        ["@string"] = {fg = colors.teal},
        ["@string.lua"] = {fg = colors.dark_orange},
        ["@string.ocaml"] = {fg = colors.dark_orange},
        ["@string.escape"] = {fg = colors.purple},
        ["@string.html"] = {fg = colors.orange},
        ["@string.regexp"] = {fg = colors.red},
        ["@string.special"] = {fg = colors.orange},
        ["@string.special.symbol"] = {fg = colors.orange},
        ["@string.quoted.double.html"] = {fg = colors.orange},
        ["@string.quoted.single.html"] = {fg = colors.orange},
        ["@string.quoted.double.tsx"] = {fg = colors.orange},
        ["@string.quoted.single.tsx"] = {fg = colors.orange},
        ["@string.quoted.double.jsx"] = {fg = colors.orange},
        ["@string.quoted.single.jsx"] = {fg = colors.orange},

        ["@keyword"] = {fg = colors.orange, italic = true},
        ["@keyword.conditional"] = {
            fg = colors.pink,
            italic = true,
            bold = true
        },
        ["@keyword.coroutine"] = {fg = colors.purple, italic = true},
        ["@keyword.directive"] = {fg = colors.purple, italic = true},
        ["@keyword.exception"] = {fg = colors.purple},
        ["@keyword.function"] = {fg = colors.purple, italic = true},
        ["@keyword.function.go"] = {fg = colors.purple, italic = true},
        ["@keyword.function.ocaml"] = {fg = colors.purple, italic = true},
        ["@keyword.function.ruby"] = {fg = colors.purple, italic = true},
        ["@keyword.import"] = {fg = colors.dark_red},
        ["@keyword.include"] = {fg = colors.dark_red},
        ["@keyword.modifier"] = {fg = colors.dark_orange},
        ["@keyword.operator"] = {fg = colors.purple},
        ["@keyword.repeat"] = {fg = colors.purple},
        ["@keyword.type"] = {fg = colors.red},
        ["@keyword.return"] = {fg = colors.bright_red, italic = true},

        ["@keyword.ocaml"] = {fg = colors.orange, italic = true},

        ["@punctuation"] = {fg = colors.bright_yellow},
        ["@punctuation.bracket"] = {fg = colors.dark_purple},
        ["@punctuation.delimiter"] = {fg = colors.purple},
        ["@punctuation.special"] = {fg = colors.comment, bold = true},

        ["@error"] = {fg = colors.red},

        ["@boolean"] = {fg = colors.red},
        ["@annotation"] = {fg = colors.teal},
        ["@module"] = {fg = colors.blue, bold = true},

        ["@attribute"] = {fg = colors.yellow},
        ["@attribute.method"] = {fg = colors.yellow},
        ["@attribute.name"] = {fg = colors.yellow},
        ["@attribute.value"] = {fg = colors.orange},
        ["@attribute.value.html"] = {fg = colors.orange},

        ["@structure"] = {fg = colors.purple},

        -- Semantic
        ["@spell"] = {fg = colors.gray},
        ["@class"] = {fg = colors.teal},
        ["@struct"] = {fg = colors.teal},
        ["@enum"] = {fg = colors.teal},
        ["@enumMember"] = {fg = colors.purple},
        ["@event"] = {fg = colors.teal},
        ["@interface"] = {fg = colors.teal},
        ["@property"] = {fg = colors.fg},
        ["@modifier"] = {fg = colors.teal},
        ["@regexp"] = {fg = colors.red},
        ["@typeParameter"] = {fg = colors.teal},
        ["@decorator"] = {fg = colors.teal},

        -- LSP Semantic (0.9+)
        ["@lsp.mod.definition"] = {fg = colors.bright_yellow},
        ["@lsp.mod.deprecated"] = {fg = colors.yellow},
        ["@lsp.mod.defaultLibrary.ocaml"] = {fg = colors.yellow},
        ["@lsp.mod.globalScope.ocaml"] = {fg = colors.yellow},

        ["@lsp.type"] = {fg = colors.bright_orange},
        ["@lsp.type.class"] = {fg = colors.yellow},
        ["@lsp.type.comment"] = {fg = colors.yellow},
        ["@lsp.type.enum"] = {fg = colors.yellow},
        ["@lsp.type.event"] = {fg = colors.yellow},
        ["@lsp.type.decorator"] = {fg = colors.yellow},
        ["@lsp.type.enumMember"] = {fg = colors.purple},
        ["@lsp.type.interface"] = {fg = colors.yellow},
        ["@lsp.type.macro"] = {fg = colors.yellow},
        ["@lsp.type.method"] = {fg = colors.yellow},
        ["@lsp.type.namespace"] = {fg = colors.dark_red, italic = true},
        ["@lsp.type.parameter"] = {fg = colors.fg},
        ["@lsp.type.property"] = {fg = colors.fg},
        ["@lsp.type.regexp"] = {fg = colors.yellow},
        ["@lsp.type.string"] = {fg = colors.fg},

        ["@lsp.type.struct"] = {fg = colors.dark_purple},
        ["@lsp.type.struct.ocaml"] = {fg = colors.dark_purple},

        ["@lsp.type.type"] = {fg = colors.dark_red},
        ["@lsp.type.typeParameter"] = {fg = colors.dark_red},

        ["@lsp.type.variable"] = {fg = colors.bright_orange, bold = true},
        ["@lsp.type.variable.ocaml"] = {fg = colors.bright_orange, bold = true}, -- should be same as tpmod.func.def
        ["@lsp.type.variable.classScope"] = {
            fg = colors.bright_orange,
            bold = true
        },
        ["@lsp.type.variable.fileScope"] = {
            fg = colors.bright_orange,
            bold = true
        },
        ["@lsp.type.variable.globalScope"] = {
            fg = colors.bright_orange,
            bold = true
        },

        ["@lsp.typemod.struct.declaration"] = {fg = colors.red},
        ["@lsp.typemod.struct.declaration.ocaml"] = {
            fg = colors.red,
            bold = true
        },

        ["@lsp.typemod.function.definition"] = {
            fg = colors.bright_orange,
            bold = true
        },
        ["@lsp.typemod.function.definition.ocaml"] = {
            fg = colors.bright_orange,
            bold = true
        },
        ["@lsp.typemod.enum.declaration"] = {fg = colors.red, bold = true},
        ["@lsp.typemod.enum.declaration.ocaml"] = {fg = colors.red, bold = true},

        ["@lsp.typemod.variable.globalScope"] = {fg = colors.fg},
        ["@lsp.typemod.variable.defaultLibrary"] = {fg = colors.fg},
        ["@lsp.typemod.variable.globalScope.cpp"] = {fg = colors.fg},
        ["@lsp.typemod.variable.defaultLibrary.cpp"] = {fg = colors.fg},

        ["@lsp.type.function"] = {fg = colors.bright_orange},
        ["@lsp.type.function.ocaml"] = {fg = colors.bright_orange},
        ["@lsp.type.function.classScope"] = {fg = colors.bright_orange},

        -- LSP
        LspSignatureActiveParameter = {fg = colors.blue, italic = true},
        LspCodeLens = {fg = colors.code_lens},
        LspCodeLensSeparator = {fg = colors.dark_gray},
        LspInlayHint = {fg = colors.inlay_hint},
        LspInlayHints = {fg = colors.inlay_hint},
        LspReferenceRead = {bg = colors.selection},
        LspReferenceWrite = {bg = colors.selection},
        LspReferenceText = {bg = colors.selection},
        LspReferenceTarget = {bg = colors.selection},

        -- Diagnostic
        DiagnosticError = {fg = colors.error},
        DiagnosticWarn = {fg = colors.warning},
        DiagnosticInfo = {fg = colors.info},
        DiagnosticHint = {fg = colors.hint},
        DiagnosticOk = {fg = colors.ok},

        DiagnosticFloatingError = {fg = colors.error},
        DiagnosticFloatingWarn = {fg = colors.warning},
        DiagnosticFloatingInfo = {fg = colors.info},
        DiagnosticFloatingHint = {fg = colors.hint},
        DiagnosticFloatingOk = {fg = colors.ok},

        DiagnosticVirtualTextError = {fg = colors.error},
        DiagnosticVirtualTextWarn = {fg = colors.warning},
        DiagnosticVirtualTextInfo = {fg = colors.info},
        DiagnosticVirtualTextHint = {fg = colors.hint},
        DiagnosticVirtualTextOk = {fg = colors.ok},

        DiagnosticUnderlineError = {undercurl = true, sp = colors.error},
        DiagnosticUnderlineWarn = {undercurl = true, sp = colors.warning},
        DiagnosticUnderlineInfo = {undercurl = true, sp = colors.info},
        DiagnosticUnderlineHint = {undercurl = true, sp = colors.hint},
        DiagnosticUnderlineOk = {undercurl = true, sp = colors.ok},

        DiagnosticVirtualLinesError = {fg = colors.error},
        DiagnosticVirtualLinesWarn = {fg = colors.warning},
        DiagnosticVirtualLinesHint = {fg = colors.info},
        DiagnosticVirtualLinesInfo = {fg = colors.hint},
        DiagnosticVirtualLinesOk = {fg = colors.ok},

        DiagnosticDefaultError = {fg = colors.error},
        DiagnosticDefaultWarn = {fg = colors.warning},
        DiagnosticDefaultInfo = {fg = colors.info},
        DiagnosticDefaultHint = {fg = colors.hint},
        DiagnosticDefaultOk = {fg = colors.ok},

        DiagnosticSignError = {fg = colors.error},
        DiagnosticSignWarn = {fg = colors.warning},
        DiagnosticSignInfo = {fg = colors.info},
        DiagnosticSignHint = {fg = colors.hint},
        DiagnosticSignOk = {fg = colors.ok},

        DiagnosticUnnecessary = {fg = colors.teal},

        -- HTML
        htmlArg = {fg = colors.yellow},
        htmlBold = {fg = colors.teal, bold = true},
        htmlEndTag = {fg = colors.teal},
        htmlH1 = {fg = colors.purple},
        htmlH2 = {fg = colors.purple},
        htmlH3 = {fg = colors.purple},
        htmlH4 = {fg = colors.purple},
        htmlH5 = {fg = colors.purple},
        htmlH6 = {fg = colors.purple},
        htmlItalic = {fg = colors.yellow, italic = true},
        htmlLink = {fg = colors.purple, underline = true},
        htmlSpecialChar = {fg = colors.teal},
        htmlSpecialTagName = {fg = colors.teal},
        htmlString = {fg = colors.orange},
        htmlTag = {fg = colors.purple},
        htmlTagN = {fg = colors.purple},
        htmlTagName = {fg = colors.purple},
        htmlTitle = {fg = colors.fg},

        ["@markup"] = {fg = colors.blue},
        ["@markup.emphasis"] = {fg = colors.yellow, italic = true},
        ["@markup.link.url"] = {fg = colors.fg, italic = true},
        ["@markup.link.label.symbol"] = {fg = colors.fg},
        ["@markup.link"] = {fg = colors.purple, bold = true},
        ["@markup.list"] = {fg = colors.teal},
        ["@markup.strong"] = {fg = colors.teal, bold = true},
        ["@markup.underline"] = {fg = colors.blue},
        ["@markup.heading"] = {fg = colors.comment, bold = true},
        ["@markup.raw"] = {fg = colors.teal},

        ["@tag"] = {fg = colors.purple},
        ["@tag.attribute"] = {fg = colors.yellow},
        ["@tag.delimiter"] = {fg = colors.comment},

        -- Markdown
        markdownBlockquote = {fg = colors.teal, italic = true},
        markdownBold = {fg = colors.teal, bold = true},
        markdownCode = {fg = colors.teal},
        markdownCodeBlock = {fg = colors.teal},
        markdownCodeDelimiter = {fg = colors.red},
        markdownH1 = {fg = colors.comment, bold = true},
        markdownH2 = {fg = colors.comment, bold = true},
        markdownH3 = {fg = colors.comment, bold = true},
        markdownH4 = {fg = colors.comment, bold = true},
        markdownH5 = {fg = colors.comment, bold = true},
        markdownH6 = {fg = colors.comment, bold = true},
        markdownHeadingDelimiter = {fg = colors.orange},
        markdownHeadingRule = {fg = colors.comment},
        markdownId = {fg = colors.teal},
        markdownIdDeclaration = {fg = colors.purple},
        markdownIdDelimiter = {fg = colors.gray},
        markdownItalic = {fg = colors.gray, italic = true},
        markdownLinkDelimiter = {fg = colors.gray},
        markdownLinkText = {fg = colors.purple},
        markdownListMarker = {fg = colors.orange},
        markdownOrderedListMarker = {fg = colors.orange},
        markdownRule = {fg = colors.comment},
        markdownUrl = {fg = colors.blue, underline = true},

        -- Git highlighting
        gitcommitComment = {fg = colors.comment, italic = true},
        gitcommitUnmerged = {fg = colors.orange},
        gitcommitOnBranch = {},
        gitcommitBranch = {fg = colors.purple},
        gitcommitDiscardedType = {fg = colors.red},
        gitcommitSelectedType = {fg = colors.orange},
        gitcommitHeader = {},
        gitcommitUntrackedFile = {fg = colors.blue},
        gitcommitDiscardedFile = {fg = colors.red},
        gitcommitSelectedFile = {fg = colors.orange},
        gitcommitUnmergedFile = {fg = colors.yellow},
        gitcommitFile = {},
        gitcommitNoBranch = {fg = colors.purple},
        gitcommitUntracked = {fg = colors.comment},
        gitcommitDiscarded = {fg = colors.comment},
        gitcommitSelected = {fg = colors.comment},
        gitcommitDiscardedArrow = {fg = colors.red},
        gitcommitSelectedArrow = {fg = colors.orange},
        gitcommitUnmergedArrow = {fg = colors.yellow},

        -- Neovim
        healthError = {fg = colors.red},
        healthSuccess = {fg = colors.teal},
        healthWarning = {fg = colors.warning},

        -- Buffer
        BufferCurrent = {bg = colors.fg, fg = colors.bg},
        BufferCurrentIndex = {bg = colors.fg, fg = colors.orange},
        BufferCurrentMod = {bg = colors.fg, fg = colors.red},
        BufferCurrentSign = {bg = colors.fg, fg = colors.bg},
        BufferCurrentTarget = {bg = colors.fg, fg = colors.orange},
        BufferVisible = {fg = colors.comment},
        BufferVisibleIndex = {fg = colors.orange},
        BufferVisibleMod = {fg = colors.red},
        BufferVisibleSign = {fg = colors.comment},
        BufferVisibleTarget = {fg = colors.orange},
        BufferInactive = {fg = colors.comment},
        BufferInactiveIndex = {fg = colors.comment},
        BufferInactiveMod = {fg = colors.red},
        BufferInactiveSign = {fg = colors.comment},
        BufferInactiveTarget = {fg = colors.orange},

        -- nvim-cmp
        CmpDocumentationBorder = {fg = colors.fg, bg = colors.input_bg},
        CmpDocumentation = {fg = colors.fg, bg = colors.input_bg},
        CmpItemAbbr = {fg = colors.fg},
        CmpItemAbbrDeprecated = {fg = colors.fg, strikethrough = true},
        CmpItemAbbrMatch = {fg = colors.blue},
        CmpItemAbbrMatchFuzzy = {fg = colors.blue},
        CmpItemKind = {fg = colors.purple},
        CmpItemMenu = {fg = colors.comment},

        -- blink.nvim
        BlinkCmpKindOperator = {fg = colors.blue},
        BlinkCmpKindReference = {fg = colors.red},
        BlinkCmpKindProperty = {fg = colors.gray},
        BlinkCmpKindSnippet = {fg = colors.bracket},
        BlinkCmpKindStruct = {fg = colors.teal},
        BlinkCmpKindText = {fg = colors.purple},
        BlinkCmpKindMethod = {fg = colors.red},
        BlinkCmpKindFunction = {fg = colors.orange},
        BlinkCmpKindModule = {fg = colors.red},
        BlinkCmpKindInterface = {fg = colors.teal},
        BlinkCmpKindKeyword = {fg = colors.orange},
        BlinkCmpKindFolder = {fg = colors.purple},
        BlinkCmpKindTypeParameter = {fg = colors.teal},
        BlinkCmpKindValue = {fg = colors.bracket},
        BlinkCmpKindUnit = {fg = colors.info},
        BlinkCmpMenuSelection = {bg = colors.fg, fg = colors.bg},
        BlinkCmpMenuBorder = {fg = colors.fg},
        BlinkCmpSignatureHelpBorder = {fg = colors.fg},
        BlinkCmpScrollBarGutter = {
            fg = colors.sidebar_fg,
            bg = colors.sidebar_title
        },
        BlinkCmpScrollBarThumb = {fg = colors.sidebar_title},

        -- Telescope
        TelescopeBorder = {fg = colors.purple},
        TelescopePromptBorder = {fg = colors.purple},
        TelescopeResultsBorder = {fg = colors.purple},
        TelescopePreviewBorder = {fg = colors.purple},
        TelescopeSelectionCaret = {fg = colors.orange},
        TelescopeSelection = {fg = colors.orange, bg = colors.selection},
        TelescopeMatching = {fg = colors.blue},
        TelescopePromptPrefix = {fg = colors.orange},

        -- NvimTree
        -- NvimTreeNormal = {bg = colors.sidebar_bg, fg = colors.sidebar_fg},
        -- NvimTreeVertSplit = {fg = colors.sidebar_bg, bg = colors.sidebar_bg},
        -- NvimTreeRootFolder = {fg = colors.sidebar_title, bold = true},
        -- NvimTreeGitDirty = {fg = colors.orange},
        -- NvimTreeGitNew = {fg = colors.teal},
        -- NvimTreeSpecialFile = {fg = colors.blue},
        -- NvimTreeFolderName = {fg = colors.blue},
        -- NvimTreeOpenedFolderName = {fg = colors.blue, bold = true},
        -- NvimTreeEmptyFolderName = {fg = colors.comment},
        -- NvimTreeFolderIcon = {fg = colors.purple},
        -- NvimTreeIndentMarker = {fg = colors.comment},

        -- NeoTree
        -- NeoTreeNormal = {bg = colors.sidebar_bg, fg = colors.sidebar_fg},
        -- NeoTreeNormalNC = {bg = colors.sidebar_bg, fg = colors.sidebar_fg},
        -- NeoTreeVertSplit = {fg = colors.sidebar_bg, bg = colors.sidebar_bg},
        -- NeoTreeRootName = {fg = colors.sidebar_title, bold = true},
        -- NeoTreeGitModified = {fg = colors.orange},
        -- NeoTreeGitAdded = {fg = colors.teal},
        -- NeoTreeGitConflict = {fg = colors.red},
        -- NeoTreeGitDeleted = {fg = colors.red},
        -- NeoTreeGitIgnored = {fg = colors.comment},
        -- NeoTreeGitRenamed = {fg = colors.purple},
        -- NeoTreeGitStaged = {fg = colors.teal},
        -- NeoTreeGitUnstaged = {fg = colors.orange},
        -- NeoTreeGitUntracked = {fg = colors.red},
        -- NeoTreeFileName = {fg = colors.sidebar_fg},
        -- NeoTreeFileNameOpened = {fg = colors.sidebar_fg, bold = true},

        -- WhichKey
        WhichKey = {fg = colors.blue},
        WhichKeyGroup = {fg = colors.orange},
        WhichKeyDesc = {fg = colors.purple},
        WhichKeySeperator = {fg = colors.comment},
        WhichKeySeparator = {fg = colors.comment},
        WhichKeyFloat = {bg = colors.bg},
        WhichKeyValue = {fg = colors.comment},

        -- LspSaga
        -- LspFloatWinNormal = {bg = colors.bg},
        -- LspFloatWinBorder = {fg = colors.purple},
        -- LspSagaBorderTitle = {fg = colors.blue},
        -- LspSagaHoverBorder = {fg = colors.blue},
        -- LspSagaRenameBorder = {fg = colors.teal},
        -- LspSagaDefPreviewBorder = {fg = colors.teal},
        -- LspSagaCodeActionBorder = {fg = colors.purple},
        -- LspSagaFinderSelection = {fg = colors.selection},
        -- LspSagaCodeActionTitle = {fg = colors.blue},
        -- LspSagaCodeActionContent = {fg = colors.purple},
        -- LspSagaSignatureHelpBorder = {fg = colors.red},
        -- ReferencesCount = {fg = colors.purple},
        -- DefinitionCount = {fg = colors.purple},
        -- DefinitionIcon = {fg = colors.blue},
        -- ReferencesIcon = {fg = colors.blue},
        -- TargetWord = {fg = colors.blue},

        -- Indent Blankline
        IndentBlanklineChar = {fg = colors.selection},
        IndentBlanklineContextChar = {fg = colors.purple},

        -- Illuminate
        illuminatedWord = {bg = colors.selection},
        illuminatedCurWord = {bg = colors.selection},

        -- Hop
        HopNextKey = {fg = colors.blue, bold = true},
        HopNextKey1 = {fg = colors.purple, bold = true},
        HopNextKey2 = {fg = colors.comment},
        HopUnmatched = {fg = colors.comment},

        -- Leap
        LeapMatch = {fg = colors.blue, bold = true, underline = true},
        LeapLabelPrimary = {fg = colors.blue, bold = true},
        LeapLabelSecondary = {fg = colors.purple, bold = true},
        LeapBackdrop = {fg = colors.comment},

        -- Barbar
        BufferTabpage = {fg = colors.comment},
        BufferTabpageFill = {fg = colors.comment}

    }
end

return {setup = setup}
