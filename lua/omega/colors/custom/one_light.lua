local colors = require("omega.colors.themes.one_light").colors
local base16 = require("omega.colors.themes.one_light").base16

return {
    TelescopePromptPrefix = { fg = colors.white },
    TelescopeSelection = { bg = colors.one_bg, fg = colors.white },
    ["@punctuation.bracket"] = { fg = colors.nord_blue },
    FloatBorder = { fg = base16.base05 },
    DiffAdd = { fg = base16.base05 },
    Pmenu = { bg = colors.black2 },
}
