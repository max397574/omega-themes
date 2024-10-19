local theme = require("omega.colors.themes." .. vim.g.colors_name)
local colors = theme.colors
local base16 = theme.base16
local ok, config = pcall(require, "omega.config")
if not ok then
    config = {}
end
local color_utils = require("omega.utils.colors")
colors.tele_bg = colors.telescope_bg or colors.darker_black
colors.tele_prompt = colors.telescope_prompt or colors.black2

local highlights = {
    ["Normal"] = { fg = base16.base05, bg = base16.base00 },
    ["Bold"] = { bold = true },
    ["Debug"] = { fg = base16.base08 },
    ["Directory"] = { fg = base16.base0D },
    ["Error"] = { fg = base16.base00, bg = base16.base08 },
    ["ErrorMsg"] = { fg = base16.base08, bg = base16.base00 },
    ["Exception"] = { fg = base16.base08 },
    ["FoldColumn"] = { fg = base16.base0C, bg = base16.base01 },
    ["CurSearch"] = { fg = base16.base01, bg = base16.base09 },
    ["Italic"] = { italic = true },
    ["Macro"] = { fg = base16.base08, italic = true },
    ["MatchParen"] = { bold = true },
    ["ModeMsg"] = { fg = base16.base0B },
    ["MoreMsg"] = { fg = base16.base0B },
    ["Question"] = { fg = base16.base0D },
    ["Substitute"] = { fg = base16.base01, bg = base16.base0A },
    ["SpecialKey"] = { fg = base16.base03 },
    ["TooLong"] = { fg = base16.base08 },
    ["Underlined"] = { fg = base16.base08 },
    ["Visual"] = { bg = base16.base02 },
    ["VisualNOS"] = { fg = base16.base08 },
    ["WarningMsg"] = { fg = base16.base08 },
    ["WildMenu"] = { fg = base16.base08, bg = base16.base0A },
    ["Title"] = { fg = base16.base0D },
    ["Conceal"] = {},
    ["Cursor"] = { fg = base16.base00, bg = base16.base05 },
    ["NonText"] = { fg = base16.base03 },
    ["NeorgMarkupVerbatim"] = { fg = base16.base03 },
    ["SignColumn"] = { fg = base16.base03 },
    ["StatusLine"] = { fg = base16.base04 },
    ["StatusLineNC"] = { fg = base16.base03 },
    ["ColorColumn"] = { bg = base16.base01 },
    ["CursorColumn"] = { bg = base16.base01 },
    ["CursorLine"] = { bg = base16.base01 },
    ["CursorLineNr"] = { fg = base16.base04 },
    ["QuickFixLine"] = { bg = base16.base01 },
    ["Boolean"] = { fg = base16.base09 },
    ["Character"] = { fg = base16.base08 },
    ["Conditional"] = { fg = base16.base0E, italic = true },
    ["Constant"] = { fg = base16.base09 },
    ["Define"] = { fg = base16.base0E },
    ["Delimiter"] = { fg = base16.base0F },
    ["Float"] = { fg = base16.base09 },
    ["Identifier"] = { fg = base16.base08 },
    ["Include"] = { fg = base16.base0D },
    ["Label"] = { fg = base16.base0A },
    ["Number"] = { fg = base16.base09 },
    ["Operator"] = { fg = base16.base05 },
    ["PreProc"] = { fg = base16.base0A },
    ["Function"] = { fg = base16.base0D, italic = true },
    ["Repeat"] = { fg = base16.base0A },
    ["SpecialChar"] = { fg = base16.base0F },
    ["Statement"] = { fg = base16.base08 },
    ["StorageClass"] = { fg = base16.base0A },
    ["String"] = { fg = base16.base0B },
    ["Structure"] = { fg = base16.base0E },
    ["Tag"] = { fg = base16.base0A },
    ["Todo"] = { fg = base16.base0A, bg = base16.base01 },
    ["Type"] = { fg = base16.base0A },
    ["Typedef"] = { fg = base16.base0A },
    ["DiffDelete"] = { fg = base16.base08, bg = base16.base01 },
    ["DiffText"] = { fg = base16.base0D, bg = base16.base01 },
    ["DiffAdded"] = { fg = base16.base0B, bg = base16.base00 },
    ["DiffFile"] = { fg = base16.base08, bg = base16.base00 },
    ["DiffNewFile"] = { fg = base16.base0B, bg = base16.base00 },
    ["DiffLine"] = { fg = base16.base0D, bg = base16.base00 },
    ["DiffRemoved"] = { fg = base16.base08, bg = base16.base00 },
    ["gitcommitOverflow"] = { fg = base16.base08 },
    ["gitcommitSummary"] = { fg = base16.base0B },
    ["gitcommitComment"] = { fg = base16.base03 },
    ["gitcommitUntracked"] = { fg = base16.base03 },
    ["gitcommitDiscarded"] = { fg = base16.base03 },
    ["gitcommitSelected"] = { fg = base16.base03 },
    ["gitcommitHeader"] = { fg = base16.base0E },
    ["gitcommitSelectedType"] = { fg = base16.base0D },
    ["gitcommitUnmergedType"] = { fg = base16.base0D },
    ["gitcommitDiscardedType"] = { fg = base16.base0D },
    ["gitcommitBranch"] = { fg = base16.base09, bold = true },
    ["gitcommitUntrackedFile"] = { fg = base16.base0A },
    ["gitcommitUnmergedFile"] = { fg = base16.base08, bold = true },
    ["gitcommitDiscardedFile"] = { fg = base16.base08, bold = true },
    ["gitcommitSelectedFile"] = { fg = base16.base0B, bold = true },
    ["mailQuoted1"] = { fg = base16.base0A },
    ["mailQuoted2"] = { fg = base16.base0B },
    ["mailQuoted3"] = { fg = base16.base0E },
    ["mailQuoted4"] = { fg = base16.base0C },
    ["mailQuoted5"] = { fg = base16.base0D },
    ["mailQuoted6"] = { fg = base16.base0A },
    ["mailURL"] = { fg = base16.base0D },
    ["mailEmail"] = { fg = base16.base0D },
    ["SpellLocal"] = { undercurl = true, sp = base16.base0C },
    ["SpellCap"] = { undercurl = true, sp = base16.base0D },
    ["SpellRare"] = { undercurl = true, sp = base16.base0E },

    -- Treesitter highlights
    -- =====================

    -- Identifiers
    ["@variable"] = { fg = base16.base05 }, -- various variable names
    ["@variable.builtin"] = { fg = base16.base09 }, -- built-in variable names (e.g. `this`)
    ["@variable.parameter"] = { fg = base16.base08 }, -- parameters of a function
    ["@variable.member"] = { fg = base16.base08 }, -- object and struct fields

    ["@constant"] = { fg = base16.base09 }, -- constant identifiers
    ["@constant.builtin"] = { fg = base16.base09 }, -- built-in constant values
    ["@constant.macro"] = { fg = base16.base08 }, -- constants defined by the preprocessor

    ["@module"] = { fg = base16.base08 }, -- modules or namespaces
    ["@module.builtin"] = { fg = base16.base08 }, -- built-in modules or namespaces
    ["@label"] = { fg = base16.base0A }, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

    -- Literals
    -- --------
    ["@string"] = { fg = base16.base0B }, -- string literals
    ["@string.documentation"] = { fg = base16.base03, italic = true }, -- string documenting code (e.g. Python docstrings)
    ["@string.regexp"] = { fg = base16.base0C }, -- regular expressions
    ["@string.escape"] = { fg = base16.base0C }, -- escape sequences
    ["@string.special"] = { fg = base16.base0C }, -- other special strings (e.g. dates)
    ["@string.special.symbol"] = { fg = base16.base0B }, -- symbols or atoms
    ["@string.special.url"] = { fg = base16.base09, underline = true }, -- URIs (e.g. hyperlinks)
    ["@string.special.path"] = { fg = base16.base0C }, -- filenames

    ["@character"] = { fg = base16.base08 }, -- character literals
    ["@character.special"] = { fg = base16.base0F }, -- special characters (e.g. wildcards)

    ["@boolean"] = { fg = base16.base09 }, -- boolean literals
    ["@number"] = { fg = base16.base09 }, -- numeric literals
    ["@number.float"] = { fg = base16.base09 }, -- floating-point number literals

    -- Types
    -- -----
    ["@type"] = { fg = base16.base0A }, -- type or class definitions and annotations
    ["@type.builtin"] = { fg = base16.base0A }, -- built-in types
    ["@type.definition"] = { fg = base16.base0A }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
    ["@type.qualifier"] = { fg = base16.base0A }, -- type qualifiers (e.g. `const`)

    ["@attribute"] = { fg = base16.base0A }, -- attribute annotations (e.g. Python decorators)
    ["@property"] = { fg = base16.base08 }, -- the key in key/value pairs

    -- Functions
    -- ---------
    ["@function"] = { fg = base16.base0D, italic = true }, -- function definitions
    ["@function.builtin"] = { fg = base16.base0D }, -- built-in functions
    ["@function.call"] = { fg = base16.base0D }, -- function calls
    ["@function.macro"] = { fg = base16.base08 }, -- preprocessor macros

    ["@function.method"] = { fg = base16.base0D, italic = true }, -- method definitions
    ["@function.method.call"] = { fg = base16.base0D }, -- method calls

    ["@constructor"] = { fg = base16.base0C }, -- constructor calls and definitions
    ["@operator"] = { fg = base16.base05 }, -- symbolic operators (e.g. `+` / `*`)

    -- Keywords
    -- --------
    ["@keyword"] = { fg = base16.base0E }, -- keywords not fitting into specific categories
    ["@keyword.corutine"] = { fg = base16.base0E }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    ["@keyword.function"] = { fg = base16.base0E }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.operator"] = { fg = base16.base0E }, -- operators that are English words (e.g. `and` / `or`)
    ["@keyword.import"] = { fg = base16.base0D }, -- keywords for including modules (e.g. `import` / `from` in Python)
    ["@keyword.storage"] = { fg = base16.base0A }, -- modifiers that affect storage in memory or life-time
    ["@keyword.repeat"] = { fg = base16.base0A }, -- keywords related to loops (e.g. `for` / `while`)
    ["@keyword.return"] = { fg = base16.base0E }, -- keywords like `return` and `yield`
    ["@keyword.debug"] = { fg = base16.base08 }, -- keywords related to debugging
    ["@keyword.exception"] = { fg = base16.base08 }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    ["@keyword.conditional"] = { fg = base16.base0E, italic = true }, -- keywords related to conditionals (e.g. `if` / `else`)
    ["@keyword.conditional.ternary"] = { fg = base16.base0E, italic = true }, -- ternary operator (e.g. `?` / `:`)

    ["@keyword.directive"] = { fg = base16.base0A }, -- various preprocessor directives & shebangs
    ["@keyword.directive.define"] = { fg = base16.base0A }, -- preprocessor definition directives

    -- Punctuation
    -- -----------
    ["@punctuation.delimiter"] = { fg = base16.base0F }, -- delimiters (e.g. `;` / `.` / `,`)
    ["@puncuation.bracket"] = { fg = base16.base0D }, -- brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.special"] = { fg = base16.base05 }, -- special symbols (e.g. `{}` in string interpolation)

    -- Commments
    -- ---------
    ["@comment"] = { fg = base16.base03, italic = true }, -- line and block comments
    ["@comment.documentation"] = { fg = base16.base03, italic = true }, -- comments documenting code

    ["@comment.error"] = { fg = base16.base0F, bg = base16.base01 }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED:`)
    ["@comment.warning"] = { fg = base16.base0A, bg = base16.base01 }, -- warning-type comments (e.g. `WARNING:`, `FIX:`, `HACK:`)
    ["@comment.todo"] = { fg = base16.base0A, bg = base16.base01 }, -- todo-type comments (e.g. `TODO:`, `WIP:`, `FIXME:`)
    ["@comment.note"] = { fg = base16.base0D, bg = base16.base01 }, -- note-type comments (e.g. `NOTE:`, `INFO:`, `XXX`)

    -- Markup
    -- ------

    ["@markup.strong"] = { bold = true }, -- bold text
    ["@markup.italic"] = { italic = true }, -- italic text
    ["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
    ["@markup.underline"] = { underline = true }, -- underlined text (only for literal underline markup!)

    ["@markup.heading"] = { bold = true, underline = true }, -- headings, titles (including markers)

    ["@markup.quote"] = { link = "@markup.italic" }, -- block quotes
    ["@markup.math"] = { fg = base16.base0C }, -- math environments (e.g. `$ ... $` in LaTeX)
    ["@markup.environment"] = { fg = base16.base0D }, -- environments (e.g. in LaTeX)

    ["@markup.link"] = { fg = base16.base09 }, -- text references, footnotes, citations, etc.
    ["@markup.link.label"] = { fg = base16.base0C }, -- link, reference descriptions
    ["@markup.link.url"] = { fg = base16.base09, underline = true }, -- URL-style links

    ["@markup.raw"] = { fg = base16.base09 }, -- literal or verbatim text (e.g. inline code)
    ["@markup.raw.block"] = { fg = base16.base09 }, -- literal or verbatim text as a stand-alone block
    -- (use priority 90 for blocks with injections)

    ["@markup.list"] = { fg = base16.base05 }, -- list markers
    ["@markup.list.checked"] = { fg = colors.green }, -- checked todo-style list markers
    ["@markup.list.unchecked"] = { fg = colors.red }, -- unchecked todo-style list markers

    ["@diff.plus"] = { fg = base16.base0B }, -- added text (for diff files)
    ["@diff.minus"] = { fg = base16.base08 }, -- deleted text (for diff files)
    ["@diff.delta"] = { fg = base16.base09 }, -- changed text (for diff files)

    ["@tag"] = { fg = base16.base0A }, -- XML-style tag names (and similar)
    ["@tag.attribute"] = { fg = base16.base0A }, -- XML-style tag attributes
    ["@tag.delimiter"] = { fg = base16.base0F }, -- XML-style tag delimiters

    -- End of Treesitter highlights
    -- =============================

    ["@error"] = { fg = base16.base08 },
    ["@none"] = { fg = base16.base05 },
    ["@define"] = { fg = base16.base0A },
    ["@text"] = { fg = base16.base05 },
    ["@markup.environment.name"] = { fg = base16.base05, italic = true },
    ["@markup.emphasis"] = { fg = base16.base09, italic = true },
    ["@comment.hint"] = { fg = base16.base0D, bg = base16.base01 },
    ["@comment.info"] = { fg = base16.base0D, bg = base16.base01 },
    ["@comment.danger"] = { fg = base16.base0F, bg = base16.base01 },
    ["@conceal"] = { fg = base16.base05 },
    ["@definition"] = { underline = true, sp = base16.base04 },
    ["@scope"] = { bold = true },
    ["LspDiagnosticsDefaultError"] = { fg = base16.base08 },
    ["LspDiagnosticsDefaultWarning"] = { fg = base16.base0A },
    ["LspDiagnosticsDefaultWarn"] = { fg = base16.base0A },
    ["LspDiagnosticsDefaultInformation"] = { fg = base16.base0D },
    ["LspDiagnosticsDefaultInfo"] = { fg = base16.base0D },
    ["LspDiagnosticsDefaultHint"] = { fg = base16.base0C },
    ["TelescopeNormal"] = { fg = base16.base05, bg = base16.base00 },
    ["TelescopePreviewNormal"] = { fg = base16.base05, bg = base16.base00 },
    ["Keyword"] = { fg = base16.base0E, italic = true },
    ["PMenu"] = { fg = base16.base05, bg = base16.base00 },
    ["Special"] = { fg = base16.base0C, italic = true },
    ["markdownBold"] = { fg = base16.base0A, bold = true },
    ["@quantifier"] = { fg = base16.base0C, italic = true },
    ["@require_call"] = { fg = base16.base0E, italic = true },
    ["@utils"] = { fg = base16.base0D },
    ["@code"] = { fg = base16.base03 },
    ["@rust_path"] = { fg = base16.base0B },
    ["CodeActionAvailable"] = { fg = base16.base08 },

    Comment = { fg = colors.grey_fg, italic = true },
    TS_Context = { bg = colors.grey_fg },
    Yellow = { fg = colors.yellow },
    Red = { fg = colors.red },
    Green = { fg = colors.green },
    EndOfBuffer = { fg = colors.black },
    -- NormalFloat = { bg = colors.darker_black },
    NormalFloat = {},

    DiagnosticWarn = { fg = colors.orange },
    DiagnosticError = { fg = colors.red },
    DiagnosticInfo = { fg = colors.yellow },
    DiagnosticHint = { fg = colors.blue },
    DiagnosticOk = { fg = colors.green },
    DiagnosticUnnecessary = { fg = colors.grey_fg, underline = true, sp = colors.blue },
    DiagnosticDeprecated = { fg = colors.grey_fg, sp = colors.red, underline = true },

    DiagnosticUnderlineWarn = { sp = colors.orange, underline = true },
    DiagnosticUnderlineError = { sp = colors.red, underline = true },
    DiagnosticUnderlineInfo = { sp = colors.yellow, underline = true },
    DiagnosticUnderlineHint = { sp = colors.blue, underline = true },
    DiagnosticUnderlineOk = { sp = colors.green, underline = true },

    SpellBad = { undercurl = true, sp = colors.red },

    PmenuSbar = { bg = colors.one_bg2 },

    LineNr = { fg = colors.grey },
    NvimInternalError = { fg = colors.red },
    VertSplit = { fg = colors.one_bg2 },

    PmenuThumb = { bg = colors.white },
    WinSeparator = { fg = colors.one_bg2 },
    CmpDocumentationWindowBorder = { fg = colors.one_bg2 },

    NeorgCodeBlock = { bg = colors.darker_black },

    Folded = {},

    DashboardHeader = { fg = colors.grey_fg },
    DashboardFooter = { fg = colors.grey_fg },
    DashboardCenter = { fg = colors.grey_fg },
    DashboardShortcut = { fg = colors.grey_fg },

    DiffAdd = { fg = colors.nord_blue },
    DiffChange = { fg = colors.grey_fg },
    DiffModified = { fg = colors.nord_blue },

    IndentBlanklineChar = { fg = colors.line },

    LspDiagnosticsSignError = { fg = colors.red },
    LspDiagnosticsSignWarning = { fg = colors.yellow },
    LspDiagnosticsVirtualTextError = { fg = colors.red },
    LspDiagnosticsVirtualTextWarning = { fg = colors.yellow },

    LspDiagnosticsSignInformation = { fg = colors.green },
    LspDiagnosticsVirtualTextInformation = { fg = colors.green },
    LspDiagnosticsSignHint = { fg = colors.purple },
    LspDiagnosticsVirtualTextHint = { fg = colors.purple },
    NotifyERRORBorder = { fg = colors.red },
    NotifyERRORIcon = { fg = colors.red },
    NotifyERRORTitle = { fg = colors.red },
    NotifyWARNBorder = { fg = colors.orange },
    NotifyWARNIcon = { fg = colors.orange },
    NotifyWARNTitle = { fg = colors.orange },
    NotifyINFOBorder = { fg = colors.green },
    NotifyINFOIcon = { fg = colors.green },
    NotifyINFOTitle = { fg = colors.green },
    NotifyDEBUGBorder = { fg = colors.grey },
    NotifyDEBUGIcon = { fg = colors.grey },
    NotifyDEBUGTitle = { fg = colors.grey },
    NotifyTRACEBorder = { fg = colors.purple },
    NotifyTRACEIcon = { fg = colors.purple },
    NotifyTRACETitle = { fg = colors.purple },
    NvimTreeEmptyFolderName = { fg = colors.blue },
    NvimTreeEndOfBuffer = { fg = colors.darker_black },
    NvimTreeFolderIcon = { fg = colors.folder_bg },
    NvimTreeFolderName = { fg = colors.folder_bg },
    NvimTreeGitDirty = { fg = colors.red },
    NvimTreeIndentMarker = { fg = colors.one_bg2 },
    NvimTreeNormal = { bg = colors.darker_black },
    NvimTreeOpenedFolderName = { fg = colors.blue },
    NvimTreeRootFolder = { fg = colors.red, underline = true },
    NvimTreeStatuslineNc = { fg = colors.darker_black, bg = colors.darker_black },
    NvimTreeVertSplit = { fg = colors.darker_black, bg = colors.darker_black },
    NvimTreeWindowPicker = { fg = colors.red, bg = colors.tele_prompt },

    Search = { bg = colors.yellow },
    IncSearch = { bg = colors.red },

    TelescopeBorder = { fg = colors.folder_bg },

    LspReferenceRead = { link = "Visual" },
    LspReferenceText = { link = "Visual" },
    LspReferenceWrite = { link = "Visual" },

    LightspeedLabel = { fg = "#7DB000" },
    LightspeedShortcut = { bg = "#7DB000" },
    LightspeedOneCharMatch = { bg = "#7DB000" },
    LightspeedUniqueChar = { fg = "#FF6000" },
    LightspeedUnlabeledMatch = { fg = "#FF6000" },

    Definition = { fg = colors.white, bg = colors.darker_black },
    FloatBorder = { fg = colors.light_grey, bg = colors.black },

    PmenuSel = { fg = colors.blue, bg = colors.light_grey },

    LspSignatureActiveParameter = { bold = true, italic = true },

    NoicePopup = { bg = colors.darker_black },
    LazyH1 = {
        bg = colors.green,
        fg = colors.black,
    },

    LazyButton = {
        bg = colors.one_bg,
        fg = require("omega.utils.colors").lighten_color(colors.light_grey, 10),
    },

    LazyH2 = {
        fg = colors.red,
        bold = true,
        underline = true,
    },

    LazyReasonPlugin = { fg = colors.red },
    LazyValue = { fg = colors.teal },
    LazyDir = { fg = base16.base05 },
    LazyUrl = { fg = base16.base05 },
    LazyCommit = { fg = colors.green },
    LazyNoCond = { fg = colors.red },
    LazySpecial = { fg = colors.blue },
    LazyReasonFt = { fg = colors.purple },
    LazyOperator = { fg = colors.white },
    LazyReasonKeys = { fg = colors.teal },
    LazyTaskOutput = { fg = colors.white },
    LazyCommitIssue = { fg = colors.pink },
    LazyReasonEvent = { fg = colors.yellow },
    LazyReasonStart = { fg = colors.white },
    LazyReasonRuntime = { fg = colors.nord_blue },
    LazyReasonCmd = { fg = colors.sun },
    LazyReasonSource = { fg = colors.cyan },
    LazyReasonImport = { fg = colors.white },
    LazyProgressDone = { fg = colors.green },

    TablineBackground = { fg = colors.grey_fg, bg = colors.black2 },
    TablineSelected = { fg = colors.white, bg = colors.grey_fg, bold = true, italic = true },
    TablineDuplicateSelected = { fg = colors.white, bg = colors.grey_fg, bold = true, italic = true },
    TablineDuplicateVisible = { fg = colors.white, bg = colors.black2, bold = true, italic = true },
    TablineBuffer = { fg = colors.white, bg = colors.black2 },
    TablineBufferVisible = { fg = colors.grey_fg, bg = colors.black2 },
    TablineBufferSelected = { fg = colors.white, bg = colors.one_bg2 },
    TablineCloseButton = { fg = colors.red, bg = colors.black2 },
    TablineCloseButtonVisible = { fg = colors.red, bg = colors.black2 },
    TablineCloseButtonSelected = { fg = colors.red, bg = colors.one_bg2 },
    TablineFill = { fg = colors.darker_black, bg = colors.darker_black },
    TablineIndicatorSelected = { fg = colors.black2, bg = colors.black },
    TablineModified = { fg = colors.red, bg = colors.black2 },
    TablineModifiedVisible = { fg = colors.red, bg = colors.black2 },
    TablineModifiedSelected = { fg = colors.green, bg = colors.grey_fg },
    TablineSeparator = { fg = colors.grey_fg2, bg = colors.black2 },
    TablineSeparatorVisible = { fg = colors.darker_black, bg = colors.black2 },
    TablineSeparatorSelected = { fg = colors.red, bg = colors.one_bg2, bold = true },
    TablineTab = { fg = colors.light_grey, bg = colors.one_bg3 },
    TablineTabNew = { fg = colors.light_grey, bg = colors.one_bg3 },
    TablineTabToggle = { fg = colors.light_grey, bg = colors.one_bg3 },
    TablineDuplicate = { fg = colors.light_grey, bg = colors.black2 },
    TablineTabSelected = { fg = colors.black2, bg = colors.nord_blue },
    TablineTabClose = { fg = colors.red, bg = colors.darker_black },

    FlashMatch = { fg = "#7DB000" },
    FlashLabel = { bg = "#FF6000", fg = "#1e222a" },
    FlashCurrent = { link = "IncSearch" },

    InlayHints = { fg = base16.base05 },

    ["@lsp.type.class"] = { link = "Structure" },
    ["@lsp.type.function"] = { fg = base16.base0D },
    ["@lsp.typemod.variable.declaration"] = { fg = base16.base05, italic = false },

    ["@lsp.mod.declaration"] = { link = "@function" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.method"] = { link = "@function.call" },
    ["@lsp.typemod.function.public"] = { link = "@function.call" },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    ["@lsp.type.namespace"] = { link = "@module" },

    WhichKeyDesc = { fg = colors.cyan },
    WhichKeyFloat = { fg = colors.cyan },
    WhichKeySeparator = { fg = colors.cyan },
    WhichKeyIcon = { fg = base16.base0A },
    WhichKeyGroup = { fg = base16.base0C },
}

highlights["CmpItemAbbrMatch"] = { fg = colors.blue }
highlights["CmpSource"] = { fg = colors.grey_fg }
highlights["CmpSelected"] = { bg = color_utils.blend_colors(colors.blue, colors.darker_black, 0.3) }
if config.ui.completion.border == "half" then
    highlights["CmpBorder"] = { fg = colors.darker_black, bg = colors.black }
    highlights["CmpNormal"] = { fg = colors.white, bg = colors.darker_black }
    highlights["@care.menu"] = { fg = colors.white, bg = colors.darker_black }
    highlights["@care.border"] = { fg = colors.darker_black, bg = colors.black }
elseif config.ui.completion.border == "rounded" then
    highlights["CmpNormal"] = { fg = colors.white, bg = colors.black }
    highlights["CmpNormal"] = { fg = colors.white, bg = colors.darker_black }
    highlights["@care.menu"] = { fg = colors.white, bg = colors.black }
    highlights["@care.border"] = { fg = colors.white, bg = colors.black }
elseif config.ui.completion.border == "up_to_edge" then
    highlights["@care.menu"] = { fg = colors.white, bg = colors.darker_black }
    highlights["@care.border"] = { fg = colors.grey, bg = colors.darker_black }
elseif config.ui.completion.border == "none" then
    highlights["CmpNormal"] = { fg = colors.white, bg = colors.darker_black }
    highlights["@care.menu"] = { fg = colors.white, bg = colors.darker_black }
end

local kind_highlights = {
    Class = base16.base08,
    Color = base16.base08,
    Constant = base16.base09,
    Constructor = base16.base08,
    Enum = base16.base08,
    EnumMember = base16.base08,
    Event = base16.base0D,
    Field = base16.base08,
    File = base16.base09,
    Folder = base16.base09,
    Function = base16.base0D,
    Interface = base16.base0D,
    Keyword = base16.base0E,
    Method = base16.base08,
    Module = base16.base08,
    Operator = base16.base08,
    Property = base16.base0A,
    Reference = base16.base08,
    Snippet = base16.base0C,
    Struct = base16.base08,
    Text = base16.base0B,
    TypeParameter = base16.base08,
    Type = base16.base0A,
    Unit = base16.base08,
    Value = base16.base08,
    Variable = base16.base0E,
    Structure = base16.base0E,
    Identifier = base16.base08,
}

for kind_name, hl in pairs(kind_highlights) do
    highlights[("@care.type.blended.%s"):format(kind_name)] = {
        fg = hl,
        bg = color_utils.blend_colors(hl, base16.base00, 0.15),
    }
    highlights[("@care.type.fg.%s"):format(kind_name)] = {
        fg = hl,
    }
    highlights[("@care.type.%s"):format(kind_name)] = {
        fg = hl,
    }
end
if config.ui.completion.icons == "blended" then
    for kind_name, hl in pairs(kind_highlights) do
        highlights[("CmpItemKind%s"):format(kind_name)] = {
            fg = hl,
            bg = color_utils.blend_colors(hl, base16.base00, 0.15),
        }
        highlights[("CmpItemKindMenu%s"):format(kind_name)] = { fg = hl }
        highlights[("CmpItemKindBlock%s"):format(kind_name)] =
            { fg = color_utils.blend_colors(hl, base16.base00, 0.15) }
    end
elseif config.ui.completion.icons == "fg_colored" then
    for kind_name, hl in pairs(kind_highlights) do
        highlights[("CmpItemKindMenu%s"):format(kind_name)] = { fg = hl }
        highlights[("CmpItemKind%s"):format(kind_name)] = {
            fg = hl,
        }
    end
end
highlights["@neorg.todo_items.urgent.norg"] = { fg = colors.orange }
highlights["@neorg.todo_items.undone.norg"] = { link = "@markup.list.unchecked" }
highlights["@neorg.todo_items.done.norg"] = { link = "@markup.list.checked" }
highlights["@neorg.todo_items.on_hold.norg"] = { fg = colors.grey }
highlights["@neorg.todo_items.cancelled.norg"] = { fg = colors.grey_fg }
highlights["@neorg.todo_items.uncertain.norg"] = { fg = colors.purple }
highlights["@neorg.todo_items.recurring.norg"] = { fg = colors.yellow }
highlights["@neorg.todo_items.pending.norg"] = { fg = colors.blue }

highlights.TelescopeSelectionCaret = { fg = colors.blue, bg = colors.light_grey }
highlights.TelescopeSelection = { fg = colors.blue, bg = colors.light_grey }

highlights.TelescopePreviewLine = { bg = colors.light_grey }

highlights.TelescopePromptPrefix = { fg = colors.red }

if config.ui.telescope.titles == "blocks" then
    highlights.TelescopeResultsTitle = { fg = colors.black, bg = colors.blue }
    highlights.TelescopePromptTitle = { fg = colors.black, bg = colors.red }
    highlights.TelescopePreviewTitle = { fg = colors.black, bg = colors.green }
elseif config.ui.telescope.titles == "no_bg" then
end

if config.ui.telescope.borders then
    highlights.TelescopeBorder = { fg = colors.light_grey, bg = colors.black }
    highlights.TelescopePromptBorder = { fg = colors.light_grey, bg = colors.black }
    highlights.TelescopePreviewBorder = { fg = colors.light_grey, bg = colors.black }
    highlights.TelescopeResultsBorder = { fg = colors.light_grey, bg = colors.black }

    highlights.TelescopePromptNormal = { fg = colors.white }
    highlights.TelescopePreviewNormal = { bg = colors.black }

    highlights.TelescopeNormal = { bg = colors.black }
else
    highlights.TelescopeBorder = { fg = colors.tele_bg, bg = colors.tele_bg }
    highlights.TelescopePreviewBorder = { fg = colors.tele_bg, bg = colors.tele_bg }
    highlights.TelescopeResultsBorder = { fg = colors.tele_bg, bg = colors.tele_bg }
    highlights.TelescopePromptBorder = { fg = colors.tele_prompt, bg = colors.tele_prompt }

    highlights.TelescopePromptNormal = { fg = colors.white, bg = colors.tele_prompt }
    highlights.TelescopePreviewNormal = { bg = colors.tele_bg }

    highlights.TelescopeNormal = { bg = colors.tele_bg }
end

return highlights
