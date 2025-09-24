sub init()
    setDefault()
    ' m.btn = m.top.findNode("btn")
    m.btnLabel = m.top.findNode("btnLabel")
    labelBound = m.btnLabel.boundingRect()
    'm.btnLabel.translation = [(m.btn.width-labelBound.width)/2,(m.btn.height-labelBound.height)/2]
end sub

sub setDefault()
    m.top.iconUri = ""
    m.top.focusedIconUri=""
    m.top.focusFootprintBitmapUri = ""
    m.top.focusBitmapUri = ""
    m.top.minWidth = "500"
end sub