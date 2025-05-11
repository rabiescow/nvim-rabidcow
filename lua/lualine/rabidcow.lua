local rabidcow = require("rabidcow")
local configs = rabidcow.configs()
local colors = rabidcow.colors()

local bg = configs.lualine_bg_color or colors.bg

local normal = {
    a = {fg = colors.bg, bg = colors.purple, gui = 'bold'},
    b = {fg = colors.purple, bg = bg},
    c = {fg = colors.fg, bg = bg}
}

local command = {
    a = {fg = colors.bg, bg = colors.teal, gui = 'bold'},
    b = {fg = colors.teal, bg = bg}
}

local visual = {
    a = {fg = colors.bg, bg = colors.blue, gui = 'bold'},
    b = {fg = colors.blue, bg = bg}
}

local inactive = {
    a = {fg = colors.fg, bg = colors.selection, gui = 'bold'},
    b = {fg = colors.bg, bg = colors.fg}
}

local replace = {
    a = {fg = colors.bg, bg = colors.teal, gui = 'bold'},
    b = {fg = colors.teal, bg = bg},
    c = {fg = colors.fg, bg = bg}
}

local insert = {
    a = {fg = colors.bg, bg = colors.yellow, gui = 'bold'},
    b = {fg = colors.yellow, bg = bg},
    c = {fg = colors.fg, bg = bg}
}

return {
    normal = normal,
    command = command,
    visual = visual,
    inactive = inactive,
    replace = replace,
    insert = insert
}
