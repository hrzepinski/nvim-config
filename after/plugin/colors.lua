function ColorMyPencils(color)
    color = color or 'onedark'
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require('onedark').setup {
    style = 'darker',
    transparent = true,
    diagnostics = {
        darker = false,    -- darker colors for diagnostic
        undercurl = true,  -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
}
require('onedark').load()
ColorMyPencils()
