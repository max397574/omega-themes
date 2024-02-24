local colorscheme_generator = {}
local utils = require("omega.utils.colors")

local function preview_theme(theme)
    local lines = { "return {", '    bg = "' .. theme.bg .. '",', "    base16 = {" }
    for name, color in pairs(theme.base16) do
        table.insert(lines, "        " .. name .. " = " .. '"' .. color .. '",')
    end
    table.insert(lines, "    " .. "},")
    table.insert(lines, "    colors = {")
    for name, color in pairs(theme.colors) do
        table.insert(lines, "        " .. name .. " = " .. '"' .. color .. '",')
    end
    table.insert(lines, "    }")
    table.insert(lines, "}")
    local path =
        vim.fs.joinpath(vim.fn.fnamemodify(debug.getinfo(2, "S").source:sub(2), ":h:h"), "themes", theme.name .. ".lua")
    local file = io.open(path, "w")
    if not file then
        return
    end
    vim.print(table.concat(lines, "\n"))
    file:write(table.concat(lines, "\n"))
    file:close()
    vim.cmd.NewTheme(theme.name)
end

function colorscheme_generator.generate_scheme()
    local scheme = {
        name = "",
        bg = "dark",
        base16 = {
            base00 = "#5C6166",
            base01 = "#5C6166",
            base02 = "#5C6166",
            base03 = "#5C6166",
            base04 = "#5C6166",
            base05 = "#5C6166",
            base06 = "#5C6166",
            base07 = "#f0f0f0",
            base08 = "#f0f0f0",
            base09 = "#f0f0f0",
            base0A = "#f0f0f0",
            base0B = "#f0f0f0",
            base0C = "#f0f0f0",
            base0D = "#f0f0f0",
            base0E = "#f0f0f0",
            base0F = "#f0f0f0",
        },
        colors = {
            white = "#f0f0f0",
            darker_black = "#5C6166",
            black = "#5C6166",
            black2 = "#5C6166",
            one_bg = "#5C6166",
            one_bg2 = "#5C6166",
            one_bg3 = "#5C6166",
            telescope_prompt = "#f0f0f0",
            grey = "#f0f0f0",
            grey_fg = "#f0f0f0",
            grey_fg2 = "#f0f0f0",
            light_grey = "#f0f0f0",
            red = "#f0f0f0",
            baby_pink = "#f0f0f0",
            pink = "#f0f0f0",
            line = "#f0f0f0",
            green = "#f0f0f0",
            dark_green = "#f0f0f0",
            vibrant_green = "#f0f0f0",
            blue = "#f0f0f0",
            dark_blue = "#f0f0f0",
            nord_blue = "#f0f0f0",
            yellow = "#f0f0f0",
            sun = "#f0f0f0",
            purple = "#f0f0f0",
            dark_purple = "#f0f0f0",
            teal = "#f0f0f0",
            orange = "#f0f0f0",
            cyan = "#f0f0f0",
            statusline_bg = "#f0f0f0",
            lightbg = "#f0f0f0",
            pmenu_bg = "#f0f0f0",
            folder_bg = "#f0f0f0",
        },
    }

    -- preview_theme(scheme)
    -- if true then
    --     return
    -- end

    scheme.name = vim.fn.input("Name> ")
    vim.ui.select({ "dark", "light" }, { prompt = "Background" }, function(item)
        scheme.bg = item
    end)
    scheme.colors.white = vim.fn.input("White> ")
    scheme.colors.black = vim.fn.input("Background> ")
    scheme.colors.darker_black = utils.darken_color(scheme.colors.black, 6)
    scheme.colors.black2 = utils.lighten_color(scheme.colors.black, 6)
    scheme.colors.one_bg = utils.lighten_color(scheme.colors.black, 10)
    scheme.colors.one_bg2 = utils.lighten_color(scheme.colors.black, 19)
    scheme.colors.one_bg3 = utils.lighten_color(scheme.colors.black, 27)
    scheme.colors.grey = utils.lighten_color(scheme.colors.black, 40)
    scheme.colors.grey_fg = utils.lighten_color(scheme.colors.grey, 10)
    scheme.colors.grey_fg2 = utils.lighten_color(scheme.colors.grey, 20)
    scheme.colors.light_grey = utils.lighten_color(scheme.colors.grey, 28)
    scheme.colors.red = vim.fn.input("Red> ")
    scheme.colors.baby_pink = utils.lighten_color(scheme.colors.red, 15)
    scheme.colors.pink = vim.fn.input("Pink> ")
    scheme.colors.purple = vim.fn.input("Purple> ")
    scheme.colors.dark_purple = utils.darken_color(scheme.colors.purple, 25)
    scheme.colors.line = utils.lighten_color(scheme.colors.black, 15)
    scheme.colors.green = vim.fn.input("Green> ")
    scheme.colors.dark_green = utils.darken_color(scheme.colors.green, 25)
    scheme.colors.vibrant_green = vim.fn.input("Vibrant Green> ")
    scheme.colors.blue = vim.fn.input("Blue> ")
    scheme.colors.orange = vim.fn.input("Orange> ")
    scheme.colors.teal = vim.fn.input("Teal> ")
    scheme.colors.cyan = vim.fn.input("Cyan> ")
    scheme.colors.dark_blue = utils.darken_color(scheme.colors.blue, 25)
    scheme.colors.nord_blue = utils.darken_color(scheme.colors.blue, 13)
    scheme.colors.yellow = vim.fn.input("Yellow> ")
    scheme.colors.sun = utils.lighten_color(scheme.colors.yellow, 8)
    scheme.colors.statusline_bg = utils.lighten_color(scheme.colors.black, 4)
    scheme.colors.lightbg = utils.lighten_color(scheme.colors.statusline_bg, 13)
    scheme.colors.lightbg2 = utils.lighten_color(scheme.colors.statusline_bg, 7)
    scheme.colors.pmenu_bg = scheme.colors.darker_black
    scheme.colors.folder_bg = scheme.colors.blue

    scheme.base16.base00 = scheme.colors.black
    scheme.base16.base01 = vim.fn.input("Cursorline> ")
    scheme.base16.base02 = vim.fn.input("Selection Background> ")
    scheme.base16.base03 = vim.fn.input("Comment> ")
    scheme.base16.base04 = vim.fn.input("Statusline> ")
    scheme.base16.base05 = scheme.colors.white
    scheme.base16.base06 = scheme.base16.base05
    scheme.base16.base07 = vim.fn.input("Light Background> ")
    scheme.base16.base08 = vim.fn.input("Error, DiffDelete> ")
    scheme.base16.base09 = vim.fn.input("Const, Number, Bool> ")
    scheme.base16.base0A = vim.fn.input("Tag, Type> ")
    scheme.base16.base0B = vim.fn.input("String> ")
    scheme.base16.base0C = vim.fn.input("Special> ")
    scheme.base16.base0D = vim.fn.input("Functions, Methods> ")
    scheme.base16.base0E = vim.fn.input("Keyword> ")
    scheme.base16.base0F = vim.fn.input("Delimiter> ")
    preview_theme(scheme)
end

return colorscheme_generator
