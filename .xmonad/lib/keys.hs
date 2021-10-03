module keys where

myKeys :: [(String, X ())]
myKeys = 
        [ ("M-<Return>", spawn "xterm")

        , ("M-C-c", spawn "xmonad --recompile")
        , ("M-C-r", spawn "xmonad --restart")
        , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
        ]

