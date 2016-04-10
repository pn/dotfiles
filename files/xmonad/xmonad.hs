import XMonad
import XMonad.Hooks.DynamicLog

main=xmonad=<< xmobar myConfig
myConfig=defaultConfig { modMask=mod4Mask }
