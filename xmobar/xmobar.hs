Config { font = "xft:Ubuntu Mono:style=Regular:size=10:antialias=true:hinting=true" 
       , additionalFonts = [ "xft:Font Awesome 5 Free Solid:pixelsize=8" 
                           , "xft:Font Awesome 5 Brands:pixelsize=8" ]
       , borderColor = "black"
       , border = TopB
       , bgColor = "#1a1b26"
       , fgColor = "#ffffff"
       , alpha = 255
       , position = Top -- Static { xpos = 0, ypos = 0, width = 1346, height = 20 },
       , textOffset = -3
       , iconOffset = -2
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = ".xmonad/xpm/"
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Cpu ["-L","3","-H","50",
                               "--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run Com "echo" ["<fn=2>\xf17c</fn>"] "penguin" 3600
                    , Run Com "uname" ["-s","-r"] "" 36000
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " <icon=haskell_20.xpm/> %StdinReader% }\
                    \ {<fc=#f7768e>%cpu%</fc> | <fc=#7aa2f7>%memory% * %swap%</fc> | <fc=#9a7ecc>%date%</fc> "
}

