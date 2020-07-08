import Felgo 3.0
import QtQuick 2.0

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
    id:gamescene
    width: 1080
    height: 640
    PhysicsWorld{
        debugDrawVisible: true

    }

//    Timer{
//        id:timer
//    interval: 1000
//    running: false
//    repeat: true
//    onTriggered: {
//        level.levelMovementAnimation.velocity-=12
//        ground.collider.linearVelocity.x=level.levelMovementAnimation.velocity
// //       console.debug("11")
//    }}
    Image {
        id: name
        source: "../assets/bg1.jpg"
        anchors.fill: parent
//        MouseArea{
//        anchors.fill: parent
//        onClicked: level.startGame()
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

    Level{id:level
     }

}
