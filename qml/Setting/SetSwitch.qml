import QtQuick 2.0
import Felgo 3.0

Item {

    id: item
    //    property alias clickSound: StartScene.op
    TexturePackerAnimatedSprite{
        id:musicbutton
        width: 60
        height: 56
        x:940
        anchors.top: parent.top
        anchors.topMargin: 5
        z: 1
        source: "../../assets/img/MenuAssets.json"
        frameNames: startScene.openTheSound.playing ? ["MusicButton0000"] : ["MusicButton0001"]
        MouseArea{
//            enabled: okbutton.enabled
            anchors.fill: parent
            onClicked: {
                //                console.log(startScene.openTheSound)
                if (musicbutton.frameNames[0]==="MusicButton0000"){musicbutton.frameNames[0]=["MusicButton0001"]; startScene.openTheSound.stop()}
                else{musicbutton.frameNames[0]=["MusicButton0000"];startScene.openTheSound.play()}
            }
        }
    }

}
