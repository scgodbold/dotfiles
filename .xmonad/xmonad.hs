-- default desktop configuration for Fedora

import qualified Data.Map as M
import System.IO
import System.Posix.Env (getEnv)

import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Util.Run(safeSpawn, spawnPipe)

term = "/usr/local/bin/alacritty"

main = do
  xmproc <- spawnPipe "xmobar"
  session <- getEnv "DESKTOP_SESSION"
  xmonad  $ desktopConfig {
    terminal = "/usr/local/bin/alacritty"
    , keys = myKeys
    , borderWidth = 0
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "green" "" . shorten 50
      }
    , layoutHook = spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True $
                   layoutHook desktopConfig
  }

desktop _ = desktopConfig

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [ ((modMask,      xK_z     ), safeSpawn "slock" [])
  , ((modMask,      xK_Return), safeSpawn (XMonad.terminal conf) [])
  , ((modMask,      xK_c     ), kill)
  , ((modMask,      xK_q     ), spawn "xmonad --recompile; xmonad --restart")
  ]
