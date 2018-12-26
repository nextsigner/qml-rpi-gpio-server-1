import QtQuick 2.0

Rectangle{
    width: gp.width+app.fs*4
    height: gp.height+app.fs*2
    color: "#222222"
    border.width: app.fs*0.1
    border.color: 'red'
    property alias pgp: gp
    Row{
        anchors.centerIn: parent
        spacing: app.fs*0.5
        Item{
            width: app.fs
            height: parent.parent.height
            Text{
                text: 'PI Model B/B+'
                font.pixelSize: parent.height*0.1
                color: 'white'
                rotation: -90
                anchors.centerIn: parent
            }
        }
        Grid{
            id: gp
            spacing: app.fs*0.2
            columns: 20
            anchors.verticalCenter: parent.verticalCenter
            Repeater{
                //       2 1    4 3   6 5    8 7   10 9   12 11  14 13   16 15  18 17  20 19   22 21  24 23  26 25   28 27  30 29   32 31  34 33   36 35  38 37   40 39
                model: [[1,0], [0,0],[-1,0],[0,0],[0,-1], [0,0], [-1,0], [0,0], [0,0], [-1,0], [0,0], [0,0], [0,-1], [0,0], [-1,0], [0,0], [-1,0], [0,0], [0,0], [0,-1]]
                Column{
                    spacing: app.fs*0.2
                    Rectangle{
                        width: app.fs*2
                        height: width
                        radius: width*0.5
                        border.width: 4
                        border.color: modelData[0]===-1?'white':(modelData[0]===1?'white':'orange')
                        color: modelData[0]===-1?'black':(modelData[0]===1?'red':'white')
                        Text {
                            text: '<b>'+parseInt(index*2+2)+'</b>'
                            font.pixelSize: parent.width*0.4
                            anchors.centerIn: parent
                            color: parent.border.color
                        }
                    }
                    Rectangle{
                        width: app.fs*2
                        height: width
                        radius: width*0.5
                        border.width: 4
                        border.color: modelData[1]===-1?'white':(modelData[1]===1?'white':'orange')
                        color: modelData[1]===-1?'black':(modelData[1]===1?'red':'white')
                        Text {
                            text: '<b>'+parseInt(index*2+1)+'</b>'
                            font.pixelSize: parent.width*0.4
                            anchors.centerIn: parent
                            color: parent.border.color
                        }
                    }
                }
            }
        }
        Item{
            width: app.fs
            height: parent.parent.height
        }
    }
}
