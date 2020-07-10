import QtQuick 2.0

import Felgo 3.0
EntityBase {
    id:region
    entityType: "region"

    BoxCollider{
        bodyType: Body.Static
        width: 5
        height: 1000
        sensor: true
    }
}
