-- Red Monarch Neovim theme (LazyVim override)
-- Shaded selection, red-driven syntax hierarchy

local M = {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.o.termguicolors = true
        vim.o.winblend = 0
        vim.o.pumblend = 0

        local colors = {
          panel  = "NONE",
          fg     = "#EDEDED",
          border = "#BF1111",

          glow_red  = "#BF1111",
          hot_red   = "#BF1111",
          mid_red   = "#8A1A1A",
          deep_red  = "#8A1A1A",
          dark_red  = "#8A1A1A",
          abyss_red = "#8A1A1A",

          light_red = "#BF1111",
          blush_red = "#BF1111",
          pale_red  = "#EDEDED",

          subtle    = "#7A6F73",
          cursor    = "#BF1111",

          -- 🩸 Shaded selection (muted, not loud)
          selection = "#32292C",
        }

        local function set(g, o)
          vim.api.nvim_set_hl(0, g, o)
        end

        vim.cmd("highlight clear")
        local P = { bg = colors.panel }

        -- Core/editor
        set("Normal",       vim.tbl_extend("force", { fg = colors.fg }, P))
        set("NormalNC",     vim.tbl_extend("force", { fg = colors.fg }, P))
        set("SignColumn",   vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("FoldColumn",   vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("LineNr",       vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("CursorLine",   { bg = colors.selection })
        set("CursorColumn", { bg = colors.selection })

        set("Cursor",   { fg = colors.panel, bg = colors.cursor })
        set("CursorIM", { fg = colors.panel, bg = colors.cursor })

        -- Floats / menus
        set("NormalFloat",  vim.tbl_extend("force", { fg = colors.fg }, P))
        set("FloatBorder",  { fg = colors.border, bg = colors.panel })
        set("Pmenu",        vim.tbl_extend("force", { fg = colors.fg }, { bg = colors.selection }))
        set("PmenuSel",     { fg = colors.panel, bg = colors.hot_red, bold = true })
        set("PmenuSbar",    { bg = colors.subtle })
        set("PmenuThumb",   { bg = colors.mid_red })

        -- Statusline / tabs
        set("StatusLine",   vim.tbl_extend("force", { fg = colors.fg }, { bg = colors.selection }))
        set("StatusLineNC", vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("TabLine",      vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("TabLineFill",  P)
        set("TabLineSel",   { fg = colors.panel, bg = colors.mid_red, bold = true })

        -- Window separators
        set("WinSeparator", { fg = colors.border, bg = colors.panel })
        set("VertSplit",    { fg = colors.border, bg = colors.panel })

        -- Selections / folds
        set("Visual",    { bg = colors.selection, fg = colors.fg })
        set("VisualNOS", { bg = colors.selection })
        set("Folded",    vim.tbl_extend("force", { fg = colors.subtle, italic = true }, P))

        -- Syntax
        set("Comment",    { fg = colors.subtle, italic = true })
        
        -- Dark red for specific elements only
        set("Keyword",    { fg = "#BF1111", bold = false })
        set("Function",   { fg = "#BF1111", bold = false })
        set("Operator",   { fg = "#BF1111" })
        set("Delimiter",  { fg = "#BF1111" })
        
        -- Everything else in subtle grays
        set("Constant",   { fg = colors.fg })
        set("String",     { fg = colors.fg })
        set("Character",  { fg = colors.fg })
        set("Number",     { fg = colors.fg })
        set("Boolean",    { fg = colors.fg })
        set("Float",      { fg = colors.fg })
        set("Identifier", { fg = colors.fg })
        set("Statement",  { fg = colors.fg })
        set("Conditional",{ fg = colors.fg })
        set("Repeat",     { fg = colors.fg })
        set("Label",      { fg = colors.fg })
        set("Exception",  { fg = colors.fg })
        set("PreProc",    { fg = colors.fg })
        set("Include",    { fg = colors.fg })
        set("Macro",      { fg = colors.fg })
        set("Type",       { fg = colors.fg })
        set("StorageClass",{ fg = colors.fg })
        set("Structure",  { fg = colors.fg })
        set("Typedef",    { fg = colors.fg })
        set("Special",    { fg = colors.fg })
        set("SpecialChar",{ fg = colors.fg })
        set("Tag",        { fg = colors.fg })
        set("Debug",      { fg = colors.fg })
        set("Title",      { fg = colors.fg, bold = true })
        set("Directory",  { fg = colors.fg })

        -- Diagnostics
        set("DiagnosticError", { fg = colors.hot_red,   bg = colors.panel })
        set("DiagnosticWarn",  { fg = colors.mid_red,  bg = colors.panel })
        set("DiagnosticInfo",  { fg = colors.pale_red,  bg = colors.panel })
        set("DiagnosticHint",  { fg = colors.light_red, bg = colors.panel })
        set("DiagnosticUnderlineError", { undercurl = true, sp = colors.hot_red })
        set("DiagnosticUnderlineWarn",  { undercurl = true, sp = colors.mid_red })
        set("DiagnosticUnderlineInfo",  { undercurl = true, sp = colors.pale_red })
        set("DiagnosticUnderlineHint",  { undercurl = true, sp = colors.light_red })

        -- Treesitter links
        set("@text",               { link = "Normal" })
        set("@comment",            { link = "Comment" })
        set("@constant",           { link = "Constant" })
        set("@constant.builtin",   { link = "Constant" })
        set("@string",             { link = "String" })
        set("@character",          { link = "Character" })
        set("@number",             { link = "Number" })
        set("@boolean",            { link = "Boolean" })
        set("@float",              { link = "Float" })
        set("@function",           { link = "Function" })
        set("@function.builtin",   { link = "Function" })
        set("@method",             { link = "Function" })
        set("@keyword",            { link = "Keyword" })
        set("@keyword.function",   { link = "Keyword" })
        set("@keyword.operator",   { link = "Operator" })
        set("@type.builtin",       { link = "Type" })
        set("@variable",           { link = "Identifier" })
        set("@variable.builtin",   { link = "Identifier" })
        set("@parameter",          { link = "Identifier" })
        set("@tag.attribute",      { link = "Identifier" })
        set("@constructor",        { link = "Identifier" })
        set("@namespace",          { link = "Identifier" })
        set("@text.uri",           { link = "Identifier" })
        set("@text.todo",          { fg = colors.panel, bg = colors.subtle, bold = true })

        -- Search (Red Monarch style)
        set("Search",     { fg = colors.panel, bg = colors.mid_red })
        set("IncSearch",  { fg = colors.panel, bg = colors.hot_red, bold = true })
        pcall(set, "CurSearch", { fg = colors.panel, bg = colors.hot_red, bold = true })
        set("Substitute", { fg = colors.panel, bg = colors.deep_red, bold = true })
        set("MatchParen", { fg = colors.panel, bg = colors.blush_red, bold = true })
        pcall(set, "HlSearchNear",     { fg = colors.panel, bg = colors.deep_red })
        pcall(set, "HlSearchLens",     { fg = colors.panel, bg = colors.mid_red })
        pcall(set, "HlSearchLensNear", { fg = colors.panel, bg = colors.mid_red })

        -- Enforce background consistency
        local function enforce_panel()
          set("Normal",       { fg = colors.fg, bg = colors.panel })
          set("NormalNC",     { fg = colors.fg, bg = colors.panel })
          set("NormalFloat",  { fg = colors.fg, bg = colors.panel })
          set("StatusLine",   { fg = colors.fg, bg = colors.selection })
          set("TabLine",      { fg = colors.subtle, bg = colors.panel })
          set("AlphaNormal",  { fg = colors.fg, bg = colors.panel })
        end

        vim.api.nvim_create_autocmd({ "UIEnter", "VimEnter", "ColorScheme" }, {
          callback = function() vim.schedule(enforce_panel) end,
        })
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function() vim.schedule(enforce_panel) end,
        })
      end,
    },
  },
}

return M
