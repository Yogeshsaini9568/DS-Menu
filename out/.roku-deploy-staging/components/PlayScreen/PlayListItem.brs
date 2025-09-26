sub init()
    m.itemPoster = m.top.findNode("itemPoster")
end sub

sub itemContentChanged()
    content = m.top.itemContent
    if content <> invalid
        m.itemPoster.uri = content.assetThumbURL
    end if
end sub