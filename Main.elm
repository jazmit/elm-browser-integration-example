module BrowserIntegrationExample where

import Signal (..)
import Graphics.Input.Field (..)
import Graphics.Element (Element)

port initialLocation : String -- incoming

port location : Signal String -- outgoing
port location = (.string) <~ subscribe name

name : Channel Content
name = channel {noContent | string <- initialLocation}

main : Signal Element
main = field defaultStyle (send name) "Type here" <~ subscribe name
