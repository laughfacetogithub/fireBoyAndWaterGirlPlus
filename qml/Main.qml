/**
 * Author:group 10
 * Date:2020-07-08
 * Describe: main scene
 */

import Felgo 3.0
import QtQuick 2.0

GameWindow {

    id: gameWindow

    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"


    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    screenWidth: 1080
    screenHeight: 640
    activeScene: gamescene
    StartScene {
        id: startScene
        opacity: 0
    }
    GameScene{
        id:gamescene
        opacity: 0
    }
    EntityManager {
        id: entityManager
        entityContainer: gamescene.entityContainer
        poolingEnabled: true // entity pooling works since version 0.9.4, so use it
    }
    state: "start"
    states:[
        State {
            name: "start"
            PropertyChanges {
                target: {
                    startScene.opacity = 1
                }
            }
        },State {
            name: "game"
            PropertyChanges {

                target: {
                    gamescene.level.ground.destroy_timer.running = true
                    gamescene.level.ground.gw_timer.running = true
                    gamescene.level.ground.gw1_timer.running = true
                    gamescene.record.score_timer.running = true
                    gamescene.opacity = 1
                    gamescene.level.startGame()
                }
            }
        }
    ]
}
