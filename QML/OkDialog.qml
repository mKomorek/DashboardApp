import QtQuick 2.12
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import View 1.0

Rectangle {
    id: dialogRectangle
    anchors.fill: parent
    color: "#40000000"

    property alias text: errorText.text
    property alias okText: okButton.text
    signal okClicked()

    Rectangle {
        width: 400
        height: 270
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 10
        color: Constants.colorWhite

        BigText {
            id: errorText
            color: Constants.colorBG
            width: parent.width * 0.9
            height: parent.height * 0.7
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            text: "default text"
        }


        Button {
            id: okButton
            Material.background: Constants.colorGreen
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: 100
            text: qsTr("OK")
            onClicked: dialogRectangle.okClicked()
        }
    }
}
