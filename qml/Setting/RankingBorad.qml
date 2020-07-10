import QtQuick 2.0
import Felgo 3.0

Item {

    id: item
    property int endScore: record.endScore
    property bool seeRank: false
    Storage {
        id: myLocalStorage
        Component.onCompleted: {
            console.log(record.endScore)
            var score = {id: 1, value: item.endScore, description: "Score"}
            clearAll()//Clear the before score
            if(!myLocalStorage.getValue(score.id)) {
                console.debug("storing the score object with id", score.id)

                // NOTE: no JSON.stringify() needed - it is called automatically in setValue()
                myLocalStorage.setValue(score.id, score)
            } else {
                console.debug("the score with id", score.id, "was already stored")
            }
        }
    }

    Scene {

        Image {
            id: rankingImage
            width: 28
            height: 27
//               x:940
//               anchors.top: parent.top
//               anchors.topMargin: 5
            z: 9
            source: "../../assets/img/ranking.png"
            MouseArea {
                anchors.fill: parent
                // with getValue we get the JavaScript score object
                // to display its content as a string, call stringify()
                // the output is '{"id":1,"value":100,"description":"Score"}'
                onClicked: {
                    seeRank = !seeRank//Modify negation
                    if (seeRank){
     //                   function startLoadingValue() {
                           scoreContent.text = "MaxHigh Score: " + JSON.stringify( myLocalStorage.getValue(1).value)
     //                   }
     //                   function successfullyLoadedCallback(result) {
     //                      console.debug("the result was:", result)
     //                    }
     //                   myLocalStorage.setValue(score.id, score)
                    }else {
                        scoreContent.text = ""
                    }

                }
            }
        }

        Text {
          id: scoreContent
          x: -70
          y: 40
          font.family: fontHUD.name
          color: "white"
        }
      }

}
