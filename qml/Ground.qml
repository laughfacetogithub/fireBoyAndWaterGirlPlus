import QtQuick 2.0
import Felgo 3.0

Item {


    Timer{
        id: push_timer

        property var gw: []

        //自定义数组对象来保存动态创建的矩形
        property var pt: []

        //定时器运行时间属性单位毫秒
        interval: 200

        //开始就触发定时器
        running: true

        //不断重复
        repeat: true



        property int pt_j: 0
        property int pt_k: 0
        property int gw_j: 0
        property int gw_k: 0
        property int current_x: 0
        property int current_y: 0
        property int next_x: 0
        property int next_y: 400
        property int random_y: 0
        property int random_pt: 0
        property int random_three_max: 4
         property int random_two_max: 6
         property int random_one_max: 8
        property int max_a: 10

        //定时器触发时来执行脚本
        onTriggered: {

            destroy_timer.running = true
            timer.running = true
            if(pt_j - destroy_timer.j  < 50)
            for(var a = 0; a < 30; a++){
                if(random_pt < random_three_max && random_pt >= 0){


                    pt.push(creatpt_three())
                    pt[pt_j].x = next_x
                    pt[pt_j].y = next_y
                    pt_j++

                    current_x = next_x
                    next_x = current_x + utils.generateRandomValueBetween(120,320) + 822

                    current_y = next_y
                    random_y = utils.generateRandomValueBetween(60,90)
                    if(next_y + random_y > 450){
                        next_y -= random_y
                    }else{
                        next_y += random_y
                    }
                }else if(random_pt > random_three_max && random_pt < random_two_max){
                    pt.push(creatpt_two());
                    pt[pt_j].x = next_x
                    pt[pt_j].y = next_y
                    pt_j++

                    current_x = next_x
                    next_x = current_x + utils.generateRandomValueBetween(120,320) + 563

                    current_y = next_y
                    random_y = utils.generateRandomValueBetween(60,90)
                    if(next_y + random_y > 500){
                        next_y -= random_y
                    }else{
                        next_y += random_y
                    }
                }else if(random_pt > random_two_max && random_pt < random_one_max){
                    pt.push(creatpt_one());
                    pt[pt_j].x = next_x
                    pt[pt_j].y = next_y
                    pt_j++

                    current_x = next_x
                    next_x = current_x + utils.generateRandomValueBetween(120,320) + 304

                    current_y = next_y
                    random_y = utils.generateRandomValueBetween(60,90)
                    if(next_y + random_y > 500){
                        next_y -= random_y
                    }else{
                        next_y += random_y
                    }
                }

                random_pt = utils.generateRandomValueBetween(0,random_one_max)
            }
        }

        function creatpw(){
            var obj=gw.createObject(gamescene,{});
            return obj;
                }
        function creatpt_three(){
            var obj = pt_three.createObject(gamescene,{});
            return obj;
        }

        function creatpt_two(){
            var obj = pt_two.createObject(gamescene,{});
            return obj;
        }

        function creatpt_one(){
            var obj = pt_one.createObject(gamescene,{});
            return obj;
        }


    }

    Timer{
        id:destroy_timer

        //定时器运行时间属性单位毫秒
        interval: 100

        //开始就触发定时器
        running: false

        //不断重复
        repeat: true

        property int j: 0
        onTriggered: {
            for(var i = 0; i < 1; i++){
                if(push_timer.pt[j].x < -1500){
                    push_timer.pt[j].destroy();
                    j++
                    console.log("12323123123213213123123232324")
                }
            }
        }
    }

    Timer{
        id:timer

        //定时器运行时间属性单位毫秒
        interval: 100

        //开始就触发定时器
        running: false

        //不断重复
        repeat: true

        property int i: 1
        onTriggered: {
            if(push_timer.random_one_max < 30){
                push_timer.random_two_max ++
                push_timer.random_one_max += 2
                console.log("pppppppppppppppppppp",push_timer.random_one_max,push_timer.random_two_max)
            }else repeat = false
        }
    }
    Timer{
                property  int  r: 0
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            r=utils.generateRandomValueBetween(1,100)
            if(r<50){
            gw.createObject(gamescene,{})
//                        pt[gw_j].x=next_x
//                        pt[gw_j].y=100
//                        pt_j++
            }
        }
    }
    Timer{
        property int k: 0
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            k=utils.generateRandomValueBetween(1,100)
            if(k<90)
                gw1.createObject(gamescene,{})
        }
    }

