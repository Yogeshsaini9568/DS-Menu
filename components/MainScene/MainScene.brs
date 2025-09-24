sub init()
    m.iconBg = m.top.findNode("iconBg")
    m.icon = m.top.findNode("icon")

    iconBound = m.icon.boundingRect()
    m.icon.translation = [(m.iconBg.width-iconBound.width)/2,(m.iconBg.height-iconBound.height)/2]

    m.keyboard = m.top.findNode("keyboard")
    m.keyboard.setFocus(true)

    m.keyboard.observeField("text", "onTextChanged")
end sub

sub onTextChanged(event as Object)
    query = event.getData()
    ?"---------------------> " query
    
    if len(query) = 6 then
        code = "aaaaaa"
        if code = query then
            showHomeScreen()
        else 
            showInvalidDialog()
        end if
    end if
end sub

sub showHomeScreen()
    m.homePage = CreateObject("roSGNode", "HomeScene")
    m.top.appendChild(m.homePage)
    m.top.focusable = false
    m.homePage.setFocus(true)
end sub

sub showInvalidDialog()
    dialog = CreateObject("roSGNode", "Dialog")
    dialog.message = "Invalid Code"
    dialog.buttons = ["OK"]
    m.top.appendChild(dialog)
    dialog.setFocus(true)
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press
        if key = "ok"
            ?"ok click ho gya...."
            return true
        else if key = "down"
            if m.top.findNode("customBtn").visible = true
                m.top.findNode("customBtn").setFocus(true)            
                return true
            end if
        else if key = "up"
            if m.keyboard.visible = true
                m.keyboard.setFocus(true)
                return true
            end if
        end if
    end if
    return false
end function

