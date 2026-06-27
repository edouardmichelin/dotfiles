hl.monitor({
   output = "",
   mode = "preferred",
   position = "auto",
   scale = 1
})

local terminal    = "kitty"
local fileManager = "nnn"
local web_browser = "firefox"
local menu        = "wofi"
local lock_screen = "hyprlock"

-- exec-once = waybar & hyprpaper & dunst # & fcitx5
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar & hyprpaper & dunst")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 6,

        border_size = 2,

        col = {
            active_border   = "rgba(11111bff)",
            inactive_border = "rgba(11111bda)",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 5,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.95,

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("myBezier",       { type = "bezier", points = { {0.16, 1},    {0.3, 1}     } })
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

--    animation = windows, 1, 7, myBezier
--    animation = windowsOut, 1, 7, myBezier, popin 80%
--    animation = border, 1, 10, myBezier
--    animation = fade, 1, 7, myBezier
--    animation = workspaces, 1, 5, default

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 10, bezier = "myBezier" })

hl.animation({ leaf = "windows",       enabled = true,  speed = 7,    bezier = "myBezier" })
-- hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 7, bezier = "myBezier",       style = "popin 80%" })

-- hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 7, bezier = "myBezier" })

hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })

hl.animation({ leaf = "workspaces",    enabled = true,  speed = 5, bezier = "easeOutQuint"})
-- hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


hl.config({
    dwindle = {
        preserve_split = true,
        force_split = 2
    },
})


hl.gesture({
   fingers = 3,
   direction = "horizontal",
   action = "workspace"
})

hl.config({
   misc = {
      disable_hyprland_logo = true,
      disable_splash_rendering = true
   }
})

hl.config ({
   ecosystem = {
     no_update_news = true
   }
})

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0.05,

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
   name = "rofi",
   match = { class = "^(Rofi)$" },
   float = false,
   border_size = 0
})

hl.window_rule({
   name = "sfml",
   match = { title = "^(sfml)$" },
   float = true,
   center = true
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(lock_screen))
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(web_browser))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd(web_browser .. " --private-window"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("kitty --hold python"))

-- Reorganize layout
hl.bind(mainMod .. " + A", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ G", hl.dsp.window.float({ action = "toggle" }))


-- Change focused window
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim ~/Pictures/screenshots/$(date '+%Y-%m-%d-%H:%M:%S').png"))

for i = 1, 10 do
   local key = i % 10
   hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
   hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end


-- Resize current window
hl.bind("ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
end)


-- Drag window
hl.config({
    binds = {
        -- Fire a drag event only after dragging for more than 10px
        drag_threshold = 10
    }
})
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })


-- Wifi + Bluetooh control
hl.bind("xf86wlan", hl.dsp.exec_cmd("bluetoothctl power off; iwctl adapter phy0 set-property Powered off"))
hl.bind(mainMod .. " + xf86wlan", hl.dsp.exec_cmd("bluetoothctl power on; iwctl adapter phy0 set-property Powered on"))

-- volume control
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd("pamixer -i 5"))
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd("pamixer -d 5"))
hl.bind("xf86audiomute",        hl.dsp.exec_cmd("pamixer -t"))

-- brightness control
hl.bind("xf86monbrightnessup",   hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("xf86monbrightnessdown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- Lock on closing lid
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd(lock_screen), { locked = true })

-- Do Not Disturb
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("notify-send -i /home/edouard/Pictures/icons/dnd.png '  Do Not Disturb' 'Turning on Do Not Disturb Mode' && sleep 2 && dunstctl set-paused true"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("dunstctl set-paused false && notify-send -i /home/edouard/Pictures/icons/dnd.png '  Do Not Disturb' 'Do Not Disturb Mode disabled'"))
