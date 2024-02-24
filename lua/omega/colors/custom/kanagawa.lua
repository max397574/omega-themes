local theme = require("omega.colors.themes.kanagawa")
return {
    highlights = {
        ["@variable.member"] = { fg = theme.colors.yellow },
        ["@keyword.return"] = { fg = "#ff5d62" },
    },
}
