local theme = require("omega.colors.themes.doom_one")
local color_utils = require("omega.utils.colors")
local config = require("omega.config")
vim.g.terminal_color_4 = "#51afef"
vim.g.terminal_color_12 = "#51afef"

local highlights = {
    WarningMsg = { fg = theme.colors.white },
    ErrorMsg = { fg = theme.colors.white },
    ["@punctuation.bracket"] = { fg = theme.colors.blue },
    ["@field"] = { fg = theme.colors.pink },
    ["@function.call"] = { fg = theme.colors.purple },
    ["@function.builtin"] = { fg = color_utils.lighten_color(theme.colors.pink, 0.4) },
}

local kind_highlights = {
    Function = theme.colors.orange,
    Event = theme.colors.orange,
}
if config.ui.cmp.icons == "blended" then
    for kind_name, hl in pairs(kind_highlights) do
        highlights[("CmpItemKind%s"):format(kind_name)] = {
            fg = hl,
            bg = color_utils.blend_colors(hl, theme.base16.base00, 0.15),
        }
        highlights[("CmpItemKindMenu%s"):format(kind_name)] = { fg = hl }
        highlights[("CmpItemKindBlock%s"):format(kind_name)] =
            { fg = color_utils.blend_colors(hl, theme.base16.base00, 0.15) }
    end
elseif config.ui.cmp.icons == "fg_colored" then
    for kind_name, hl in pairs(kind_highlights) do
        highlights[("CmpItemKindMenu%s"):format(kind_name)] = { fg = hl }
        highlights[("CmpItemKind%s"):format(kind_name)] = {
            fg = hl,
        }
    end
end

return highlights
