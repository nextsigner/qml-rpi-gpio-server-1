import QtQuick 2.0

Rectangle{
    id: r
    color:'transparent'
    width: app.fs+app.fs*0.3-app.fs*0.5
    height: app.fs*3

    Rectangle{
        id: resp2
        width: app.fs*3
        height: width
        radius: width*0.5
        anchors.centerIn: resp1
        color: 'red'
        opacity: resp1.opacity/2
    }
    Rectangle{
        id:resp1
        width: app.fs*2
        height: width
        radius: width*0.5
        anchors.centerIn: pl2
        color: 'red'
        opacity: 0.0
        Timer{
            running: true
            repeat: true
            interval: 50
            onTriggered: {
                parent.opacity=unik.pinIsHigh(11)?0.35:0.0
            }
        }
    }
    Rectangle{
        id:pl1
        color:'red'
        width: parent.width+app.fs*0.2
        height: app.fs*0.7
        radius: app.fs*0.4
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: resp1.opacity>0.0?1.0:0.5
    }
    Rectangle{
        id:pl2
        color:'red'
        width: parent.width+app.fs*0.2
        height: app.fs*0.6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: pl1.verticalCenter
        opacity: resp1.opacity>0.0?1.0:0.5
    }
    Rectangle{
        id:pl3
        color:'red'
        width: parent.width+app.fs*0.4
        height: app.fs*0.2
        anchors.top: pl2.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: resp1.opacity>0.0?1.0:0.5
    }
    Rectangle{
        color:'white'
        width: 2
        anchors.top: pl3.bottom
        anchors.bottom: parent.bottom
    }
    Rectangle{
        color:'white'
        width: 2
        anchors.top: pl3.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
