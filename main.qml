import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 800
    height: 480
    color: "#000000"
    property alias virtual_horizon_container: virtual_horizon_container
    title: qsTr("Electronic Flight Instrument System")

    Grid {
        id: grid
        x: 10
        y: 10
        width: 780
        height: 460
        spacing: 10
        rows: 2

        Row {
            id: upper_panel
            width: 780
            height: 90
            spacing: 10

            Rectangle {
                id: warning_block
                width: 300
                height: 90
                color: "#222222"
                radius: 1
                opacity: 1
                border.color: "#3f3f3f"

                Row {
                    id: row
                    anchors.fill: parent
                    layoutDirection: Qt.RightToLeft

                    Item {
                        id: warning_text
                        x: 85
                        width: 214
                        height: 90

                        Text {
                            id: text1
                            x: 0
                            y: 0
                            width: 214
                            height: 53
                            color: "#ff7272"
                            text: qsTr("PULL UP!")
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.capitalization: Font.SmallCaps
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            font.weight: Font.Bold
                            textFormat: Text.AutoText
                            fontSizeMode: Text.FixedSize
                            font.family: "Tahoma"
                            font.pixelSize: 40
                        }
                    }

                    Item {
                        id: warning_icon_container
                        anchors.fill: parent

                        Image {
                            id: warning_icon
                            x: 10
                            y: 10
                            width: 64
                            height: 64
                            anchors.verticalCenter: parent.verticalCenter
                            source: "warning.png"
                        }
                    }
                }
            }

            Rectangle {
                id: weather
                x: 300
                y: 0
                width: 230
                height: 90
                color: "#222222"
                radius: 1
                opacity: 1

                Item {
                    id: weather_container
                    x: 0
                    y: 0
                    width: 230
                    height: 90

                    Text {
                        id: wind_data
                        x: 12
                        y: 46
                        width: 218
                        height: 44
                        color: "#ffffff"
                        text: qsTr("2MPH Southwest")
                        font.weight: Font.Bold
                        fontSizeMode: Text.FixedSize
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        textFormat: Text.AutoText
                        font.family: "Tahoma"
                        font.pixelSize: 23
                    }

                    Text {
                        id: weather_data
                        x: 12
                        y: 0
                        width: 218
                        height: 44
                        color: "#ffffff"
                        text: qsTr("10°C Sunny")
                        font.weight: Font.Bold
                        fontSizeMode: Text.FixedSize
                        textFormat: Text.AutoText
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 23
                        font.family: "Tahoma"
                    }
                }
                border.color: "#3f3f3f"
            }

            Rectangle {
                id: landing_take_off
                width: 230
                height: 90
                color: "#222222"
                radius: 1
                opacity: 1

                Row {
                    id: landing_take_off_container
                    height: 85
                    spacing: 0
                    anchors.fill: parent
                    layoutDirection: Qt.LeftToRight

                    Item {
                        id: take_off
                        width: 115
                        height: 90
                        transformOrigin: Item.Center

                        Image {
                            id: image
                            width: 64
                            height: 64
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            source: "take-off.png"
                        }
                    }

                    Item {
                        id: landing
                        width: 115
                        height: 90

                        Image {
                            id: image1
                            width: 64
                            height: 64
                            opacity: 0.1
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "landing.png"
                        }
                    }

                }

                border.color: "#3f3f3f"
            }
        }

        Row {
            id: bottom_row
            width: 780
            height: 360
            layoutDirection: Qt.LeftToRight
            spacing: 20

            Rectangle {
                id: virtual_horizon_container
                width: 300
                height: 360
                color: "#000000"
                radius: 0
                scale: 1
                rotation: 0
                antialiasing: true
                border.width: 0
                clip: true

                Image {
                    id: virtual_horizon
                    x: 0
                    y: -180
                    width: 300
                    scale: 1.6
                    rotation: 17
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                    fillMode: Image.Stretch
                    clip: false
                    sourceSize.width: 0
                    source: "virtual_horizont.png"
                }
            }

            Item {
                id: vertical_item
                width: 140
                height: 360
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    id: rectangle
                    x: 50
                    y: 0
                    width: 20
                    height: 360
                    radius: 1
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#26b7e9"
                        }

                        GradientStop {
                            position: 1
                            color: "#b95200"
                        }
                    }

                    Rectangle {
                        id: rectangle1
                        x: 0
                        y: 316
                        width: 113
                        height: 32
                        color: "#00000000"
                        opacity: 1
                        border.width: 2
                        border.color: "#ffffff"

                        Text {
                            id: text3
                            x: 29
                            y: 0
                            width: 84
                            height: 32
                            color: "#fdfdfd"
                            text: qsTr("5.432")
                            font.bold: false
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenterOffset: 0
                            anchors.horizontalCenterOffset: 14
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: "Courier"
                            font.pixelSize: 19
                        }
                    }
                }

                Image {
                    id: image2
                    x: 0
                    y: 310
                    width: 40
                    height: 40
                    opacity: 0.5
                    source: "altitude.png"
                }
            }
        }
    }
}
