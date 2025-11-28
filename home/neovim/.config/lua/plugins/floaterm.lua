return{
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts =  {
        border = true,
        size = { h = 65, w = 70 },

        -- to use, make this func(buf)
        mappings = { sidebar = nil, term = nil},

        -- Default sets of terminals you'd like to open
        terminals = {
        { name = "Terminal" },
        { name = "Lazygit", cmd = "lazygit" },
        { name = "Cargo Build", cmd = "cargo build" },
        { name = "Btop", cmd = "btop" },
        -- More terminals
        },
    },
    cmd = "FloatermToggle",
}          
