sub init()
    m.iconBg = m.top.findNode("iconBg")
    m.icon = m.top.findNode("icon")
    m.customBtn=m.top.findNode("customBtn")
    m.customTextBox = m.top.findNode("customTextBox")
    m.playlistScreen = m.top.findNode("playlistScreen")

    iconBound = m.icon.boundingRect()
    m.icon.translation = [(m.iconBg.width-iconBound.width)/2,(m.iconBg.height-iconBound.height)/2]

    m.keyboard = m.top.findNode("keyboard")
    m.keyboard.setFocus(true)

    m.keyboard.observeField("text", "onTextChanged")
    m.customBtn.observeField("buttonSelected", "onCustomBtnClicked")
end sub

sub onTextChanged(event as Object)
    m.query = event.getData()
    
    ?"---------------------> " m.query
    ' m.customTextBox.text = m.query
    ' ?"--------------------->>>> " m.customTextBox.text
    
    if len(m.query) = 6 then
        
    end if
end sub

sub showPlayListScreen()
    m.playlistScreen.visible = true
    m.playlistScreen.findNode("playListGrid").setFocus(true)
end sub

sub showInvalidDialog()
    dialog = CreateObject("roSGNode", "Dialog")
    dialog.message = "Invalid Code"
    dialog.buttons = ["OK"]
    m.top.appendChild(dialog)
    dialog.setFocus(true)
end sub

sub onCustomBtnClicked()
    if m.query = invalid or m.query = ""
        m.customBtn.findNode("msgLabel").visible = true
        m.customBtn.findNode("msgLabel").text = "Access Code Cannot be Empty. Try Again!"
        m.customBtn.findNode("msgPoster").visible = true
    else if len(m.query) <> 6
        m.customBtn.findNode("msgLabel").visible = true
        m.customBtn.findNode("msgLabel").text = "Code must be 6 characters"
        
        m.customBtn.findNode("msgPoster").visible = true
    else
        showPlayListScreen()
    end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press
        if key = "ok"
            ?"ok click ho gya...."
            return true
        else if key = "down"
            if m.customBtn.visible = true
                m.customBtn.setFocus(true)
                return true
            end if
        else if key = "up"
            if m.customBtn.hasFocus()
                m.keyboard.setFocus(true)
                return true
            end if
        end if
    end if
    return false
end function
