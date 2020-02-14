import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0
import QtQuick.Shapes 1.0

Item {
    id: topItem

    SwipeView {
        id: swipeView
        anchors.fill: parent

        HomeScreen {
            id: homeScreen
            width: Constants.width
            height: Constants.height
        }

        BaterryScreen {
            id: batteryScreen
            width: Constants.width
            height: Constants.height
        }
    }
}
