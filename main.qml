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
            spacing: 10

            Rectangle {
                id: virtual_horizon_container
                width: 300
                height: 360
                color: "#000000"
                radius: 27
                border.color: "#ae1515"
                scale: 1
                rotation: 0
                antialiasing: true
                border.width: 10
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
                id: vertical_item_1
                x: 320
                width: 140
                height: 360

                Rectangle {
                    id: rectangle
                    x: 50
                    y: 0
                    width: 20
                    height: 360
                    radius: 2
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
                        width: 89
                        height: 32
                        color: "#00000000"
                        opacity: 1
                        border.width: 2
                        border.color: "#ffffff"

                        Text {
                            id: text3
                            x: 29
                            y: 0
                            width: 68
                            height: 32
                            color: "#fdfdfd"
                            text: qsTr("5.432")
                            horizontalAlignment: Text.AlignLeft
                            font.bold: false
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenterOffset: 0
                            anchors.horizontalCenterOffset: 10
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

            Item {
                id: vertical_item_2
                x: 480
                width: 140
                height: 360
                Rectangle {
                    id: rectangle3
                    x: 50
                    y: 0
                    width: 20
                    height: 360
                    radius: 10
                    rotation: 0
                    gradient: Gradient {
                        GradientStop {
                            position: 0.732
                            color: "#22353d"
                        }

                        GradientStop {
                            position: 0.998
                            color: "#fe1717"
                        }
                    }
                    border.color: "#dadae1"
                    Rectangle {
                        id: rectangle2
                        x: 0
                        y: 200
                        width: 89
                        height: 32
                        color: "#00000000"
                        Text {
                            id: text4
                            x: 29
                            y: 0
                            width: 68
                            height: 32
                            color: "#fdfdfd"
                            text: qsTr("70.2")
                            font.bold: false
                            anchors.verticalCenterOffset: 0
                            horizontalAlignment: Text.AlignLeft
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 19
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenterOffset: 10
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Courier"
                        }
                        border.color: "#ffffff"
                        border.width: 2
                        opacity: 1
                    }
                }

                Image {
                    id: image3
                    x: 0
                    y: 310
                    width: 40
                    height: 40
                    opacity: 0.5
                    source: "speedometer.png"
                }
            }

            Item {
                id: vertical_item_3
                x: 640
                width: 140
                height: 360
                Rectangle {
                    id: rectangle5
                    x: 50
                    y: 0
                    width: 20
                    height: 360
                    radius: 10
                    border.color: "#dadae1"
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#ed1b1b"
                        }

                        GradientStop {
                            position: 0.33
                            color: "#22353d"
                        }

                        GradientStop {
                            position: 0.583
                            color: "#22353d"
                        }

                        GradientStop {
                            position: 1
                            color: "#22353d"
                        }


                    }
                    Rectangle {
                        id: rectangle4
                        x: 0
                        y: 162
                        width: 89
                        height: 32
                        color: "#00000000"
                        Text {
                            id: text5
                            x: 29
                            y: 0
                            width: 68
                            height: 32
                            color: "#fdfdfd"
                            text: qsTr("50%")
                            font.bold: false
                            anchors.verticalCenterOffset: 0
                            horizontalAlignment: Text.AlignLeft
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 19
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenterOffset: 10
                            font.family: "Courier"
                            verticalAlignment: Text.AlignVCenter
                        }
                        border.color: "#ffffff"
                        border.width: 2
                        opacity: 1
                    }
                }

                Image {
                    id: image4
                    x: 0
                    y: 310
                    width: 40
                    height: 40
                    opacity: 0.5
                    source: "propeller.png"
                }
            }
        }
    }
}