//    Component{
//        id:enemy
//        EntityBase{
//            entityType: "enemy"
//            x:800
//            y:150
//            TexturePackerAnimatedSprite{
//                id:gw1
//                width: 75
//                height: 115
//                source: "../assets/img/gw1.json"
//                frameNames: ["enemy-0.png","enemy-1.png","enemy-2.png","enemy-3.png","enemy-4.png","enemy-5.png","enemy-6.png","enemy-7.png","enemy-8.png"]
//                frameRate: 5
//                BoxCollider{
////                    width: 75
////                    height: 115
//                    anchors.fill: enemy
////                        force: Qt.point(0,900)
//                }
//            }
//        }
//    }
    Component{
        id:gw1
        EntityBase{
            entityType: "gw"
            x:800
            y:180
            TexturePackerAnimatedSprite{
                                width: 75
                                height: 115
            source: "../assets/img/gw1.json"
            frameNames: ["enemy-0.png","enemy-1.png","enemy-2.png","enemy-3.png","enemy-4.png","enemy-5.png","enemy-6.png","enemy-7.png","enemy-8.png"]
            frameRate: 5
            }
            BoxCollider{
                width: 70
                height: 110
                anchors.fill: gw1
//                anchors.bottom: gw1.bottom
                force: Qt.point(0,10000)
            linearVelocity:Qt.point(linearVelocity.x=-400)
            onLinearVelocityChanged: {
              if(linearVelocity.y > 0) linearVelocity.y = 0
            }
            }
        }
    }
    Component{
        id:gw
        EntityBase{
            entityType: "gw"
            x:700
            y:100
            TexturePackerAnimatedSprite{
            source: "../assets/img/gw2.json"
            frameNames: ["crow-0.png","crow-1.png","crow-2.png","crow-3.png","crow-4.png","crow-5.png","crow-6.png"]
            frameRate: 8
            }
            BoxCollider{
//                width: 80
//                height: 80
                anchors.fill: gw
            linearVelocity:Qt.point(linearVelocity.x=-100)
            onLinearVelocityChanged: {
              if(linearVelocity.y > 0) linearVelocity.y = 0
            }
            }
        }
    }
    Component{
        id: pt_three

        EntityBase{
//            id:pt_three
            entityType: "pt"
            Rectangle{
                id:ground
                Image {
                    id:bam_left
                    source: "../assets/img/bam_left.png"
                }
                Image {
                    id:bam_mid1
                    anchors.left:bam_left.right
                    source: "../assets/img/bam_mid.png"
                }
                Image {
                    id:bam_mid2
                    anchors.left: bam_mid1.right
                    source: "../assets/img/bam_mid.png"
                }
                Image {
                    id:bam_mid3
                    anchors.left: bam_mid2.right
                    source: "../assets/img/bam_mid.png"
                }
                Image {
                    id: bam_right
                    anchors.left: bam_mid3.right
                    source: "../assets/img/bam_right.png"
                }
            }

            BoxCollider{
                width: 822
                height: 50
//                bodyType: Body.Static
//                anchors.left: bam_left.left
//                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-450)
                density: 15000
                onLinearVelocityChanged: {
                  if(linearVelocity.y > 0) linearVelocity.y = 0
                }
            }
        }
    }

    Component{
        id: pt_two

        EntityBase{
            entityType: "pt"
            Rectangle{
                id:ground
                Image {
                    id:bam_left
                    source: "../assets/img/bam_left.png"
                }
                Image {
                    id:bam_mid1
                    anchors.left:bam_left.right
                    source: "../assets/img/bam_mid.png"
                }
                Image {
                    id:bam_mid2
                    anchors.left: bam_mid1.right
                    source: "../assets/img/bam_mid.png"
                }
                Image {
                    id: bam_right
                    anchors.left: bam_mid2.right
                    source: "../assets/img/bam_right.png"
                }
            }

            BoxCollider{
                width: 563
                height: 50
//                anchors.left: bam_left.left
//                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-450)
                density: 15000
                onLinearVelocityChanged: {
                  if(linearVelocity.y > 0) linearVelocity.y = 0
                }
            }
        }
    }

    Component{
        id: pt_one

        EntityBase{
            entityType: "pt"
            Rectangle{
                id:ground
                Image {
                    id:bam_left
                    source: "../assets/img/bam_left.png"
                }
                Image {
                    id:bam_mid
                    anchors.left:bam_left.right
                    source: "../assets/img/bam_mid.png"
                }

                Image {
                    id: bam_right
                    anchors.left: bam_mid.right
                    source: "../assets/img/bam_right.png"
                }
            }

            BoxCollider{
                width: 304
                height: 50
//                anchors.left: bam_left.left
//                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-450)
                density: 15000

                onLinearVelocityChanged: {
                  if(linearVelocity.y > 0) linearVelocity.y = 0
                }
            }
        }
    }
}





