import QtQuick 2.13
import QtQuick.Controls 2.13
import View 1.0

ApplicationWindow {
    visible: true
    width: Constants.width
    height: Constants.height
    title: qsTr("Dashboard")

    TopScreen {
        anchors.fill: parent
    }

    Component.onCompleted: console.log("MAIN - onCompleted")
}
