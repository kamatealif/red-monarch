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
          fg     = "#F0E0E6",
          border = "#5E1C24",

          glow_red  = "#FF3D61",
          hot_red   = "#FF1F4C",
          mid_red   = "#D9263E",
          deep_red  = "#7E222D",
          dark_red  = "#5E1C24",
          abyss_red = "#3E161B",

          light_red = "#FF99A1",
          blush_red = "#FF7A8C",
          pale_red  = "#FFB8B7",

          subtle    = "#9E2836",
          cursor    = "#FF1F4C",

          -- 🩸 Shaded selection (muted, not loud)
          selection = "#4A1A21",
        }

        local function set(g, o)
          vim.api.nvim_set_hl(0, g, o)
        end

        vim.cmd("highlight clear")
        local P = { bg = colors.panel }

        -- ── Core ───────────────────────────────────
        set("Normal",   vim.tbl_extend("force", { fg = colors.fg }, P))
        set("NormalNC", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("SignColumn", vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("LineNr",     vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("CursorLine", { bg = colors.abyss_red })

        set("Cursor",   { fg = colors.panel, bg = colors.cursor })
        set("CursorIM", { fg = colors.panel, bg = colors.cursor })

        -- ── Floats / Menus ─────────────────────────
        set("NormalFloat", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("FloatBorder", { fg = colors.border, bg = colors.panel })
        set("Pmenu",       { fg = colors.fg, bg = colors.abyss_red })
        set("PmenuSel",    { fg = colors.panel, bg = colors.hot_red, bold = true })

        -- ── Status / Tabs ──────────────────────────
        set("StatusLine",   { fg = colors.fg, bg = colors.abyss_red })
        set("StatusLineNC", { fg = colors.subtle, bg = colors.panel })
        set("TabLine",      { fg = colors.subtle, bg = colors.panel })
        set("TabLineSel",   { fg = colors.panel, bg = colors.mid_red, bold = true })

        -- ── Separators ─────────────────────────────
        set("WinSeparator", { fg = colors.border, bg = colors.panel })
        set("VertSplit",    { fg = colors.border, bg = colors.panel })

        -- ── Selection (SHADED) ─────────────────────
        set("Visual",    { bg = colors.selection })
        set("VisualNOS", { bg = colors.selection })

        -- ── Syntax ─────────────────────────────────
        set("Comment",    { fg = colors.subtle, italic = true })

        -- 🔴 Functions & Keywords
        set("Function",   { fg = colors.glow_red, bold = true })
        set("Keyword",    { fg = colors.hot_red, bold = true })
        set("Statement",  { fg = colors.hot_red, bold = true })

        -- 🩸 Variables → light red
        set("Identifier", { fg = colors.light_red })
        set("Variable",   { fg = colors.light_red })

        set("String",   { fg = colors.blush_red })
        set("Number",   { fg = colors.pale_red })
        set("Boolean",  { fg = colors.hot_red, bold = true })
        set("Operator", { fg = colors.light_red })
        set("Type",     { fg = colors.pale_red, italic = true })
        set("Constant", { fg = colors.mid_red })
        set("Title",    { fg = colors.glow_red, bold = true })

        -- ── Diagnostics ────────────────────────────
        set("DiagnosticError", { fg = colors.hot_red })
        set("DiagnosticWarn",  { fg = colors.mid_red })
        set("DiagnosticInfo",  { fg = colors.pale_red })
        set("DiagnosticHint",  { fg = colors.light_red })

        set("DiagnosticUnderlineError", { undercurl = true, sp = colors.hot_red })
        set("DiagnosticUnderlineWarn",  { undercurl = true, sp = colors.mid_red })

        -- ── Treesitter ─────────────────────────────
        set("@function",         { link = "Function" })
        set("@function.builtin", { fg = colors.hot_red, bold = true })

        set("@keyword",          { link = "Keyword" })
        set("@keyword.function", { link = "Keyword" })

        set("@variable",         { fg = colors.light_red })
        set("@variable.builtin", { fg = colors.hot_red, italic = true })

        set("@parameter",        { fg = colors.blush_red, italic = true })
        set("@type.builtin",     { fg = colors.pale_red, bold = true })

        -- ── Search ─────────────────────────────────
        set("Search",     { fg = colors.panel, bg = colors.mid_red })
        set("IncSearch",  { fg = colors.panel, bg = colors.hot_red, bold = true })
        set("MatchParen", { fg = colors.panel, bg = colors.blush_red, bold = true })

        -- ── Enforce panel consistency ──────────────
        local function enforce_panel()
          set("Normal",      { fg = colors.fg, bg = colors.panel })
          set("NormalNC",    { fg = colors.fg, bg = colors.panel })
          set("NormalFloat", { fg = colors.fg, bg = colors.panel })
          set("StatusLine",  { fg = colors.fg, bg = colors.panel })
          set("TabLine",     { fg = colors.subtle, bg = colors.panel })
        end

        vim.api.nvim_create_autocmd({ "UIEnter", "VimEnter", "ColorScheme" }, {
          callback = function() vim.schedule(enforce_panel) end,
        })
      end,
    },
  },
}

return M
