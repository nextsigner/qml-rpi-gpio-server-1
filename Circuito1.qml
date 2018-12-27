import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Item{
    id: r
    height: colR.height
    property bool pin12IsLow: false
    Column{
        id:colR
        spacing: app.fs*0.5
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            Button{
                id: botPin12
                text: !checked?'Poner Pin 12 en Low':'Poner Pin 12 en High'
                font.pixelSize: app.fs
                checkable: true
                onCheckedChanged: {
                    if(!checked){
                        unik.writePinHigh(12)
                    }else{
                        unik.writePinLow(12)
                    }
                }
            }
        }
        Rectangle{
            id: r2
            height: col1.height+app.fs*2
            width: r.width
            color: "#1f7c30"
            border.width: 2
            border.color: "#2ad0d5"
        Column{
        id:col1
        spacing: app.fs
        anchors.verticalCenter: parent.verticalCenter
        Rectangle{
            id:l1
            width: app.fs*32+app.fs*0.5
            height: 2
            color: r.pin12IsLow?'black':'white'
            Text{
                text: '<b>220v</b>'
                font.pixelSize: app.fs*0.6
                anchors.top: parent.bottom
                anchors.topMargin: app.fs*0.2
                color: 'white'
            }
        }
        Row{
            Rectangle{
                id:l2
                width: app.fs*20+app.fs*0.5+2
                height: 2
                color: 'red'
            }
            Rectangle{//espacio
                width: app.fs+app.fs
                height: 2
                color: r2.color
            }
            Rectangle{
                id:l22
                width: app.fs*6
                height: 2
                color: r.pin12IsLow?'red':'white'
                Rectangle{
                    width: 2
                    height: app.fs*3
                    anchors.right: parent.right
                    color: r.pin12IsLow?'red':'white'
                    Item{
                        width: app.fs*2
                        height: width
                        anchors.left: parent.right
                        anchors.top: parent.bottom
                        Rectangle{
                            width: app.fs
                            height: 2
                            color: r.pin12IsLow?'red':'white'
                            z:parent.z-1
                            Rectangle{
                                width: 6
                                height: width
                                radius: width*0.5
                                color: parent.color
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.left
                            }
                        }
                        Rectangle{
                            width: app.fs
                            height: 2
                            color: r.pin12IsLow?'black':'white'
                            anchors.bottom: parent.bottom
                            z:parent.z-1
                            Rectangle{
                                width: 6
                                height: width
                                radius: width*0.5
                                color: parent.color
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.left
                            }
                        }
                        Text{
                            text: '<b>Engine</b>'
                            font.pixelSize: app.fs*0.5
                            horizontalAlignment: Text.AlignHCenter
                            color: 'white'
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.horizontalCenterOffset: -app.fs*2
                            rotation: -90
                        }
                        Item{
                            id: hel
                            width: app.fs*4
                            height: width
                            anchors.centerIn: parent
                            anchors.horizontalCenterOffset: app.fs*0.5
                            Rectangle{
                                width: app.fs*2
                                height: width
                                color: 'black'
                                radius: app.fs*0.2
                                anchors.centerIn: parent
                            }
                            SequentialAnimation{
                                id: anHel
                                running: r.pin12IsLow
                                loops: Animation.Infinite
                                NumberAnimation {
                                    target: hel
                                    property: "rotation"
                                    from: 0
                                    to:360
                                    duration: 700
                                    easing.type: Easing.Linear
                                }
                            }
                            Image {
                                id: helice
                                source: "./helice.png"
                                width: app.fs*3.5
                                height: width
                                anchors.centerIn: parent
                            }
                            ColorOverlay{
                                source: helice
                                color: "yellow"
                                anchors.fill: helice
                            }
                        }
                        Rectangle{
                            width: 2
                            height: app.fs*2
                            color: r.pin12IsLow?'black':'white'
                            z:parent.z-1
                            anchors.top: parent.bottom
                            Rectangle{
                                width: app.fs*4
                                height: 2
                                color: r.pin12IsLow?'black':'white'
                                anchors.bottom: parent.bottom
                                Rectangle{
                                    width: 2
                                    height: app.fs*8
                                    color: r.pin12IsLow?'black':'white'
                                    anchors.bottom: parent.top
                                    anchors.right: parent.right
                                }
                            }
                        }
                    }

                }
            }
        }
        Rectangle{
            width: r2.width
            height: app.fs*3+app.fs*0.25
            color: 'transparent'
            Rectangle{
                id: xRele
                width: app.fs*3+app.fs*0.25
                height: width
                color: 'transparent'
                border.width: 2
                border.color: 'white'
                x:app.fs*20
                Text{
                    text: '<b>Relé</b>'
                    font.pixelSize: app.fs*0.6
                    anchors.bottom: parent.top
                    anchors.bottomMargin: app.fs*0.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: 'white'
                }
                Rectangle{
                    width: app.fs*2
                    height: 2
                    y: app.fs+app.fs*0.25
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: 'transparent'

                    Rectangle{
                        width: app.fs*0.5
                        height: 2
                        color: 'red'
                        Rectangle{
                            width: 2
                            height: app.fs*3-app.fs*0.5-4
                            anchors.bottom: parent.top
                            color: 'red'
                        }
                        Rectangle{
                            width: 2
                            height: app.fs+app.fs*0.25
                            anchors.bottom: parent.top
                            color: 'red'
                        }
                        Rectangle{
                            width: 6
                            height: width
                            radius: width*0.5
                            antialiasing: true
                            anchors.horizontalCenter: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            color: 'red'
                        }
                    }
                    Rectangle{
                        width: app.fs*0.5
                        height: 2
                        anchors.right: parent.right
                        color: r.pin12IsLow?'red':'white'
                        Rectangle{
                            width: 2
                            height: app.fs*3-app.fs*0.5-4
                            anchors.bottom: parent.top
                            anchors.right: parent.right
                            color: r.pin12IsLow?'red':'white'
                        }
                        Rectangle{
                            width: 2
                            height: app.fs+app.fs*0.25
                            anchors.bottom: parent.top
                            anchors.right: parent.right
                            color: r.pin12IsLow?'red':'white'
                        }
                        Rectangle{
                            width: 6
                            height: width
                            radius: width*0.5
                            antialiasing: true
                            anchors.horizontalCenter: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            color: r.pin12IsLow?'red':'white'
                            Rectangle{
                                width: app.fs
                                height: 2
                                antialiasing: true
                                color: r.pin12IsLow?'red':'white'
                                transform: Rotation{origin.x:2; origin.y:1; angle: r.pin12IsLow?-180:-135}
                            }
                        }
                    }
                }
                Row{
                    height: app.fs*0.5
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: app.fs*0.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: -2
                    Repeater{
                        model: 4
                        Rectangle{
                            width: app.fs*0.5
                            height: width
                            radius: width*0.5
                            gradient: Gradient {
                                GradientStop {
                                    position: 0.00;
                                    color: r.pin12IsLow?'red':'white';
                                }
                                GradientStop {
                                    position: 1.00;
                                    color: r.pin12IsLow?'black':'white';
                                }
                            }
                            Rectangle{
                                width: parent.width-4
                                height: width
                                color: r2.color
                                anchors.centerIn: parent
                            }

                        }
                    }
                }
                Rectangle{
                    width: parent.width-4
                    height: app.fs*0.25
                    color: r2.color
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: app.fs*0.5
                    Rectangle{
                        width: app.fs*0.25+3
                        height: 2
                        x:app.fs*0.5-2
                        gradient: Gradient {
                            GradientStop {
                                position: 0.00;
                                color: r.pin12IsLow?'red':'white';
                            }
                            GradientStop {
                                position: 1.00;
                                color: r.pin12IsLow?'black':'white';
                            }
                        }
                        Rectangle{
                            width: 2
                            height: app.fs*3-2
                            color: r.pin12IsLow?'red':'white'
                        }
                    }
                    Rectangle{
                        width: app.fs*0.25+3
                        height: 2
                        anchors.right: parent.right
                        anchors.rightMargin: app.fs*0.25+2
                        gradient: Gradient {
                            GradientStop {
                                position: 0.00;
                                color: r.pin12IsLow?'red':'white';
                            }
                            GradientStop {
                                position: 1.00;
                                color: r.pin12IsLow?'black':'white';
                            }
                        }
                        Rectangle{
                            width: 2
                            height: app.fs*8
                            x:parent.width-2
                            color: r.pin12IsLow?'black':'white'
                        }
                    }
                }
            }
        }
        Rectangle{
            id:xTransitor
            width: r2.width
            height: app.fs*3
            color: 'transparent'
            Rectangle{
                width: app.fs*3
                height: width
                border.width: 2
                border.color: 'white'
                color: 'transparent'
                x: app.fs*12+app.fs*0.5
                Text{
                    text: '<b>Transistor</b>'
                    font.pixelSize: app.fs*0.6
                    anchors.bottom: parent.top
                    anchors.bottomMargin: app.fs*0.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: 'white'
                }
                Rectangle{
                    width: parent.width
                    height: 2
                    color: 'transparent'
                    y:app.fs
                    Rectangle{
                        width: app.fs*9+app.fs*0.5+2
                        height: 2
                        anchors.right: parent.left
                        color: 'red'

                        Rectangle{
                            width: 2
                            height: app.fs*5
                            anchors.left: parent.left
                            color: 'red'
                            Text{
                                text: '<b>RPI<b><br/><b>OUT<b><br/><b>5v</b>'
                                font.pixelSize: app.fs*0.5
                                horizontalAlignment: Text.AlignHCenter
                                color: 'white'
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.horizontalCenterOffset: app.fs*1.2
                                rotation: -90
                            }
                        }
                    }
                    Rectangle{
                        width: app.fs*5
                        height: 2
                        anchors.left: parent.right
                        color: r.pin12IsLow?'red':'white'
                    }

                    Rectangle{
                        width: app.fs*0.5
                        height: 2
                        color: 'red'

                        Rectangle{
                            width: app.fs*1.4
                            height: 2
                            transform: Rotation{origin.x: 0; origin.y: 1; angle: 45}
                            x: parent.width
                            color: 'red'
                        }
                    }
                    Rectangle{
                        width: app.fs*0.5
                        height: 2
                        anchors.right: parent.right
                        color: r.pin12IsLow?'red':'white'
                        Rectangle{
                            width: app.fs*1.4
                            height: 2
                            transform: Rotation{origin.x: 0; origin.y: 1; angle: 135}
                            color: r.pin12IsLow?'red':'white'
                            Item{
                                width: app.fs*0.25
                                height: width
                                anchors.centerIn: parent
                                z:parent.z-1
                                Rectangle{
                                    anchors.centerIn: parent
                                    width: app.fs*0.5
                                    height: width
                                    rotation: 45
                                    color: r.pin12IsLow?'red':'white'
                                }
                                Rectangle{
                                    anchors.centerIn: parent
                                    width: app.fs*0.75
                                    height: width
                                    anchors.horizontalCenterOffset: app.fs*0.25
                                    color: r2.color
                                }
                            }
                        }
                    }
                    Rectangle{
                        width: 2
                        height: app.fs*4
                        color: r.pin12IsLow?'red':'white'
                        anchors.horizontalCenter: parent.horizontalCenter
                        y:app.fs
                        Text{
                            text: '<b>GPIO<b><br/><b>OUT<b><br/><b>1v</b>'
                            font.pixelSize: app.fs*0.5
                            horizontalAlignment: Text.AlignHCenter
                            color: 'white'
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.horizontalCenterOffset: app.fs*1.2
                            rotation: -90
                        }
                    }
                }

            }
        }
    }
    }
    }
    Timer{
        running: true
        repeat: true
        interval: 50
        onTriggered: {
            r.pin12IsLow=unik.pinIsHigh(12)
            if(r.pin12IsLow){
                botPin12.checked=true
            }
        }
    }
    Component.onCompleted: {
        unik.setPinType(12,0)
        unik.setPinState(12, 1)
    }
}
