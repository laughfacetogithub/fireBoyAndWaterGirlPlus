import QtQuick 2.0
import Felgo 3.0

EntityBase{
    entityType: "ground"

    //    Image {
    //        id:bam_left
    //        source: "../assets/img/bam_left.png"
    //    }
    //    Image {
    //        id:bam_mid1
    //        anchors.left:bam_left.right
    //        source: "../assets/bam_mid.png"
    //    }
    //    Image {
    //        id:bam_mid2
    //        anchors.left: bam_mid1.right
    //        source: "../assets/bam_mid.png"
    //    }
    //    Image {
    //        id:bam_mid3
    //        anchors.left: bam_mid2.right
    //        source: "../assets/bam_mid.png"
    //    }
    //    Image {
    //        id: bam_right
    //        anchors.left: bam_mid3.right
    //        source: "../assets/img/bam_right.png"
    //    }

    //    BoxCollider{
    //        width: 900
    //        height: 50
    //        friction: 0
    //        id:collider
    //        anchors.left: bam_left.left
    //        anchors.right: bam_right.right
    //        anchors.top: bam_left.bottom
    //    }

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
         property int random_two_max: 5
         property int random_one_max: 5
        property int max_a: 10
        //定时器触发时来执行脚本
        onTriggered: {
            destroy_timer.running = true
            timer.running = true
            if(pt_j - destroy_timer.j  < 50)
            for(var a = 0; a < 30; a++){
                if(random_pt < random_three_max && random_pt >= 0){
                    pt.push(creatpt_three());
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


        function creatpt_three(){
            var obj = pt_three.createObject(gamescene,{});
            console.log("ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc,k")
            return obj;
        }

        function creatpt_two(){
            var obj = pt_two.createObject(gamescene,{});
            console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
            return obj;
        }

        function creatpt_one(){
            var obj = pt_one.createObject(gamescene,{});
            console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
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

    Component{
        id: pt_three

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
                    source: "../assets/bam_mid.png"
                }
                Image {
                    id:bam_mid2
                    anchors.left: bam_mid1.right
                    source: "../assets/bam_mid.png"
                }
                Image {
                    id:bam_mid3
                    anchors.left: bam_mid2.right
                    source: "../assets/bam_mid.png"
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
                anchors.left: bam_left.left
                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-550)
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
                    source: "../assets/bam_mid.png"
                }
                Image {
                    id:bam_mid2
                    anchors.left: bam_mid1.right
                    source: "../assets/bam_mid.png"
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
                anchors.left: bam_left.left
                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-550)
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
                    source: "../assets/bam_mid.png"
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
                anchors.left: bam_left.left
                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-550)
            }
        }
    }
}





