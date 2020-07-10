import QtQuick 2.0
import Felgo 3.0

Item {
    property alias score_timer: score_timer
    id: item
    property alias endScore: item.recordScore
    property int recordScore: 0
    Text {
        id: recordScore
        //        anchors.left: parent.left
        //        anchors.leftMargin: 5
        x: 30
        anchors.top: parent.top
        anchors.topMargin: 5
        text: qsTr("Score: " + item.recordScore)
        color: "white"
        font.family: fontHUD.name
        font.pixelSize: 25
        z: 1
    }
    //    Text {
    //        id: recordTimer
    //        color: "white"
    ////        anchors.bottom: parent.
    ////        anchors.left: parent.left
    ////        text: qsTr("date")
    //    }
    Timer{
        id:score_timer
        interval: 30
        running: false
        repeat: true
        onTriggered: {
            item.recordScore ++
        }
    }
    //    Timer{
    //        interval: 500
    //        running: true
    //        repeat: true
    //        onTriggered: {
    //            recordTimer.text = Date().toString()
    //        }
    //    }

}
