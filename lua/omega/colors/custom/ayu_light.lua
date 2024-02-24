local base16 = require("omega.colors.themes.ayu_light").base16
local colors = require("omega.colors.themes.ayu_light").colors
local color_utils = require("omega.utils.colors")
return {
    highlights = {
        TSField = { fg = base16.base0E },
        CmpNormal = { fg = colors.white, bg = color_utils.darken_color(colors.darker_black, 10) },
        CmpBorder = { fg = color_utils.darken_color(colors.darker_black, 10) },
        IncSearch = { bg = color_utils.blend_colors(colors.orange, colors.black, 0.75) },
        ["@tag.delimiter"] = { fg = colors.base0D },
        ["@variable.parameter"] = { fg = base16.base09 },
        ["@constructor"] = { fg = base16.base0C },
        ["@tag.attribute"] = { fg = colors.base0F },
        TelescopePreviewLine = { bg = colors.grey_fg },
    },
}
