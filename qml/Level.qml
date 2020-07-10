import QtQuick 2.0

import Felgo 3.0
import "scripts/levelLogic.js" as LevelLogic

// the level gets moved in the negative y direction (so upwards)
Item {
    id: level
    // use the logical size as the level size
    width: gamescene.width
    height: gamescene.height


    // just as an abbreviation of typing, so instead of scene.gridSize just gridSize can be written in this file
    property real gridSize: gamescene.gridSize

    // available columns for creating roosts - the current logical scene width is 320, gridSize is 48, so 6 and a half roosts can be displayed horizontally
    property int roostColumns: width/gridSize

    // gets used to measure how much the level was moved downwards in the last frame - if this is bigger than gridSize, a new row will be created in onYChanged
    property real lastY: 0

    // how many new rows were created, it starts with 0 if the level has y position 0, and then gets increased with every gridSize
    // gets initialized in onCompleted
    property real currentRow: 0

    // this is needed so an alias can be created from the main window!
    property alias ground: ground

    property alias levelMovementAnimation: levelMovementAnimation
    // specifies the px/second how much the level moves
    property real levelMovementSpeedMinimum: 120
    property real levelMovementSpeedMaximum: 900
    // after 30seconds, the maximum speed will be reached - if you set this too high, also increase the gravity so the player falls faster than the level moves
    property int levelMovementDurationTillMaximum: 60

    // with 9% probability, a roost will get created in a row for any column
    // if it gets set too low, the game will be unplayable because too few roosts are created, so balance this with care!
    property real platformCreationProbability: 0.09
    // probability of 30% to create a corn on top of the roost, so in 3 of 10 roosts there will be a corn created
    property real coinCreationPropability: 0.3
    // windows get created randomly as well - they only have visual effect, but don't set too high because then it looks boring
    property real windowCreationProbability: 0.05
    // this avoids creating too many windows, so not possible to have more than 2 on a scene with this code!
    property real minimumWindowHeightDifference: 300
    // Create 15 rows in complete
    property int rowCount: 15
    // current store dependent on the level progress - to avoid textupdate each frame
    property int currentScore: 0


    // is needed internally to avoid creating too many windows close to each other
    property int lastWindowY: 0

    // the background images are moved up by this offset so on widescreen devices the full background is visible
    property real __yOffsetForWindow: gamescene.__yOffsetForAbsoluteWindowCoordinates

    // gets emitted when a BorderRegion.onPlayerCollision() is received
    signal gameLost
    //  property var newElementProperties :{}






    //  function stopGame() {
    //    levelMovementAnimation.stop();

    //    // this function automatically pools all entities which have poolingEnabled set to true
    //    // and it ignores the entities that have preventFromRemovalFromEntityManager set to true
    //    entityManager.removeAllEntities();
    //  }

    //  // initialize level data - this function can be called multiple times, so every time a new game gets started
    //  // it is called from ChickenOutbreakScene.enterScene()

    function startGame(){
        levelMovementAnimation.start();

    }




    MovementAnimation {
        id: levelMovementAnimation
        property bool isbegin:false
        property: "x"
        // this is the movement in px per second, start with very slow movement, 10 px per second
        velocity: -levelMovementSpeedMinimum
        // running is set to false by default - start() is called in startGame()
        // increase the velocity by this amount of pixels per second, so it lasts minVelocity/acceleration seconds until the maximum is reached!
        // i.e. -90/-2 = 45 seconds
        acceleration: -(levelMovementSpeedMaximum-levelMovementSpeedMinimum) / levelMovementDurationTillMaximum
        target: level

        // limit the maximum v to 100 px per second - it must not be faster than the gravity! this is the absolute maximum, so the chicken falls almost as fast as the background moves by! so rather set it to -90, or increase the gravity
        minVelocity: -levelMovementSpeedMaximum

    }


    Ground{
        id:ground
        anchors.verticalCenter: parent.verticalCenter
    }


    //  // when the level gets moved down, check if the difference between last level y position and the current one is greater than gridSize - if so, create a new row

}
