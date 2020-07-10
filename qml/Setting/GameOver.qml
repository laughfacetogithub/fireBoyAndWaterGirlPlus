import QtQuick 2.0
import Felgo 3.0

SceneBase {

    onBackButtonPressed: {
        window.state = "main"
    }

    // this allows faster navigation through the scenes by pressing the Enter(=Return) key
    Keys.onReturnPressed: {
        window.state = "main"
    }

    // 3 different formats of the image are provided (-sd, -hd and -hd2)
    TexturePackerAnimatedSprite{
        id:opensetting1
        anchors.fill: parent
        source: "../../assets/img/PopupAssets.json"
        frameNames: ["PopupBackground0000"]

    }

    MenuText {
        y: 50
        text: qsTr("Game Over")
        font.pixelSize: 25
    }

    MenuText {
        id: scoreText
        y: 250
        text: qsTr("Your score: " + record.endScore)
    }

    MenuButton {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        text: qsTr("Continue")
        onClicked: window.state = "main"
    }

}
