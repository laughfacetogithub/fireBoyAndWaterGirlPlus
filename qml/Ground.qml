/**
 * Author:group 10
 * Date:2020-07-08
 * Describe: ground
 */

import QtQuick 2.0
import Felgo 3.0

Item {
    property alias destroy_timer: destroy_timer
    property alias gw_timer: gw_timer
    property alias gw1_timer: gw1_timer

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

    function gw_1(){
        var obj = gw1.createObject(gamescene,{});
        return obj;
    }

    function creatpt_blood(){
        var obj = blood.createObject(gamescene,{});
        return obj;
    }

    Timer{
        id: push_timer

        property var blo: []

        //自定义数组对象来保存动态创建的矩形
        property var pt: []

        //定时器运行时间属性单位毫秒
        interval: 300

        //开始就触发定时器
        running: true

        //不断重复
        repeat: true

        property int pt_j: 0
        property int pt_k: 0
        property int blo_j: 0
        property int blo_k: 0
        property int current_x: 0
        property int current_y: 0
        property int next_x: 0
        property int next_y: 600
        property int random_y: 0
        property int random_pt: 0
        property int random_three_max: 5
        property int random_two_max: 10
        property int random_one_max: 15


        //定时器触发时来执行脚本
        onTriggered: {
            timer.running = true

            for(var a = 0; a < 1; a++){


                if(random_pt < random_three_max && random_pt >= 0){


                    pt.push(creatpt_three());
                    pt[pt_j].x = next_x
                    pt[pt_j].y = next_y
                    pt_j++

                    if(utils.generateRandomValueBetween(1,26) <= 2){
                        blo.push(creatpt_blood());
                        blo[blo_j].x = next_x + utils.generateRandomValueBetween(170,700)
                        blo[blo_j].y = next_y - 50
                        //c
                        blo_j++
                    }

                    current_x = next_x
                    next_x = current_x + utils.generateRandomValueBetween(150,170) + 822

                    current_y = next_y
                    random_y = utils.generateRandomValueBetween(30,90)
                    if(next_y + random_y > 700){
                        next_y -= random_y
                    }else{
                        next_y += random_y
                    }

                }else if(random_pt > random_three_max && random_pt < random_two_max){
                    pt.push(creatpt_two());
                    pt[pt_j].x = next_x
                    pt[pt_j].y = next_y
                    pt_j++

                    if(utils.generateRandomValueBetween(1,26) <= 2){
                        blo.push(creatpt_blood());
                        blo[blo_j].x = next_x + utils.generateRandomValueBetween(100,400)
                        blo[blo_j].y = next_y - 50
                        //c
                        blo_j++
                    }

                    current_x = next_x
                    next_x = current_x + utils.generateRandomValueBetween(140,160) + 563

                    current_y = next_y
                    random_y = utils.generateRandomValueBetween(30,90)
                    if(next_y + random_y > 700){
                        next_y -= random_y
                    }else{
                        next_y += random_y
                    }
                }else if(random_pt > random_two_max && random_pt < random_one_max){
                    pt.push(creatpt_one());
                    pt[pt_j].x = next_x
                    pt[pt_j].y = next_y
                    pt_j++

                    if(utils.generateRandomValueBetween(1,26) <= 2){
                        blo.push(creatpt_blood());
                        blo[blo_j].x = next_x + utils.generateRandomValueBetween(100,200)
                        blo[blo_j].y = next_y - 50
                        //c
                        blo_j++
                    }

                    current_x = next_x
                    next_x = current_x + utils.generateRandomValueBetween(130,140) + 304

                    current_y = next_y
                    random_y = utils.generateRandomValueBetween(30,90)
                    if(next_y + random_y > 700){
                        next_y -= random_y
                    }else{
                        next_y += random_y
                    }
                }

                random_pt = utils.generateRandomValueBetween(1,random_one_max)
            }
        }
    }

    Timer{
        id:destroy_timer

        //定时器运行时间属性单位毫秒
        interval: 1

        //开始就触发定时器
        running: false

        //不断重复
        repeat: true

        property int j: 0
        onTriggered: {
            for(var i = 0; i < 1000; i++){
                if(push_timer.pt[j].x < -900){
                    push_timer.pt[j].destroy();
                    j++
                }else break
            }
        }
    }

    Timer{
        id:timer

        //定时器运行时间属性单位毫秒
        interval: 1000

        //开始就触发定时器
        running: false

        //不断重复
        repeat: true

        property int i: 1
        onTriggered: {
            if(push_timer.random_one_max < 30){
                push_timer.random_two_max ++
                push_timer.random_one_max += 2
            }else if(push_timer.random_one_max < 60){
                push_timer.random_one_max += 2
            }else if(push_timer.random_one_max > 70){
                repeat = false
            }
        }
    }

    Timer{
        id: gw_timer
        property  int  r: 0
        interval: 5000
        running: false
        repeat: true
        onTriggered: {
            r=utils.generateRandomValueBetween(1,100)
            if(r<50){
                gw.createObject(gamescene,{})
            }
        }
    }

    Timer{
        id: gw1_timer
        property int k: 0
        interval: 5000
        running: false
        repeat: true
        onTriggered: {
            k=utils.generateRandomValueBetween(1,100)
            if(k>10)
                gw1.createObject(gamescene,{})
        }
    }

    Component{
        id:gw1
        Item {
            id: item
            EntityBase{
                id:gw1_base
                x: 1900
                y: 485
                width: 75
                height: 115
                TexturePackerAnimatedSprite{
                    anchors.fill: parent
                    source: "../assets/img/gw1.json"
                    frameNames: ["enemy-0.png","enemy-1.png","enemy-2.png","enemy-3.png","enemy-4.png","enemy-5.png","enemy-6.png","enemy-7.png","enemy-8.png"]
                    frameRate: 5
                }


                BoxCollider{
                    width: 59
                    height: 110
                    anchors.fill:parent
                    //                    anchors.left: parent.left
                    //                    anchors.top: parent.top
                    //                    force: Qt.point(0,920)
                    //                    linearVelocity: Qt.point(linearVelocity.x = -520)
                    categories: Box.Category5
                    collidesWith: Box.Category3 | Box.Category6
                    fixture.onBeginContact: {
                        gw1_base.opacity = 0
                        gw1_base.y += 1000
                    }

                }

                BoxCollider{
                    id: gw1_dc
                    width: 70
                    height: 110
                    anchors.fill: parent
                    force: Qt.point(0,800)
                    linearVelocity:Qt.point(linearVelocity.x = -490)
                    categories: Box.Category4
                    collidesWith: Box.Category1
                    fixture.onEndContact: {
                        if(linearVelocity.y < 150){
                            linearVelocity.x = -800
                            linearVelocity.y = - 500
                        }
                    }
                }
            }

        }
    }

    Component{
        id:gw
        EntityBase{
            id: gw_base
            x: 2000
            y: utils.generateRandomValueBetween(250,500)
            TexturePackerAnimatedSprite{
                source: "../assets/img/gw2.json"
                frameNames: ["crow-0.png","crow-1.png","crow-2.png","crow-3.png","crow-4.png","crow-5.png","crow-6.png"]
                frameRate: 8
            }

            BoxCollider{
                sensor: true
                width: 80
                height: 80
                force: Qt.point(0,0)
                linearVelocity:Qt.point(linearVelocity.x = -500)
                categories: Box.Category5
                collidesWith: Box.Category3 | Box.Category6
                fixture.onBeginContact: {
                    gw_base.opacity = 0
                    gw_base.y -= 1000
                }
            }
        }
    }

    Component{
        id: blood
        EntityBase{
            id: b_base
            entityType: "biood"
            Image {
                source: "../assets/img/blood.png"
            }
            BoxCollider{
                width: 60
                height: 50
                //                force: Qt.point(0,300)
                linearVelocity:Qt.point(linearVelocity.x = -450)
                categories: Box.Category8
                collidesWith: Box.Category7
                fixture.onBeginContact: {
                    b_base.opacity = 0
                    b_base.y += 1000
                }
            }
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
                friction: 0
                width: 822
                height: 50
                density: 10000
                anchors.left: bam_left.left
                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-450)
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category4

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
                friction: 0
                width: 563
                height: 50
                density: 10000
                anchors.left: bam_left.left
                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-450)
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category4
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
                friction: 0
                width: 304
                height: 50
                density: 10000
                anchors.left: bam_left.left
                anchors.right: bam_right.right
                linearVelocity:Qt.point(linearVelocity.x=-450)
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category4
            }
        }
    }
}





