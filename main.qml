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
                            color: "#df1c1c"
                            text: qsTr("pull up")
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.capitalization: Font.SmallCaps
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            font.weight: Font.Bold
                            textFormat: Text.AutoText
                            fontSizeMode: Text.FixedSize
                            font.family: "Arial"
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
                            opacity: 0.11
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
                            opacity: 0.9
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

            Item {
                id: airspeed_continer
                x: 320
                width: 130
                height: 360
                Rectangle {
                    id: airspeed_indicator
                    x: 18
                    y: 8
                    width: 25
                    height: 300
                    color: "#19727d"
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#19727d"
                        }

                        GradientStop {
                            position: 0.718
                            color: "#19727d"
                        }

                        GradientStop {
                            position: 0.837
                            color: "#fb0000"
                        }

                        GradientStop {
                            position: 1
                            color: "#fb0000"
                        }

                    }
                    Rectangle {
                        id: value
                        x: 0
                        y: 177
                        width: 97
                        height: 32
                        color: "#b3000000"
                        z: 2
                        border.color: "#a6a6a6"
                        Text {
                            id: text4
                            x: 29
                            y: 0
                            width: 84
                            height: 32
                            color: "#fdfdfd"
                            text: qsTr("130.23")
                            font.capitalization: Font.Capitalize
                            font.underline: false
                            font.italic: false
                            anchors.horizontalCenterOffset: 1
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: "Verdana"
                            font.pixelSize: 19
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset: 0
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            font.bold: true
                        }
                        border.width: 2
                        opacity: 1
                    }
                }

                Image {
                    id: image3
                    x: 8
                    y: 327
                    width: 25
                    height: 25
                    source: "speedometer.png"
                    opacity: 0.5
                }

                Text {
                    id: text5
                    x: 44
                    y: 334
                    color: "#ffffff"
                    text: qsTr("Knot")
                    opacity: 0.7
                    font.family: "Courier"
                    font.pixelSize: 19
                }

                Rectangle {
                    id: background1
                    x: 0
                    y: 0
                    width: 130
                    height: 360
                    color: "#191919"
                    radius: 1
                    border.color: "#606060"
                    z: -4
                }
            }


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

                Item {
                    id: dynamic
                    x: 0
                    y: 0
                    width: 300
                    height: 359
                    rotation: 0

                    Image {
                        id: horizon
                        x: 0
                        y: -71
                        width: 300
                        scale: 1.6
                        rotation: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        antialiasing: true
                        fillMode: Image.Stretch
                        clip: false
                        sourceSize.width: 0
                        source: "virtual_horizont.png"
                    }

                    Image {
                        id: image2
                        x: 140
                        y: 13
                        width: 20
                        height: 62
                        source: "caret-arrow-up.png"
                    }
                }

                Rectangle {
                    id: fixed_center
                    x: 50
                    y: 178
                    width: 200
                    height: 4
                    color: "#ffffff"
                }

                Image {
                    id: fixed_angle
                    x: 0
                    y: 3
                    width: 300
                    height: 100
                    source: "angles.png"
                }

                Image {
                    id: fixed_vertical_angle
                    x: 95
                    y: 90
                    width: 110
                    height: 169
                    source: "vertical_angle.png"
                }

            }

            Item {
                id: airspeed_continer1
                x: 320
                width: 130
                height: 360
                Rectangle {
                    id: airspeed_indicator1
                    x: 18
                    y: 8
                    width: 25
                    height: 300
                    radius: 10
                    Rectangle {
                        id: value1
                        x: 0
                        y: 120
                        width: 97
                        height: 32
                        color: "#b3000000"
                        z: 2
                        opacity: 1
                        border.width: 2
                        Text {
                            id: text6
                            x: 29
                            y: 0
                            width: 84
                            height: 32
                            color: "#fdfdfd"
                            text: qsTr("130.23")
                            anchors.verticalCenter: parent.verticalCenter
                            font.underline: false
                            verticalAlignment: Text.AlignVCenter
                            font.capitalization: Font.Capitalize
                            anchors.horizontalCenterOffset: 1
                            font.italic: false
                            font.pixelSize: 19
                            font.bold: true
                            font.family: "Verdana"
                            horizontalAlignment: Text.AlignLeft
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenterOffset: 0
                        }
                        border.color: "#a6a6a6"
                    }
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#b9f8f8"
                        }

                        GradientStop {
                            position: 0.718
                            color: "#19727d"
                        }

                        GradientStop {
                            position: 0.837
                            color: "#9c480c"
                        }

                        GradientStop {
                            position: 1
                            color: "#9c480c"
                        }
                    }
                }

                Image {
                    id: image4
                    x: 8
                    y: 327
                    width: 25
                    height: 25
                    source: "altitude.png"
                    opacity: 0.5
                }

                Text {
                    id: text7
                    x: 44
                    y: 334
                    color: "#ffffff"
                    text: qsTr("Feet")
                    opacity: 0.7
                    font.family: "Courier"
                    font.pixelSize: 19
                }

                Rectangle {
                    id: background2
                    x: 0
                    y: 0
                    width: 130
                    height: 360
                    color: "#191919"
                    radius: 1
                    z: -4
                    border.color: "#606060"
                }
            }

            Item {
                id: secondary
                x: 320
                width: 190
                height: 360

                Column {
                    id: secondary_container
                    x: 0
                    y: 0
                    width: 190
                    height: 360
                    spacing: 20

                    Rectangle {
                        id: rectangle
                        width: 190
                        height: 170
                        color: "#191919"
                    }

                    Rectangle {
                        id: rectangle1
                        width: 190
                        height: 170
                        color: "#191919"
                    }
                }
            }
        }
    }
}
