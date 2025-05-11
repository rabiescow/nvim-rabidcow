---@class Palette
---@field bg string
---@field fg string
---@field line_nr string
---@field active_line_nr string
---@field comment string
---@field selection string
---@field selection_highlight string
---@field word_highlight string
---@field black string
---@field dark_yellow string
---@field yellow string
---@field bright_yellow string
---@field dark_red string
---@field red string
---@field bright_red string
---@field dark_orange string
---@field orange string
---@field orange_2 string
---@field bright_orange string
---@field dark_purple string
---@field purple string
---@field bright_purple string
---@field blue string
---@field dark_blue string
---@field pink string
---@field gray string
---@field dark_gray string
---@field bright_teal string
---@field teal string
---@field dark_teal string
---@field bracket string
---@field diff_add_bg string
---@field diff_del_bg string
---@field warning string
---@field error string
---@field hint string
---@field info string
---@field ok string
---@field inlay_hint string
---@field code_lens string
---@field sidebar_bg string
---@field sidebar_fg string
---@field quick_input_bg string
---@field quick_input_fg string
---@field quick_input_focus string
---@field bracket_1 string
---@field bracket_2 string
---@field bracket_3 string
---@field bracket_4 string
---@field bracket_5 string
---@field bracket_6 string
---@field bracket_unexpected string
---@field terminal_black string
---@field terminal_red string
---@field terminal_green string
---@field terminal_yellow string
---@field terminal_blue string
---@field terminal_magenta string
---@field terminal_cyan string
---@field terminal_white string
return {
    -- Base colors
    bg = "#0B0B0F", -- Main editor background
    fg = "#E6E6E6", -- Default text color

    -- Editor UI
    line_nr = "#32333B", -- Line number color
    active_line_nr = "#E6E6E6", -- Active line number color
    comment = "#565665", -- Comments
    selection = "#2C2C31", -- Selection background
    selection_highlight = "#1A1A1F", -- Selection highlight background
    word_highlight = "#2C2C31", -- Word highlight background

    -- Syntax colors
    black = "#080808",
    dark_yellow = "#A6A778",
    yellow = "#E6E7A3", -- Light yellow for functions, etc.
    bright_yellow = "#F6F673",
    dark_red = "#B62F68",
    red = "#D84F68", -- Red for errors and deleted content
    bright_red = "#E83F48",
    dark_orange = "#A9792C",
    orange = "#F9A959", -- Peachy color for numbers and constants
    orange_2 = "#F9B98C", -- Peachy color for numbers and constants
    bright_orange = "#F9D98C",
    dark_purple = "#4542A4",
    purple = "#9592D4", -- Muted purple
    bright_purple = "#C5B2F4",

    blue = "#479FFA", -- Bright blue for links
    dark_blue = "#377FBA",
    gray = "#9099A1", -- Grayish for keywords
    pink = "#F178A9",
    bright_teal = "#95F2E5",
    teal = "#54C0A3", -- Teal for attributes
    dark_teal = "#128065",

    bracket = "#5C6974", -- Dark gray for brackets

    -- UI elements
    dark_gray = "#2C2C31", -- For input background

    -- Diff colors
    diff_add_bg = "#1A1A1F", -- Background for added text in diffs
    diff_del_bg = "#2C1A1A", -- Background for removed text in diffs

    -- Diagnostic colors
    warning = "#F9A959", -- Warning color
    error = "#FF5C5C", -- Error color
    hint = "#4EBE96", -- Hint color
    info = "#6A7782", -- Info color
    ok = "#C2C2C2", -- Ok color

    -- LSP colors
    inlay_hint = "#6A77AA",
    code_lens = "#6A77AA",

    -- Sidebar elements
    sidebar_bg = "#0B0B0F", -- Sidebar background
    sidebar_fg = "#C1C1C1", -- Sidebar text color
    sidebar_title = "#9592A4", -- Sidebar title color

    -- List elements
    list_active = "#232323", -- List active selection background
    list_inactive = "#232323", -- List inactive selection background
    list_hover = "#1A1A1F", -- List hover background

    -- Input elements
    input_bg = "#2C2C31", -- Input background
    input_fg = "#E6E6E6", -- Input text color

    -- Hover elements
    hover_bg = "#161616", -- Hover widget background
    hover_border = "#282828", -- Hover widget border

    -- Scrollbar
    scrollbar_bg = "#343434", -- Scrollbar background (adjusted from #34343480)
    scrollbar_hover = "#343434", -- Scrollbar hover background

    -- Quick input
    quick_input_bg = "#2C2C31", -- Quick input background
    quick_input_fg = "#C1C1C1", -- Quick input text
    quick_input_focus = "#1A1A1F", -- Quick input focus background
    description_fg = "#C1C1C1", -- Description text color

    -- Bracket colors
    bracket_1 = "#5C6974", -- Bracket pair color 1
    bracket_2 = "#6E678E", -- Bracket pair color 2
    bracket_3 = "#6A7782", -- Bracket pair color 3
    bracket_4 = "#6A7782", -- Bracket pair color 4
    bracket_5 = "#6A7782", -- Bracket pair color 5
    bracket_6 = "#6A7782", -- Bracket pair color 6
    bracket_unexpected = "#6A7782", -- Unexpected bracket color

    -- Terminal colors
    terminal_black = "#080808",
    terminal_red = "#D84F68",
    terminal_green = "#54C0A3",
    terminal_yellow = "#E6E7A3",
    terminal_blue = "#479FFA",
    terminal_magenta = "#9592D4",
    terminal_cyan = "#F9A959",
    terminal_white = "#E6E6E6"
}
