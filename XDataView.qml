import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt.WebSockets 1.0
import "qwebchannel.js" as WebChannel

Rectangle{
    id: r
    width: parent.width*0.5
    height: parent.height
    color: btnShow.checked?'#333':'transparent'
    border.width: btnShow.checked?2:0
    border.color: 'gray'
    property alias lmc: listModelCode
    property alias lmu: listModelUser
    property alias ws: socket
    property var channel
    Column{
        spacing: app.fs*0.1
        Button {
            id:btnShow
            text: '<b>Data</b>'
            font.pixelSize: app.fs
            checkable: true
        }
        Column{
            visible: btnShow.checked
            width: r.width
            height: r.height-btnShow.height-app.fs*0.1
            spacing: app.fs*0.1
            Button {
                id:btnUsers
                text: checked?'<b>Usuarios-</b>':'<b>Usuarios+</b>'
                font.pixelSize: app.fs
                checkable: true
                checked: true
            }
            ListView{
                id:userListView
                width: parent.width
                height: btnUsers.checked?count*(app.fs*2+spacing):0
                spacing: app.fs*0.1
                clip: true
                model: listModelUser
                delegate: delegateUser
            }
            Button {
                id:btnCodes
                text: '<b>Códigos</b>'
                font.pixelSize: app.fs
                checkable: true
                checked: true
            }
            ListView{
                id:codeListView
                width: parent.width
                height: btnCodes.checked?r.height-btnCodes.height-btnUsers.height-btnShow.height-app.fs*3:0
                spacing: app.fs*0.1
                clip: true
                model: listModelCode
                delegate: delegateCode
            }
        }

    }
    ListModel{
        id: listModelUser
        function createElement(u){
            return {
                user: u
            }
        }
        function updateUserList(){
            clear()
            var ul = cs.userList;
            for(var i=0; i < ul.length; i++){
                append(createElement(ul[i]))
            }
        }
    }
    ListModel{
        id: listModelCode
        function createElement(c){
            return {
                code: c
            }
        }
        function addCode(code){
            append(createElement(code))
            codeListView.currentIndex = count-1
        }
    }
    Component{
        id: delegateUser
        Rectangle{
            width: userListView.width-app.fs*0.5
            height: app.fs*2
            border.width: 1
            color: "#cccccc"
            radius: app.fs*0.2
            anchors.horizontalCenter: parent.horizontalCenter
            clip:true
            Text {
                text: "<b>"+user+"</b>"
                font.pixelSize: app.fs
                anchors.centerIn: parent
            }
        }
    }
    Component{
        id: delegateCode
        Rectangle{
            width: codeListView.width-app.fs*0.5
            height: txtCode.contentHeight+app.fs
            border.width: 1
            color: "#cccccc"
            radius: app.fs*0.2
            anchors.horizontalCenter: parent.horizontalCenter
            clip:true
            Text {
                id: txtCode
                width: parent.width-app.fs
                height: contentHeight
                text: code
                font.pixelSize: 20
                anchors.centerIn: parent
                wrapMode: Text.WordWrap
            }
        }
    }
    WebSocket {
        id: socket
        property var send: function(arg) {
            sendTextMessage(arg);
        }
        onTextMessageReceived: {
            onmessage({data: message});
        }
        property var onmessage
        active: true
        //url: 'ws://'+app.ip+':'+app.port
        onStatusChanged: {
            switch (socket.status) {
            case WebSocket.Error:
                //errorSucess()
                console.log("Error 1: " + socket.errorString);
                break;
            case WebSocket.Closed:
                console.log("Error 2: Socket at " + url + " closed.")
                break;
            case WebSocket.Open:
                //open the webchannel with the socket as transport
                new WebChannel.QWebChannel(socket, function(ch) {
                    r.channel = ch;
                    //connect to the changed signal of the userList property
                    ch.objects.chatserver.userListChanged.connect(function(args) {
                        console.log('ch: User list changed!')
                        /*r.arrayUserList=ch.objects.chatserver.userList
                        var d = new Date(Date.now())
                        var ul = r.arrayUserList
                        for(var i=0; i < ul.length; i++){
                            console.log('Unik WsSql: Addign User: '+ul[i])
                            var sql = 'INSERT INTO users(user, ws, ms)VALUES(\''+ul[i]+'\', \''+r.url+'\',  '+d.getTime()+')'
                            unik.sqlQuery(sql)
                            if(''+ul[i]===tiUserName.text){
                                //xUserName.visible=false
                            }
                        }*/
                    });
                    //connect to the newMessage signal
                    ch.objects.chatserver.newMessage.connect(function(time, user, message) {
                        console.log('XDataView new message: '+message)
                    });

                    //connect to the keep alive signal
                    ch.objects.chatserver.keepAlive.connect(function(args) {
                        ch.objects.chatserver.keepAliveResponse('gpio-server');
                        //keepAliveSuccess()
                    });
                    loguin()
                });
                break;
            }
        }
    }
    function loguin(){
        r.channel.objects.chatserver.login('gpio-server', function(arg) {
            //check the return value for success
            if (arg === true) {
                sendCode('gpio-server is logued.')
            } else {
                sendCode('gpio-server is\'nt logued.')
            }
        });
    }
    function sendCode(c){
        r.channel.objects.chatserver.sendMessage('gpio-server',c);
    }
}
