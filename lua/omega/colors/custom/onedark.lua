local colors = require("omega.colors.themes.onedark").colors
return {
    highlights = {
        ["@tag"] = { fg = colors.blue },
        ["IndentBlanklineChar"] = { fg = colors.orange },
    },
    code = {
        [[vim.g.terminal_color_foreground = "#abb2bf"]],
    },
}
