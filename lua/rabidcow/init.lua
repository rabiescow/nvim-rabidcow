local o = vim.o
local g = vim.g
local cmd = vim.cmd
local nvim_set_hl = vim.api.nvim_set_hl
local tbl_deep_extend = vim.tbl_deep_extend

---@class RabidCowConfig
---@field comments boolean
---@field keywords boolean
---@field transparent_bg boolean
---@field show_end_of_buffer boolean
---@field lualine_bg_color string?
---@field colors Palette
---@field overrides HighlightGroups | fun(colors: Palette): HighlightGroups
local DEFAULT_CONFIG = {
    italics = {comments = true, keywords = true},
    transparent_bg = false,
    show_end_of_buffer = false,
    lualine_bg_color = nil,
    colors = require("rabidcow.palette"),
    overrides = {}
}

local TRANSPARENTS = {
    "Normal", "SignColumn", "NvimTreeNormal", "NvimTreeVertSplit",
    "NeoTreeNormal", "NeoTreeNormalNC"
}

-- Selection-related highlight groups that need to be updated
local SELECTION_GROUPS = {
    {name = "CursorLine", color = "selection"},
    {name = "ColorColumn", color = "selection"},
    {name = "Visual", color = "selection"},
    {name = "VisualNOS", color = "selection"},
    {name = "PmenuSel", color = "selection"},
    {name = "TelescopeSelection", color = "selection"},
    {name = "TelescopeMultiSelection", color = "selection"},
    {name = "NvimTreeCursorLine", color = "selection"}
}

-- Snacks Picker-related highlight groups that need forced menu color updates
local SNACKS_MENU_GROUPS = {
    "SnacksPicker", "SnacksPickerNormal", "SnacksPickerBox", "SnacksPickerList",
    "SnacksPickerInput", "SnacksPickerPreview"
}

local function apply_term_colors(colors)
    g.terminal_color_0 = colors.terminal_black
    g.terminal_color_1 = colors.red
    g.terminal_color_2 = colors.teal
    g.terminal_color_3 = colors.yellow
    g.terminal_color_4 = colors.purple
    g.terminal_color_5 = colors.blue
    g.terminal_color_6 = colors.teal
    g.terminal_color_7 = colors.fg
    g.terminal_color_8 = colors.selection
    g.terminal_color_9 = colors.red
    g.terminal_color_10 = colors.teal
    g.terminal_color_11 = colors.yellow
    g.terminal_color_12 = colors.blue
    g.terminal_color_13 = colors.purple
    g.terminal_color_14 = colors.orange
    g.terminal_color_15 = colors.fg
    g.terminal_color_background = colors.bg
    g.terminal_color_foreground = colors.fg
end

--- override colors with colors
---@param groups HighlightGroups
---@param overrides HighlightGroups
---@return HighlightGroups
local function override_groups(groups, overrides)
    for group, setting in pairs(overrides) do groups[group] = setting end
    return groups
end

---apply rabidcow colorscheme
---@param configs RabidCowConfig
local function apply(configs)
    local colors = configs.colors

    apply_term_colors(colors)
    local groups = require("rabidcow.groups").setup(configs)

    -- apply transparents
    if configs.transparent_bg then
        for _, group in ipairs(TRANSPARENTS) do groups[group].bg = nil end
    end

    if type(configs.overrides) == "table" then
        groups =
            override_groups(groups, configs.overrides --[[@as HighlightGroups]] )
    elseif type(configs.overrides) == "function" then
        groups = override_groups(groups, configs.overrides(colors))
    end

    -- set defined highlights
    for group, setting in pairs(groups) do nvim_set_hl(0, group, setting) end

    -- Only force apply background color to Normal if not using transparent background
    if not configs.transparent_bg then
        vim.api.nvim_set_hl(0, "Normal", {bg = colors.bg})
    end

    -- Force apply selection color to selection-related highlight groups
    for _, group in ipairs(SELECTION_GROUPS) do
        local existing = vim.api.nvim_get_hl(0, {name = group.name})
        if existing then
            vim.api.nvim_set_hl(0, group.name, {bg = colors[group.color]})
        end
    end

    -- Force apply menu color to Snacks Picker highlight groups
    for _, group_name in ipairs(SNACKS_MENU_GROUPS) do
        local existing = vim.api.nvim_get_hl(0, {name = group_name})
        if existing then
            -- Don't set background if transparent_bg is true
            if configs.transparent_bg then
                vim.api.nvim_set_hl(0, group_name, {})
            else
                vim.api.nvim_set_hl(0, group_name, {bg = colors.bg})
            end
        end
    end
end

---@type RabidCowConfig
local user_configs = {}

--- get rabidcow configs
---@return RabidCowConfig
local function get_configs()
    local configs = DEFAULT_CONFIG
    configs = tbl_deep_extend("force", configs, user_configs)
    return configs
end

---setup rabidcow colorscheme
---@param configs RabidCowConfig?
local function setup(configs)
    if type(configs) == "table" then user_configs = configs --[[@as RabidCowConfig]] end
end

---load rabidcow colorscheme
local function load()
    if vim.fn.has("nvim-0.7") ~= 1 then
        vim.notify("nvim-rabidcow: you must use neovim 0.7 or higher")
        return
    end

    -- reset colors
    if g.colors_name then cmd("hi clear") end

    if vim.fn.exists("syntax_on") then cmd("syntax reset") end

    o.termguicolors = true
    g.colors_name = "rabidcow"

    apply(get_configs())
end

return {
    load = load,
    setup = setup,
    configs = get_configs,
    colors = function() return get_configs().colors end
}
