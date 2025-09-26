sub init()
  m.top.observeField("focusedChild", "onFocusChange")
  setDefaults()

  m.bgImage = m.top.findNode("bgImage")
  m.btnLabel = m.top.findNode("btnLabel")
  m.btnIcon = m.top.findNode("btnIcon")
  m.msgPoster = m.top.findNode("msgPoster")
  m.msgLabel = m.top.findNode("msgLabel")

  ' bound = m.msgLabel.boundingRect()
  ' m.msgLabel.translation = [(m.msgPoster.width-bound.width)/2,(m.msgPoster.height-bound.height)/2]   
end sub

function setDefaults()
  m.top.focusedIconUri = ""
  m.top.iconUri = ""
  m.top.focusFootprintBitmapUri = ""
  m.top.focusBitmapUri=""
  m.top.minWidth = "920"
end function

sub onFocusChange()

  if m.top.focusedChild <> invalid
    m.bgImage.blendColor="#8D1F6A"
    m.btnLabel.color="#faf7faff"
    m.btnIcon.blendColor="#faf7faff"
  else 
    m.bgImage.blendColor = "#FFFFFFFF" 
    m.btnLabel.color = "#612fcdff"
    m.btnIcon.blendColor = "#612fcdff"
  end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press
        if key = "up"
            ?"handel ho gya up ka...."
            return false
        end if
    end if
    return false
end function