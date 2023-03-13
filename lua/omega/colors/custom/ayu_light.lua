local base16 = require("omega.colors.themes.ayu_light").base16
local colors = require("omega.colors.themes.ayu_light").colors
return {
    highlights = {
        TSField = { fg = base16.base0E },
        PmenuSel = { fg = colors.white, bg = M.base_30.pmenu_bg },
        ["@tag.delimiter"] = { fg = colors.base0D },
        ["@parameter"] = { fg = base16.base09 },
        ["@constructor"] = { fg = base16.base0C },
        ["@tag.attribute"] = { fg = colors.base0F },
    },
}
