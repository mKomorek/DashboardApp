import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.12
import View 1.0

Item {
    id: topItem
    property int typeOfRide: ConnectService.HMI_data.D7
    property color rideTypeColor: {
        if(topItem.typeOfRide === 0)
            return Constants.colorEco
        if(topItem.typeOfRide === 1)
            return Constants.colorPerl
        if(topItem.typeOfRide === 2)
            return Constants.colorDynamic
    }

    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        color: Constants.colorBG

        RadialBar {
            id: hmiClock
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            width: parent.width * 0.5
            height: width
            dialType: RadialBar.MinToMax
            progressColor: topItem.rideTypeColor
            onProgressColorChanged: update()
            foregroundColor: "#1a1a1b"
            dialWidth: 30
            startAngle: 40
            spanAngle: 280
            minValue: 0
            maxValue: 220
            value: ConnectService.HMI_data.A0
            textFont {
                family: "Consolas"
                italic: false
                pointSize: 38
            }
            suffixText: "km/h"
            textColor: topItem.rideTypeColor
        }

        Column {
            id: column
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width  * 0.4
            height: parent.height * 0.90

            Rectangle {
                id: typeOfRide
                width: parent.width
                height: parent.height * 0.24
                color: Constants.colorBG

                BigText {
                    id: typeOfRideText
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    text: {
                        if(topItem.typeOfRide === 0)
                            return "ECO"
                        if(topItem.typeOfRide === 1)
                            return "NORMAL"
                        if(topItem.typeOfRide === 2)
                            return "DYNAMIC"
                    }
                }
            }

            Rectangle {
                width: parent.width - 20
                height: parent.height * 0.005
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 100

                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: Constants.colorBG }
                    GradientStop { position: 0.5; color: topItem.rideTypeColor}
                    GradientStop { position: 1.0; color: Constants.colorBG }
                }
            }

            Rectangle {
                id: baterryCharge
                width: parent.width
                height: parent.height * 0.24
                color: Constants.colorBG

                Row {
                    anchors.centerIn: parent
                    spacing: 5

                    BigText {
                        id: baterryChargeText
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 1
                        text: ConnectService.HMI_data.A1 + " %"
                        color: {
                            if(ConnectService.HMI_data.A1 <= 15)
                                return Constants.colorRed
                            return Constants.colorWhite
                        }
                    }

                    Image {
                        id: baterryCharging
                        anchors.verticalCenter: parent.verticalCenter
                        width: 48
                        height: 48
                        source: "qrc:/Images/batteryCharging.svg"
                        sourceSize.width: width
                        sourceSize.height: height

                        ColorOverlay {
                            id: baterryChargingOverlay
                            color: {
                                if(ConnectService.HMI_data.A1 <= 15)
                                    return Constants.colorRed
                                return Constants.colorWhite
                            }
                            anchors.fill: baterryCharging
                            source: baterryCharging
                        }
                    }
                }
            }

            Rectangle {
                width: parent.width - 20
                height: parent.height * 0.005
                anchors.horizontalCenter: parent.horizontalCenter
                color: Constants.colorPerl
                radius: 100
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: Constants.colorBG }
                    GradientStop { position: 0.5; color: topItem.rideTypeColor }
                    GradientStop { position: 1.0; color: Constants.colorBG }
                }
            }

            Rectangle {
                id: batteryTemp
                width: parent.width
                height: parent.height * 0.24
                color: Constants.colorBG

                Row {
                    anchors.centerIn: parent
                    spacing: 10

                    BigText {
                        id: baterryTempText
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 1
                        text: ConnectService.HMI_data.A2 +" °C"
                        color: {
                            if(ConnectService.HMI_data.A2>=60)
                                return Constants.colorRed
                            return Constants.colorWhite
                        }
                    }

                    Image {
                        id: baterryTempImg
                        anchors.verticalCenter: parent.verticalCenter
                        width: 48
                        height: 48
                        source: "qrc:/Images/temperature.svg"
                        sourceSize.width: width
                        sourceSize.height: height

                        ColorOverlay {
                            id: baterryTempImgOverlay
                            color: {
                                if(ConnectService.HMI_data.A2>=60)
                                    return Constants.colorRed
                                return Constants.colorWhite
                            }
                            anchors.fill: baterryTempImg
                            source: baterryTempImg
                        }
                    }
                }
            }

            Rectangle {
                width: parent.width - 20
                height: parent.height * 0.005
                anchors.horizontalCenter: parent.horizontalCenter
                color: Constants.colorPerl
                radius: 100
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: Constants.colorBG }
                    GradientStop { position: 0.5; color: topItem.rideTypeColor }
                    GradientStop { position: 1.0; color: Constants.colorBG }
                }
            }

            Rectangle {
                id: info
                width: parent.width
                height: parent.height * 0.24
                color: Constants.colorBG

                Row {
                    anchors.centerIn: parent
                    spacing: 20

                    RoundButton {
                        id: warningButton
                        anchors.verticalCenter: parent.verticalCenter
                        width: 60
                        height: 60
                        Material.background: "#00000000"
                        onClicked: warningDialog.visible = true

                        Image {
                            id: warningImage
                            width: 48
                            height: 48
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "qrc:/Images/warning.svg"
                            sourceSize.width: width
                            sourceSize.height: height

                            ColorOverlay {
                                id: warningImageOverlay
                                anchors.fill: warningImage
                                source: warningImage
                                color: ConnectService.HMI_data.D6 === 1 ? Constants.colorRed : Constants.colorDisable
                            }
                        }
                    }

                    RoundButton {
                        id: batteryProblem
                        anchors.verticalCenter: parent.verticalCenter
                        width: 60
                        height: 60
                        Material.background: "#00000000"
                        onClicked: batteryErrorDialog.visible = true

                        Image {
                            id: batteryProblemImage
                            width: 48
                            height: 48
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "qrc:/Images/batteryAlert.svg"
                            sourceSize.width: width
                            sourceSize.height: height

                            ColorOverlay {
                                id: batteryProblemOverlay
                                anchors.fill: batteryProblemImage
                                source: batteryProblemImage
                                color: ConnectService.HMI_data.D5 === 1 ? Constants.colorRed : Constants.colorDisable
                            }
                        }
                    }
                }
            }
        }
    }

    OkDialog {
        id: batteryErrorDialog
        visible: false
        text: "There is a problem with the battery. Check it!"
        onOkClicked: {
            visible = false
        }
    }

    OkDialog {
        id: warningDialog
        visible: false
        text: "There is a some kind of problem with stg. Check it!"
        onOkClicked: {
            visible = false
        }
    }
}
