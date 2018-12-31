import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: app
    visible: true
    visibility: 'Maximized'
    title: 'Qml RPI GPIO Server'
    width: 400
    height: 500
    color: 'black'
    property int fs: width*0.02
    property string ip: '192.168.1.55'
    property int port: 12345
    property string serverName: 'chatserver'
    property var container: xApp

    Item{
        id: xApp
        anchors.fill: parent
        Column{
            id:col1
            anchors.centerIn: parent
            spacing: app.fs
            Circuito1{width: pinesRPI.width;z: pinesRPI.z+1}
            PinesRPI{id:pinesRPI}
        }
    }
    Shortcut{
        sequence: 'Esc'
        onActivated: Qt.quit()
    }
    Connections {target: unik;onUkStdChanged: processLogData((''+unik.ukStd));}
    Connections {target: unik;onStdErrChanged: processLogData((''+unik.ukStd));}
    Connections {
        id:connCW
        onClientConnected:{
            console.log("A new client connected.")
        }
    }
    Connections {
        target: cs
        onNewMessage:{
            console.log('Receiving a new data: '+user+' code: '+msg)
            var obj = Qt.createQmlObject(msg, xApp, 'remotecode')
        }
    }
    Timer{
        running:true
        repeat:true
        interval: 1000
        onTriggered: {
            if(cw){
                connCW.target=cw
            }

        }
    }
    Component.onCompleted: {
        unik.initRpiGpio()
        unik.run('sudo /bin/hostname -I')
    }
    function processLogData(d){
        var ip=''
        if((''+d).indexOf('192.168.')===0&&(''+d).indexOf(' ')>0){
            ip=(''+d).split(' ')[0]
            console.log('Starting WebSocket Server with local ip: '+ip)
            app.ip=ip
            unik.initWebSocketServer(app.ip, app.port, app.serverName);
        }
    }
}
