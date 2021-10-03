import XMonad
import Data.Monoid
import System.Exit 
import XMonad.Config.Desktop

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks 

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.SimplestFloat
import XMonad.Layout.NoBorders

import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W

myModMask = mod4Mask

xmobarTitleColor = "#22CCDD"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC" 

myBorderWidth = 2

myNormalBorderColor = "#acb0d0"
myFocusedBorderColor = "#7aa2f7"

myKeys :: [(String, X ())]
myKeys = 
        [ ("M-<Return>", spawn "xterm")
        , ("M-S-<Return>", windows W.swapMaster)
        , ("M-S-q", kill)
        , ("M-q", io exitSuccess) 
        , ("M-S-c", spawn "xmonad --recompile")
        , ("M-S-r", spawn "xmonad --restart")
        , ("<Print>", spawn "scrot")
        , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
        ]

myStartupHook = do
    spawnOnce "bash ~/.fehbg"
    spawnOnce "bash ~/pipewire.sh"
    spawnOnce "xbacklight -set 10"
    spawnOnce "lxsession"

tall =  spacingRaw True (Border 0 0 0 0) True (Border 5 5 5 5) True $ gaps [(U,29), (R,10), (L,10), (D,10)] $ avoidStruts $ Tall 1 (3/100) (50/100)

bsp =  spacingRaw True (Border 0 0 0 0) True (Border 5 5 5 5) True $ gaps [(U,29), (R,10), (L,10), (D,10)] $ emptyBSP

myLayoutHook = tall ||| bsp ||| noBorders Full ||| simplestFloat 

main = do 
    -- xmproc <- spawnPipe "dbus-launch xmobar ~/.config/xmobar/xmobar.hs"
    xmproc <- spawnPipe "dbus-launch xmobar -d"
    xmonad $ docks def {
                  startupHook        = myStartupHook
                , modMask            = mod4Mask
                , borderWidth        = myBorderWidth
                , normalBorderColor  = myNormalBorderColor
                , focusedBorderColor = myFocusedBorderColor
                , layoutHook         = myLayoutHook 
                , logHook = dynamicLogWithPP $
                    xmobarPP {
                              ppOutput = hPutStrLn xmproc
                            -- , ppTitle = xmobarColor "#FFFFFF" "" . shorten 100
                            -- , ppCurrent = xmobarColor "#000000" ""
                            -- , ppSep = "   "
                            }
                } `additionalKeysP` myKeys
               
