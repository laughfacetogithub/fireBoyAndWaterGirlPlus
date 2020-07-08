//author:2018051604121lijiangshun
//date:2020-6-18
//火人在不同状态的的动态效果

import QtQuick 2.13
import Felgo 3.0


EntityBase {
    id: player
    entityType: "player"
    property int contacts: 0

    signal contact
//    width: 60
//    height: 15
    property  alias f_collider:fire_collider


    function upmoveFire(){
        idle_fire.opacity = 0
        jumping_fire.opacity = 0
        falling_fire.opacity = 0
        rising_fire.opacity = 1
        fire_collider.linearVelocity.y = -360
    }function rightjumpingmoveFire(){
        idle_fire.opacity = 0
        jumping_fire.opacity = 1
        falling_fire.opacity = 0
        rising_fire.opacity = 0
        jumping_fire_head.mirrorX = false
        jumping_fire_legs.mirrorX = false
        fire_collider.linearVelocity.y = -320
      //  fire_collider.linearVelocity.x = 100
    }function leftjumpingmoveFire(){
        idle_fire.opacity = 0
        jumping_fire.opacity = 1
        falling_fire.opacity = 0
        rising_fire.opacity = 0
        jumping_fire_head.mirrorX = true
        jumping_fire_legs.mirrorX = true
        fire_collider.linearVelocity.y = -320
      //  fire_collider.linearVelocity.x = -100
    }

    function downmoveFire(){
        idle_fire.opacity = 0
        jumping_fire.opacity = 0
        falling_fire.opacity = 1
        rising_fire.opacity = 0
       // fire_collider.linearVelocity.y=100

    }

    function leftmoveFire(){
        idle_fire.opacity = 0
        jumping_fire.opacity = 1
        falling_fire.opacity = 0
        rising_fire.opacity = 0
        jumping_fire_head.mirrorX = true
        jumping_fire_legs.mirrorX = true
        fire_collider.linearVelocity.x = -140
    }

    function rightmoveFire(){
        idle_fire.opacity = 0
        jumping_fire.opacity = 1
        falling_fire.opacity = 0
        rising_fire.opacity = 0
        jumping_fire_head.mirrorX = false
        jumping_fire_legs.mirrorX = false
        fire_collider.linearVelocity.x = 140
    }

    function idleFire(){
        idle_fire.opacity = 1
        jumping_fire.opacity = 0
        falling_fire.opacity = 0
        rising_fire.opacity = 0
        fire_collider.linearVelocity.x = 0

    }

    Image {
        id: idle_fire
        opacity: 0
//        width: 20
//        height: 40


        TexturePackerAnimatedSprite{
                        width:60
            height:75
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.verticalCenter: parent.verticalCenter
            id: idle_fire_head
            anchors.bottomMargin: idle_fire_legs.top
            source: "../assets/img/CharAssets.json"
            frameNames:["fire_head_idle0000", "fire_head_idle0001", "fire_head_idle0002", "fire_head_idle0003", "fire_head_idle0004", "fire_head_idle0005", "fire_head_idle0006", "fire_head_idle0007", "fire_head_idle0008", "fire_head_idle0009", "fire_head_idle0010", "fire_head_idle0011", "fire_head_idle0012", "fire_head_idle0013", "fire_head_idle0014", "fire_head_idle0015", "fire_head_idle0016", "fire_head_idle0017", "fire_head_idle0018"]
            frameRate: 30
        }

        TexturePackerAnimatedSprite{
                        width:60
            height:80
            id: idle_fire_legs
//            anchors.top: idle_fire_head.bottom
            anchors.horizontalCenter: idle_fire_head.horizontalCenter
            source: "../assets/img/CharAssets.json"
            frameNames: ["fire_legs_idle0000"]
            frameRate: 30
        }
    }

    Image {
        id: jumping_fire
        opacity: 1
        TexturePackerAnimatedSprite{
                        width:140
            height:140
            id: jumping_fire_head
            anchors.verticalCenter: jumping_fire_legs.verticalCenter
            anchors.horizontalCenter: jumping_fire_legs.horizontalCenter
            source: "../assets/img/CharAssets.json"
            frameNames: ["fire_head_jumping0000", "fire_head_jumping0001", "fire_head_jumping0002", "fire_head_jumping0003", "fire_head_jumping0004", "fire_head_jumping0005", "fire_head_jumping0006", "fire_head_jumping0007", "fire_head_jumping0008", "fire_head_jumping0009", "fire_head_jumping0010"]
            frameRate: 30
        }

        TexturePackerAnimatedSprite{
                        width:120
            height:180
            id: jumping_fire_legs
            anchors.bottom:  idle_fire.bottom
            source: "../assets/img/CharAssets.json"
            frameNames: ["fire_legs_running0000", "fire_legs_running0001", "fire_legs_running0002", "fire_legs_running0003", "fire_legs_running0004", "fire_legs_running0005", "fire_legs_running0006", "fire_legs_running0007"]
            frameRate: 30
        }

    }

    Image {
        id: falling_fire
        opacity: 0
        TexturePackerAnimatedSprite{
                        width:120
            height:150
            id: falling_fire_head
            anchors.verticalCenter:  rising_fire_legs.verticalCenter
            anchors.horizontalCenter: falling_fire_legs.horizontalCenter
            source: "../assets/img/CharAssets.json"
            frameNames: ["fire_head_falling0000", "fire_head_falling0001", "fire_head_falling0002", "fire_head_falling0003", "fire_head_falling0004"]
            frameRate: 30
        }

        TexturePackerAnimatedSprite{
                        width:120
            height:160
            id: falling_fire_legs
            anchors.bottom: idle_fire.bottom
            source: "../assets/img/CharAssets.json"
            frameNames: ["fire_legs_idle0000"]
            frameRate: 30
        }


    }

    Image {
        id: rising_fire
        opacity: 0
        TexturePackerAnimatedSprite{
                        width:60
            height:75
            id: rising_fire_head
            anchors.verticalCenter:  rising_fire_legs.verticalCenter
            anchors.horizontalCenter: rising_fire_legs.horizontalCenter
            source: "../assets/img/CharAssets.json"
            frameNames: ["fire_head_rising0000", "fire_head_rising0001", "fire_head_rising0002", "fire_head_rising0003", "fire_head_rising0004"]
            frameRate: 30
        }

        TexturePackerAnimatedSprite{
                        width:60
            height:80
            id: rising_fire_legs
            anchors.bottom: idle_fire.bottom
            source: "../assets/img/CharAssets.json"
            frameNames: ["fire_legs_idle0000"]
            frameRate: 30
        }


    }
    Image {
        id: dead_fire
        opacity: 0
        TexturePackerAnimatedSprite{
        source: "../assets/img/CharAssets.json"
        frameNames: []
        }
    }

    //    TexturePackerAnimatedSprite{
    //        id: ice_fire_legs
    //        anchors.top: idle_fire_legs
    //        source: "../assets/img/CharAssets.json"
    //        frameNames: ["fire_ice_legs0000", "fire_ice_legs0001", "fire_ice_legs0002"]
    //        frameRate: 30
    //    }

    TexturePackerAnimatedSprite{
                    width:60
            height:75
        opacity: 0
        id: stairs_fire
        source: "../assets/img/CharAssets.json"
        frameNames: ["fire_stairs0000", "fire_stairs0001", "fire_stairs0002", "fire_stairs0003", "fire_stairs0004", "fire_stairs0005", "fire_stairs0006", "fire_stairs0007", "fire_stairs0008", "fire_stairs0009", "fire_stairs0010", "fire_stairs0011", "fire_stairs0012", "fire_stairs0013", "fire_stairs0014", "fire_stairs0015", "fire_stairs0016", "fire_stairs0017", "fire_stairs0018", "fire_stairs0019", "fire_stairs0020", "fire_stairs0021", "fire_stairs0022", "fire_stairs0023", "fire_stairs0024", "fire_stairs0025", "fire_stairs0026", "fire_stairs0027", "fire_stairs0028", "fire_stairs0029"]
    }


      BoxCollider {
//        collidesWith: null
    id: fire_collider
    height: 80
    restitution: 0
    width: 60
    linearVelocity: Qt.point(0,0)
//    anchors.fill: dead_fire
    y:50
    x:25
    friction: 0
    force: Qt.point(0,900)
//    anchors.fill: idle_fire
//    anchors.top:  idle_fire_legs.bottom-20
  //  anchors.horizontalCenter: idle_fire_head.horizontalCenter
    bodyType: Body.Dynamic

    fixture.onBeginContact: {
//        idleFire()
    }

//      var otherEntity = other.getBody().target
//      if(otherEntity.entityType === "player") {
//        console.debug("contact platform begin")

        // increase the number of active contacts the player has
//        player.contacts++
//          contact()

//      }
//    }

}


}
