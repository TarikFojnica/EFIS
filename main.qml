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
        rows: 2

        Row {
            id: upper_panel
            width: 780
            height: 110

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
                    x: 0
                    y: 0
                    width: 300
                    height: 90
                    layoutDirection: Qt.RightToLeft

                    Item {
                        id: item1
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
                            text: qsTr("Airspeed to low!")
                            font.weight: Font.Bold
                            fontSizeMode: Text.FixedSize
                            textFormat: Text.AutoText
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: 23
                            font.family: "Tahoma"
                        }
                    }
                }
            }
        }
    }
}
