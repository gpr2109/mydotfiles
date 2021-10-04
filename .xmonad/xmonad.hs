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

import XMonad.Actions.FloatSnap
import XMonad.Actions.FloatKeys

import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W

myModMask = mod4Mask

myBorderWidth = 0

myNormalBorderColor = "#acb0d0"
myFocusedBorderColor = "#7aa2f7"

myManageHook = composeAll
    [ className =? "vlc"        --> doFloat ] 

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
        , ("M-d", withFocused (keysMoveWindowTo (683,384) (0.5,0.5)))

        , ("M-M1-<Up>", withFocused (keysMoveWindow (0,-5)))
        , ("M-M1-<Right>", withFocused (keysMoveWindow (5,0)))
        , ("M-M1-<Down>", withFocused (keysMoveWindow (0,5)))
        , ("M-M1-<Left>", withFocused (keysMoveWindow (-5,0)))

        , ("M-S-<Up>", withFocused (keysResizeWindow (0,10) (0.5,0.5)))
        , ("M-S-<Right>", withFocused (keysResizeWindow (10,0) (0.5,0.5)))
        , ("M-S-<Down>", withFocused (keysResizeWindow (0,-10) (0.5,0.5)))
        , ("M-S-<Left>", withFocused (keysResizeWindow (-10,0) (0.5,0.5)))
        ]

myStartupHook = do
    spawnOnce "hsetroot -solid '#7aa2f7' &"
    spawnOnce "bash ~/pipewire.sh &"
    spawnOnce "picom &"
    spawnOnce "xbacklight -set 10 &" 

tall =  spacingRaw True (Border 0 0 0 0) True (Border 5 5 5 5) True $ gaps [(U,29), (R,10), (L,10), (D,10)] $ avoidStruts $ Tall 1 (3/100) (50/100)

bsp =  spacingRaw True (Border 0 0 0 0) True (Border 5 5 5 5) True $ gaps [(U,29), (R,10), (L,10), (D,10)] $ emptyBSP

myLayoutHook = tall ||| noBorders tall |||  bsp ||| noBorders Full ||| simplestFloat 

main = do  
    xmproc <- spawnPipe "dbus-launch xmobar -d"
    xmonad $ docks def {
                  startupHook        = myStartupHook
                , modMask            = mod4Mask
                , borderWidth        = myBorderWidth
                , normalBorderColor  = myNormalBorderColor
                , focusedBorderColor = myFocusedBorderColor
                , layoutHook         = myLayoutHook
                , manageHook         = myManageHook 
                , logHook            = dynamicLogWithPP $
                    xmobarPP {
                              ppOutput = hPutStrLn xmproc
                             , ppTitle = xmobarColor "#FFFFFF" "" . shorten 100
                             , ppCurrent = xmobarColor "#7aa2f7" ""
                             , ppSep = "   "
                             , ppOrder  = \(ws : l : _ : _ ) -> [ws,l]
                            }
                } `additionalKeysP` myKeys
               
