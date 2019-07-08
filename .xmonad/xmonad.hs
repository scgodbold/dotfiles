-- default desktop configuration for Fedora

import System.IO
import System.Posix.Env (getEnv)

import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Util.Run(spawnPipe)

main = do
  xmproc <- spawnPipe "xmobar"
  session <- getEnv "DESKTOP_SESSION"
  xmonad  $ desktopConfig {
    terminal = "/usr/local/bin/alacritty"
    , borderWidth = 0
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "green" "" . shorten 50
      }
    , layoutHook = spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True $
                   layoutHook desktopConfig
  }

desktop _ = desktopConfig
