sub init()
    
    m.playlistGrid=m.top.findNode("PlayListGrid")
    m.videoNode=m.top.findNode("videoPlayer")

    m.PlaylistGrid.observeField("itemSelected","onPlayButtonSelected")
    setPlaylistContent()
end sub

sub setPlaylistContent()
    json=ReadAsciiFile("pkg:/components/PlayScreen/PlaylistData.json")
    data = ParseJson(json)
    content = CreateObject("roSGNode", "ContentNode")

    child =[]
        for each item in data.data
            itemNode = CreateObject("roSGNode", "PlayListViewModel")
            itemNode.assetThumbURL = item.assetThumbURL
            itemNode.id = item.id
            itemNode.name= item.name
            itemNode.profileId=item.profileId
            itemNode.total_items=item.total_items
            child.push(itemNode)
        end for

    content.appendChildren(child)

    m.playlistGrid.content = content
end sub



sub onPlayButtonSelected()
    
    'content = m.top.content 
    'if content <> invalid
        videoNode = CreateObject("roSGNode", "contentNode")
        videoNode.url = "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"
        videoNode.streamFormat = "auto"
        m.videoNode.content = videoNode
        m.videoNode.visible = true
        m.videoNode.control = "play"
        m.videoNode.setFocus(true)
    'end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press
        if key = "back"
            if m.videoNode.visible = true
                m.videoNode.control = "stop"
                m.videoNode.visible = false
                m.playlistGrid.setFocus(true)
                return true
            end if
        end if
    end if
    return false
end function