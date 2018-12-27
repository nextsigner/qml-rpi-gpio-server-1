import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle{
    id: r
    height: col1.height+app.fs*2
    color: "#333"
    border.width: 2
    border.color: 'red'
    Column{
        id:col1
        anchors.verticalCenter: parent.verticalCenter
        spacing: app.fs
        Rectangle{
            id:l1
            width: app.fs*30
            height: 2
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
                color: '#333'
            }
            Rectangle{
                id:l22
                width: app.fs*6
                height: 2
                color: anHel.running?'red':'white'
                Rectangle{
                    width: 2
                    height: app.fs*3
                    anchors.right: parent.right
                    color: anHel.running?'red':'white'
                    Rectangle{
                        width: app.fs*3
                        height: width
                        color: 'gray'
                        anchors.left: parent.right
                        anchors.top: parent.bottom
                        Item{
                            id: hel
                            width: app.fs*4
                            height: width
                            anchors.centerIn: parent
                            Timer{
                                running: true
                                repeat: true
                                interval: 50
                                onTriggered: {
                                    anHel.running=unik.pinIsHigh(12)
                                }
                            }
                            SequentialAnimation{
                                id: anHel
                                running: false
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
                    }
                }
            }
        }
        Rectangle{
            width: r.width
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
                        color: anHel.running?'red':'white'
                        Rectangle{
                            width: 2
                            height: app.fs*3-app.fs*0.5-4
                            anchors.bottom: parent.top
                            anchors.right: parent.right
                            color: anHel.running?'red':'white'
                        }
                        Rectangle{
                            width: 2
                            height: app.fs+app.fs*0.25
                            anchors.bottom: parent.top
                            anchors.right: parent.right
                            color: anHel.running?'red':'white'
                        }
                        Rectangle{
                            width: 6
                            height: width
                            radius: width*0.5
                            antialiasing: true
                            anchors.horizontalCenter: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            color: anHel.running?'red':'white'
                            Rectangle{
                                width: app.fs
                                height: 2
                                antialiasing: true
                                color: anHel.running?'red':'white'
                                transform: Rotation{origin.x:2; origin.y:1; angle: anHel.running?-180:-135}
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
                                    color: anHel.running?'red':'white';
                                }
                                GradientStop {
                                    position: 1.00;
                                    color: anHel.running?'black':'white';
                                }
                            }
                            Rectangle{
                                width: parent.width-4
                                height: width
                                color: '#333'
                                anchors.centerIn: parent
                            }

                        }
                    }
                }
                Rectangle{
                    width: parent.width-4
                    height: app.fs*0.25
                    color: '#333'
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
                                color: anHel.running?'red':'white';
                            }
                            GradientStop {
                                position: 1.00;
                                color: anHel.running?'black':'white';
                            }
                        }
                        Rectangle{
                            width: 2
                            height: app.fs*3-2
                            color: anHel.running?'red':'white'
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
                                color: anHel.running?'red':'white';
                            }
                            GradientStop {
                                position: 1.00;
                                color: anHel.running?'black':'white';
                            }
                        }
                        Rectangle{
                            width: 2
                            height: app.fs*8
                            x:parent.width-2
                            color: anHel.running?'black':'white'
                        }
                    }
                }
            }
        }
        Rectangle{
            id:xTransitor
            width: r.width
            height: app.fs*3
            color: 'transparent'
            Rectangle{
                width: app.fs*3
                height: width
                border.width: 2
                border.color: 'white'
                color: 'transparent'
                x: app.fs*12+app.fs*0.5
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
                        }
                    }
                    Rectangle{
                        width: app.fs*5
                        height: 2
                        anchors.left: parent.right
                        color: anHel.running?'red':'white'
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
                        color: anHel.running?'red':'white'
                        Rectangle{
                            width: app.fs*1.4
                            height: 2
                            transform: Rotation{origin.x: 0; origin.y: 1; angle: 135}
                            color: anHel.running?'red':'white'
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
                                    color: anHel.running?'red':'white'
                                }
                                Rectangle{
                                    anchors.centerIn: parent
                                    width: app.fs*0.75
                                    height: width
                                    anchors.horizontalCenterOffset: app.fs*0.25
                                    color: '#333'
                                }
                            }
                        }
                    }
                    Rectangle{
                        width: 2
                        height: app.fs*4
                        color: anHel.running?'red':'white'
                        anchors.horizontalCenter: parent.horizontalCenter
                        y:app.fs
                    }
                }

            }
        }
    }
}
