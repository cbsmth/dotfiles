import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders
import System.IO

-- http://www.haskell.org/haskellwiki/Xmonad/Config_archive/John_Goerzen's_Configuration

myManageHook = composeAll
    [
        className =? "Gimp" --> doFloat,
		isFullscreen --> doFullFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
		terminal = "urxvt",
		modMask = mod1Mask,
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = smartBorders (avoidStruts $ layoutHook defaultConfig),
        logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor "green" "" . shorten 50
        }
    } `additionalKeys`
        [
            ((controlMask .|. mod1Mask, xK_l), spawn "xscreensaver-command -lock")
        ]
