/**
 * Author:group 10
 * Date:2020-07-08
 * Describe: creat hero running and shoot bullet.
 */

import QtQuick 2.13
import Felgo 3.0

Item {
    id: player

    property int jumps:  2
    property  alias f_collider:fire_collider
    property alias jumping_fire: jumping_fire
    property alias jumping_water: jumping_water
    property  alias person: person

    //Save the all status sound
//    property alias jumpSound : jumpSound
//    property alias shootSound : shootSound
//    property alias colliderSound : colliderSound
//    property alias runSound : runSound
//    property alias deathSound : deathSound
//    property alias diamondSound : diamondSound

    function reset(){
        player.x=150
        player.y=150
        player.f_collider.linearVelocity=Qt.point(0,0)
    }


    function jump(){
        if(jumps>=1){
            runSound.stop()
            jumpSound.play()//open the jumping sound
            fire_collider.linearVelocity.y=-600
            jumps--
        }
    }


    property var bulle:[]
    property int j: 0
    property var bet
    function launch(){
        shootSound.play()//sound of shoot the bullet
        if(jumping_fire.opacity===1)bet = bullet.createObject(gamescene,{})
        else if(jumping_water.opacity===1) bet=bullet1.createObject(gamescene,{})
        bulle.push(bet)
        bulle[j].y = person.y + 200
        bulle[j].x = person.x + 170
        j++
    }

    EntityBase {
        id: person
        entityType: "player"
        property int contacts: 0

        signal contact

        function resetting(){
            person.x = 0
            person.y = 50
            imge_0.opacity = 1
            imge_1.opacity = 1
            imge_2.opacity = 1
            imge_3.opacity = 0
            imge_4.opacity = 0
            imge_5.opacity = 0
            imge_6.opacity = 0
            imge_7.opacity = 0
            fire_collider.linearVelocity.x = 0
            fire_collider.linearVelocity.y = 0
            fire_collider.force = Qt.point(0,1100)
        }

        Image {
            id: idle_fire
            opacity: 0

            TexturePackerAnimatedSprite{
                width:120
                height:150
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: idle_fire_head

                source: "../assets/img/CharAssets.json"
                frameNames:["fire_head_idle0000", "fire_head_idle0001", "fire_head_idle0002", "fire_head_idle0003", "fire_head_idle0004", "fire_head_idle0005", "fire_head_idle0006", "fire_head_idle0007", "fire_head_idle0008", "fire_head_idle0009", "fire_head_idle0010", "fire_head_idle0011", "fire_head_idle0012", "fire_head_idle0013", "fire_head_idle0014", "fire_head_idle0015", "fire_head_idle0016", "fire_head_idle0017", "fire_head_idle0018"]
                frameRate: 30
            }

            TexturePackerAnimatedSprite{
                width:120
                height:160
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
                y: 50
                width:140
                height:150
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
            id: jumping_water
            opacity: 0
            TexturePackerAnimatedSprite{
                width:140
                height:160
                id: jumping_water_head
                anchors.bottom: jumping_fire_legs.top
                //                anchors.verticalCenter: jumping_fire_legs.verticalCenter
                anchors.horizontalCenter: jumping_water_legs.horizontalCenter
                source: "../assets/img/CharAssets.json"
                frameNames: ["water_head_jumping0000", "water_head_jumping0001", "water_head_jumping0002", "water_head_jumping0003", "water_head_jumping0004", "water_head_jumping0005", "water_head_jumping0006", "water_head_jumping0007", "water_head_jumping0008", "water_head_jumping0009", "water_head_jumping0010"]
                frameRate: 30
            }

            TexturePackerAnimatedSprite{
                width:120
                height:180
                id: jumping_water_legs
                anchors.bottom:  fire_collider.bottom
                source: "../assets/img/CharAssets.json"
                frameNames: ["water_legs_running0000", "water_legs_running0001", "water_legs_running0002", "water_legs_running0003", "water_legs_running0004", "water_legs_running0005", "water_legs_running0006", "water_legs_running0007"]
                frameRate: 30
            }

        }

        BoxCollider {
            id: fire_collider
            height: 80
            width: 60
            restitution: 0
            friction: 0
            x: 175
            y: 200
            force: Qt.point(0,1100)
            categories: Box.Category2
            collidesWith: Box.Category1
            fixture.onBeginContact: {
                runSound.play()
                var otherEntity = other.getBody().target
                if(otherEntity.entityType === "region") {
                    gameover()
                }
                if(otherEntity.entityType==="pt")jumps=2
            }

        }
    }


    Rectangle{
        x: -120
        y: -90
        Image {
            id: imge_0
            z: 1
            opacity:1
            source: "../assets/img/blood.png"
        }
        Image {
            id: imge_1
            z: 2
            opacity: 1
            anchors.horizontalCenter: imge_0.right
            source: "../assets/img/blood.png"
        }
        Image {
            id: imge_2
            z: 3
            opacity: 1
            anchors.horizontalCenter: imge_1.right
            source: "../assets/img/blood.png"
        }
        Image {
            id: imge_3
            z: 4
            opacity: 0
            anchors.horizontalCenter: imge_2.right
            source: "../assets/img/blood.png"
        }
        Image {
            id: imge_4
            z: 5
            opacity: 0
            anchors.horizontalCenter: imge_3.right
            source: "../assets/img/blood.png"
        }
        Image {
            id: imge_5
            z: 6
            opacity: 0
            anchors.horizontalCenter: imge_4.right
            source: "../assets/img/blood.png"
        }
        Image {
            id: imge_6
            z: 7
            opacity: 0
            anchors.horizontalCenter: imge_5.right
            source: "../assets/img/blood.png"
        }
        Image {
            id: imge_7
            z: 8
            opacity: 0
            anchors.horizontalCenter: imge_6.right
            source: "../assets/img/blood.png"
        }
    }

    property int health: 3

    EntityBase{

        anchors.left: person.left
        anchors.top: person.top

        BoxCollider {
            sensor: true
            height: 80
            width: 60
            restitution: 0
            friction: 0
            x: 175
            y: 200
            anchors.left: fire_collider.left
            anchors.top:  fire_collider.top
            categories: Box.Category7
            collidesWith: Box.Category8
            fixture.onBeginContact: {
                //Eat the diamond sound
                diamondSound.play()
                health++
                if(health === 2){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 0
                    imge_3.opacity = 0
                    imge_4.opacity = 0
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 3){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 0
                    imge_4.opacity = 0
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 4){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 0
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 5){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 1
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 6){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 1
                    imge_5.opacity = 1
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 7){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 1
                    imge_5.opacity = 1
                    imge_6.opacity = 1
                    imge_7.opacity = 0
                }else if(health === 8){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 1
                    imge_5.opacity = 1
                    imge_6.opacity = 1
                    imge_7.opacity = 1
                }
            }
        }
    }

    EntityBase{
        anchors.left: person.left
        anchors.top: person.top
        BoxCollider {
            height: 80
            width: 60
            restitution: 0
            friction: 0
            x: 175
            y: 200
            anchors.left: fire_collider.left
            anchors.top:  fire_collider.top
            categories: Box.Category3
            collidesWith: Box.Category5
            fixture.onBeginContact: {
                if(health == 1){
                    fire_collider.force = Qt.point(0,1000)
                    person.x = -500
                    gameover()
                    //The sound of hero death
//                    deathSound.play()
                }
                health--
                if(health === 0){
                    imge_0.opacity = 0
                    imge_1.opacity = 0
                    imge_2.opacity = 0
                    imge_3.opacity = 0
                    imge_4.opacity = 0
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 1){
                    imge_0.opacity = 1
                    imge_1.opacity = 0
                    imge_2.opacity = 0
                    imge_3.opacity = 0
                    imge_4.opacity = 0
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 2){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 0
                    imge_3.opacity = 0
                    imge_4.opacity = 0
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 3){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 0
                    imge_4.opacity = 0
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 4){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 0
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 5){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 1
                    imge_5.opacity = 0
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 6){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 1
                    imge_5.opacity = 1
                    imge_6.opacity = 0
                    imge_7.opacity = 0
                }else if(health === 7){
                    imge_0.opacity = 1
                    imge_1.opacity = 1
                    imge_2.opacity = 1
                    imge_3.opacity = 1
                    imge_4.opacity = 1
                    imge_5.opacity = 1
                    imge_6.opacity = 1
                    imge_7.opacity = 0
                }
            }
        }
    }

    EntityBase{
        anchors.left: person.left
        anchors.top: person.top
        BoxCollider {
            height: 80
            width: 60
            restitution: 0
            friction: 0
            x: 175
            y: 200
            categories: Box.Category10
            collidesWith: Box.Category9
            fixture.onBeginContact: {
                fire_collider.force = Qt.point(0,0)
                person.x = -200
                gameover()
                //The sound of hero death
//                deathSound.play()
            }
        }
    }



    Component{
        id: bullet

        EntityBase{
            id: bullet_base
            entityType: "bt"
            width: 40
            height: 50
            TexturePackerAnimatedSprite {
                rotation: -90
                anchors.fill: parent
                source: "../assets/img/TempleIcons.json"
                frameNames: ["fireIcon0002"]
            }

            BoxCollider{
                width: 40
                height: 22
                x:1
                y: 15
                id: d
                anchors.horizontalCenter: person.horizontalCenter
                sensor: true
                force: Qt.point(0,0)
                linearVelocity:Qt.point(linearVelocity.x = 500)
                categories: Box.Category6
                collidesWith: Box.Category5
                fixture.onBeginContact: {
                    //Collider sound
                    colliderSound.play()
                    bullet_base.opacity = 0
                    bullet_base.y += 3000
                }
            }

        }
    }

    Component{
        id: bullet1

        EntityBase{
            id: bullet_base1
            entityType: "bt"
            width: 40
            height: 50
            TexturePackerAnimatedSprite {
                rotation: -90
                anchors.fill: parent
                source: "../assets/img/TempleIcons.json"
                frameNames: ["waterIcon0002"]
            }

            BoxCollider{
                id: d
                width: 40
                height: 22
                x:1
                y: 15
                anchors.horizontalCenter: fire_collider.horizontalCenter
                sensor: true
                force: Qt.point(0,0)
                linearVelocity: Qt.point(linearVelocity.x = 500)
                categories: Box.Category6
                collidesWith: Box.Category5
                fixture.onBeginContact: {
                    colliderSound.play()
                    bullet_base.opacity = 0
                    bullet_base.y += 3000
                }
            }

        }
    }

    SoundEffect{
        id: jumpSound
        source: "../assets/snd/Jump_fb.wav"
    }
    SoundEffect{
        id: shootSound
        source: "../assets/snd/clickButton.wav"
    }
    SoundEffect{
        id: colliderSound
        source: "../assets/snd/bomb.wav"
    }
    SoundEffect{
        id: runSound
        source: "../assets/snd/run.wav"
    }
    SoundEffect{
        id: deathSound
        source: "../assets/snd/Death.wav"
    }
    SoundEffect{
        id: diamondSound
        source: "../assets/snd/Diamond.wav"
    }
}

