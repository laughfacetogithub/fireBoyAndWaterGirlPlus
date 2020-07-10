import Felgo 3.0
import QtQuick 2.0
import "Setting"

Scene{
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    //    property alias timer: timer
    property alias level: level
    property alias entityContainer: level
    property alias player: player
    property alias record: record
    id:gamescene
    width: 1800
    height: 960
    PhysicsWorld{
        //        debugDrawVisible: true
        //        gravity: Qt.point(0,20)
    }

    function gameover(){
        opensetting.opacity=1
        opensetting.z=1
        playbutton.enabled=true
        okbutton.enabled=true
        level.levelMovementAnimation.running=false
        level.ground.gw_timer.running=false
        level.ground.gw1_timer.running=false
        record.score_timer.running=false
        //        entityManager.removeAllEntities()
        //The sound of hero death
        deathSound.play()

    }

    function restartgame(){

        //        player.f_collider.linearVelocity=Qt.point(0,0)
        level.ground.gw_timer.running=true
        level.ground.gw1_timer.running=true
        level.levelMovementAnimation.running=true
        opensetting.opacity=0
        playbutton.enabled=false
        okbutton.enabled=false
        record.recordScore=0
        record.score_timer.running=true
        player.health=3
        player.person.resetting()
    }

    Image {
        id: name
        source: "../assets/bg1.jpg"
        //        width: 1080
        //        height: 640
        anchors.fill: parent
        //        MouseArea{
        //            anchors.fill: parent
        //            onClicked: player.f_collider.linearVelocity.y = -500
        //        }
    }
    ParallaxScrollingBackground {
        id: levelBackground
        //    property int initialOffsetx: -(levelBackground.image.width-scene.width)/2
        //    property int initialOffsety: -(levelBackground.image.height-scene.height)/2
        //    x: initialOffsetx
        //    y: initialOffsety-level.y
        anchors.bottom:  parent.bottom
        height: 200
        //  y: parent.height-parent.gameWindowAnchorItem.height
        sourceImage: "../assets/bg2.png"
        // do not mirror it vertically, because the image is prepared to match on the top and the bottom
        mirrorSecondImage: false
        movementVelocity: Qt.point(level.levelMovementAnimation.velocity/2,0)
        running: level.levelMovementAnimation.running // start non-running, gets set to true in startGame
    }

    ParallaxScrollingBackground {
        id: levelBackground1
        //    property int initialOffsetx: -(levelBackground.image.width-scene.width)/2
        //    property int initialOffsety: -(levelBackground.image.height-scene.height)/2
        //    x: initialOffsetx
        //    y: initialOffsety-level.y
        anchors.bottom: parent.bottom
        height: 200
        //   y: parent.height-parent.gameWindowAnchorItem.height
        sourceImage: "../assets/bg3.png"
        // do not mirror it vertically, because the image is prepared to match on the top and the bottom
        mirrorSecondImage: false
        movementVelocity: Qt.point(level.levelMovementAnimation.velocity,0)
        running: level.levelMovementAnimation.running // start non-running, gets set to true in startGame
    }

    Level{
        id:level
    }

    Player{
        id:player
        x:150
        y:150
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Up) {
            console.log("move up");
            player.jump()
            event.accepted = true;
        }else if(event.key === Qt.Key_Space){
            player.launch()
            event.accepted = true;
        }
    }

    //record score
    FontLoader {
        id: fontHUD
        source: "fonts/pf_tempesta_seven_compressed.ttf"
    }

    RecordScore {
        id: record
    }

    //close or open the audio
    SetSwitch {
        id: swi
        x:700
    }

    //    GameOver {
    //        id: gameOver
    //        opacity: 0.8
    //    }
    RankingBorad{
        id: rankingBorad
        x: 1646
        y:7
    }

    Region{
        anchors.bottom: parent.bottom
    }
    Region1{
        anchors.left: parent.left
    }

    //    Component{
    //        id:gameover_window
    Rectangle{
        id: opensetting
        width: 600
        height: 400
        opacity: 0
        anchors.centerIn: parent
        color: Qt.rgba(255,255,255,0)
        TexturePackerAnimatedSprite{
            id:opensetting1

            anchors.fill: parent
            source: "../assets/img/PopupAssets.json"
            frameNames: ["PopupBackground0000"]

        }
        MenuText {
            y: 50
            text: qsTr("Game Over")
            font.pixelSize: 30
        }
        MenuText {
            id: scoreText
            y: 100
            font.pixelSize: 30
            text: qsTr("Your score: " + record.endScore)
        }
        Rectangle{

            TexturePackerAnimatedSprite{
                TexturePackerAnimatedSprite{
                    width: 50
                    height: 60
                    x:53
                    y:15
                    id:p
                    source: "../assets/img/font.json"
                    frameNames: ["P"]
                }
                TexturePackerAnimatedSprite{
                    id:l
                    width: 50
                    height: 60
                    anchors.left: p.right
                    anchors.top: p.top
                    source: "../assets/img/font.json"
                    frameNames: ["L"]
                }
                TexturePackerAnimatedSprite{
                    id:a
                    width: 50
                    height: 60
                    anchors.left: l.right
                    anchors.top: p.top
                    source: "../assets/img/font.json"
                    frameNames: ["A"]
                }
                TexturePackerAnimatedSprite{
                    id:y
                    width: 50
                    height: 60
                    anchors.left: a.right
                    anchors.top: p.top
                    source: "../assets/img/font.json"
                    frameNames: ["Y"]
                }
                width: 300
                height: 100
                id:restartbutton
                x:140
                y:150
                source: "../assets/img/MenuAssets.json"
                frameNames: ["StoneButton0000"]
                MouseArea{
                    id:playbutton
                    enabled: false
                    anchors.fill: parent
                    onPressed : {
                        restartbutton.frameNames=["StoneButton0001"]
                    }
                    onReleased: {
                        restartbutton.frameNames=["StoneButton0000"]
                        restartgame()

                    }
                }
            }
        }
        Rectangle{
            id:closesetting
            TexturePackerAnimatedSprite{
                TexturePackerAnimatedSprite{
                    width: 50
                    height: 60
                    x:53
                    y:15
                    id:e
                    source: "../assets/img/font.json"
                    frameNames: ["E"]
                }
                TexturePackerAnimatedSprite{
                    id:x
                    width: 50
                    height: 60
                    anchors.left: e.right
                    anchors.top: e.top
                    source: "../assets/img/font.json"
                    frameNames: ["X"]
                }
                TexturePackerAnimatedSprite{
                    id:i
                    width: 50
                    height: 60
                    anchors.left: x.right
                    anchors.top: e.top
                    source: "../assets/img/font.json"
                    frameNames: ["I"]
                }
                TexturePackerAnimatedSprite{
                    id:t
                    width: 50
                    height: 60
                    anchors.left: i.right
                    anchors.top: e.top
                    source: "../assets/img/font.json"
                    frameNames: ["T"]
                }
                id:closesetting1
                width: 300
                height: 100
                x:140
                y:250
                source: "../assets/img/MenuAssets.json"
                frameNames: ["StoneButton0000"]
                MouseArea{
                    id:okbutton
                    enabled: false
                    anchors.fill: parent
                    onPressed : {
                        closesetting1.frameNames=["StoneButton0001"]
                        //                            gamescene.visible=false
                        //                            startScene.visible=true

                    }
                    onReleased: {
                        closesetting1.frameNames=["StoneButton0000"]
                        Qt.quit()
                        //                            gamescene.opacity=0
                        //                            startScene.opacity=1
                        //                            bacground.opacity=1
                        //                            opensetting.width=360
                        //                            opensetting.height=240
                        //                            opensetting.z=0
                        //                            setbutton.enabled=true
                        //                            playbutton.enabled=true
                        //                            okbutton.enabled=false

                    }
                }
            }
        }

    }
    SoundEffect{
        id: deathSound
        source: "../assets/snd/Death.wav"
    }


}

