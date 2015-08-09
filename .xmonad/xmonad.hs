import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders
import System.IO

myManageHook = composeAll
    [
        className =? "Gimp" --> doFloat,
		isFullscreen --> doFullFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
		terminal = "urxvt",
		workspaces = ["1","2","3","4","5","6","7","8","9"],
		modMask = mod4Mask,
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig,
        logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor "green" "" . shorten 50
        } >> updatePointer (Relative 0.75 0.85)
    } `additionalKeys`
        [
            ((controlMask .|. mod1Mask, xK_l), spawn "slock"),
			((0, xK_Print), spawn "scrot -e 'mv $f ~/media/pictures/screenshots/'"),
			((controlMask, xK_Print), spawn "scrot -se 'mv $f ~/media/pictures/screenshots/'")
        ]
