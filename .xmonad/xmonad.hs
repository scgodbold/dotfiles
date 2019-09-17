-- default desktop configuration for Fedora

import qualified Data.Map as M
import System.IO
import System.Exit

import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog   -- Create a top bar with dynamic messages
import XMonad.Hooks.FadeWindows  -- Attempting Opacity
import XMonad.Hooks.ManageDocks  -- Avoid Xmobar
import XMonad.Hooks.ManageHelpers  -- (isDialog)
import XMonad.Layout.Spacing  -- Creating Gaps
import XMonad.Util.Run(safeSpawn, spawnPipe)
import qualified XMonad.StackSet as W

-- Declare some basic defaults
myTerm = "/usr/local/bin/alacritty"
myLauncher = "dmenu_run"
myLocker = "slock"
myBorder = 0
myModMask = mod4Mask
myFocusFollowsMouse = False

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaults xmproc
  -- xmonad  $ desktopConfig {
  --   terminal = myTerm
  --   , keys = myKeys
  --   , borderWidth = 0
  --   , logHook = dynamicLogWithPP xmobarPP
  --     { ppOutput = hPutStrLn xmproc
  --     , ppTitle = xmobarColor "green" "" . shorten 50
  --     }
  --   , layoutHook = spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True $
  --                  layoutHook desktopConfig
  -- }

-- desktop _ = desktopConfig

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [ ((modMask,                    xK_z     ), safeSpawn myLocker [])
  -- Launching
  , ((modMask,                    xK_space ), safeSpawn myLauncher [])
  , ((modMask,                    xK_Return), safeSpawn (XMonad.terminal conf) [])
  -- Quiting
  , ((modMask,                    xK_c     ), kill)
  , ((modMask,                    xK_q     ), spawn "xmonad --recompile; xmonad --restart")
  , ((modMask .|. shiftMask,      xK_q     ),  io (exitWith ExitSuccess))
  -- swapping
  , ((modMask .|. shiftMask,      xK_Return), windows W.swapMaster)
  , ((modMask .|. shiftMask,      xK_j     ), windows W.swapDown  )
  , ((modMask .|. shiftMask,      xK_k     ), windows W.swapUp    )
  -- focus
  , ((modMask,                    xK_j     ), windows W.focusDown )
  , ((modMask,                    xK_k     ), windows W.focusUp   )
  -- resizing
  , ((modMask,                    xK_h     ), sendMessage Shrink)
  , ((modMask,                    xK_l     ), sendMessage Expand)
  ]
  ++
  [ ((m .|. modMask, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1..xK_9]
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ]

myLogHook h = do
  fadeWindowsLogHook myFadeHook
  dynamicLogWithPP $ def {
      ppOutput = hPutStrLn h
    , ppTitle = xmobarColor "green" "" . shorten 50
  }


myFadeHook = composeAll
  [ isUnfocused --> opacity 0.4
  , (className =? "Alacritty") <&&> (isUnfocused) --> opacity 0.9
  , isDialog --> opaque
  , opaque
  ]

myLayoutHook = spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True $ (avoidStruts (layoutHook desktopConfig))


defaults p = desktopConfig { terminal = myTerm
               , modMask = myModMask
               , keys = myKeys
               , borderWidth = myBorder
               , logHook = myLogHook p
               , layoutHook = myLayoutHook
               , focusFollowsMouse = myFocusFollowsMouse
               }
