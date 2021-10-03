Config { font = "xft:DejaVu Sans:style=Regular:size=8:antialias=true:hinting=true" 
       , additionalFonts = [ "xft:Font Awesome 5 Free Solid:pixelsize=8" 
                           , "xft:Font Awesome 5 Brands:pixelsize=8" ]
       , borderColor = "black"
       , border = TopB
       , bgColor = "#1a1b26"
       , fgColor = "#a9b1d6"
       , alpha = 255
       , position = Top -- Static { xpos = 0, ypos = 0, width = 1346, height = 20 },
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = ".xmonad/xpm/"
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Weather "EGPF" ["-t","<station>: <tempC>C",
                                          "-L","18","-H","25",
                                          "--normal","green",
                                          "--high","red",
                                          "--low","lightblue"] 36000
                    , Run Network "eth0" ["-L","0","-H","32",
                                          "--normal","green","--high","red"] 10
                    , Run Network "eth1" ["-L","0","-H","32",
                                          "--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50",
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
       , template = "<icon=haskell_20.xpm/>  %StdinReader% }\
                    \ {%cpu% | %memory% * %swap% | <fc=#ee9a00>%date%</fc>"
}

