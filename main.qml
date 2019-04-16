import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 800
    height: 480
    color: "#000000"
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
                            font.capitalization: Font.SmallCaps
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            font.weight: Font.Bold
                            textFormat: Text.AutoText
                            fontSizeMode: Text.FixedSize
                            font.family: "Tahoma"
                            font.pixelSize: 40
                        }

                        Text {
                            id: text2
                            x: 0
                            y: 49
                            width: 214
                            height: 32
                            color: "#ff7272"
                            text: qsTr("Airspeed too low!")
                            font.weight: Font.Bold
                            fontSizeMode: Text.FixedSize
                            textFormat: Text.AutoText
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: 23
                            font.family: "Tahoma"
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
            id: botto_row
            width: 780
            height: 360
        }
    }
}
