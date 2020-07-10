import QtQuick 2.0

import Felgo 3.0
EntityBase {
    id:region
    entityType: "region"

    BoxCollider{
        //        bodyType: Body.Static
        width: 1200
        height: 5
        density: 1000
        sensor: true
        //        categories: Box.Category9
        //        collidesWith: Box.Category10
        fixture.onBeginContact: {

        }

        //    BoxCollider {
        ////        id: fire_collider
        //        height: 1200
        //        width: 10
        //        restitution: 0
        //        friction: 0
        ////        x: 175
        ////        y: 178
        ////        force: Qt.point(0,800)
        //        categories: Box.Category2
        //        collidesWith: Box.Category1
        //        fixture.onBeginContact: {

        //        }

        //    }

    }
}
