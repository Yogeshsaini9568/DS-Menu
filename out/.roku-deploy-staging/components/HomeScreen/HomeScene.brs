sub init()
    m.top.focusable = true
    ?"Home page show hoga"
    m.playButton = m.top.findNode("playButton")
    m.playButton.setFocus(true)
    m.top.observeField("focusedChild", "onFocusChange")


end sub

function onFocusChange(event)
    m.top.focusable = false
    if event.getData() <> invalid
        m.top.focusable = true
    end if
end function

function onKeyEvent(key as string, press as boolean) as boolean
if press
    if key = "right"
        ?"Right click ho gya...."
        return true
    end if
end if
return false

end function