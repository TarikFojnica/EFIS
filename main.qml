import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 800
    height: 480
    color: "#000000"
    property alias config: config
    property alias airspeed_indicator_wrapper: airspeed_indicator_wrapper
    title: qsTr("Electronic Flight Instrument System")

    Rectangle {
        id: config
        visible: false
        x: -1
        y: 0
        width: 800
        height: 480
        color: "#d9000000"
        z: 5

        Column {
            id: column
            x: 462
            y: 110
            width: 338
            height: 346
            spacing: 10

            Text {
                id: config_title
                color: "#f6f6f6"
                text: qsTr("Configuration")
                font.family: "Tahoma"
                font.pixelSize: 26
            }

            Rectangle {
                id: rectangle1
                width: 200
                height: 40
                color: "#148c28"
                MouseArea {
                    id: submit_config1
                    x: 0
                    y: 0
                    width: 200
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: informationProviderClass.submitConfig()
                }

                Text {
                    id: text3
                    x: 0
                    y: 0
                    width: 172
                    height: 24
                    color: "#ffffff"
                    text: qsTr("OK")
                    font.pixelSize: 20
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: config_title1
                y: 50
                color: "#f6f6f6"
                text: qsTr("Server IP: 109.237.37.107")
                font.pixelSize: 20
                font.family: "Tahoma"
            }

            Text {
                id: config_title2
                y: 100
                color: "#f6f6f6"
                text: qsTr("PORT: 8080")
                font.pixelSize: 20
                font.family: "Tahoma"
            }

        }
    }

    Connections {
        target: informationProviderClass
        onMessageChanged: [
            animation_military_jet_style.stop(),
            animation_loosing_controll.stop(),
            status_val.text = "OK",
            status_val.color = "white",
            airspeed_indicator_container.y = 250,
            airspeed_indicator_val.value = 0,
            altitude_indicator_container.y = 250,
            altitude_indicator_value.value = 0,
            virtual_horizon_container.y = 0,
            virtual_horizon_container.rotation = 0,
            compass_dynamic.rotation = 0,
            animation_sequential_take_off.restart(),
        ]

        onMilitaryJetStyleExecuted: [
            animation_sequential_take_off.stop(),
            animation_loosing_controll.stop(),
            status_val.text = "OK",
            status_val.color = "white",
            airspeed_indicator_container.y = 120,
            airspeed_indicator_val.value = 300,
            altitude_indicator_container.y = 120,
            altitude_indicator_value.value = 800,
            virtual_horizon_container.y = 0,
            virtual_horizon_container.rotation = 0,
            compass_dynamic.rotation = 0,
            animation_military_jet_style.restart()
        ]

        onLoosingControllExecuted: [
            animation_sequential_take_off.stop(),
            animation_military_jet_style.stop(),
            status_val.text = "OK",
            status_val.color = "white",
            airspeed_indicator_container.y = 50,
            airspeed_indicator_val.value = 450,
            altitude_indicator_container.y = 120,
            altitude_indicator_value.value = 800,
            virtual_horizon_container.y = 0,
            virtual_horizon_container.rotation = 0,
            compass_dynamic.rotation = 0,

            animation_loosing_controll.restart()
        ]

        onConfigOpened: [
            config.visible = true
        ]

        onConfigSubmitted: [
            config.visible = false
        ]

        onStopExecuted: [
            animation_military_jet_style.stop(),
            animation_sequential_take_off.stop(),
            animation_loosing_controll.stop()
        ]
    }

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
                id: button_1_container
                x: 0
                y: 50
                width: 180
                height: 40
                color: "#1b1b1b"
                border.color: "#cfeca1"

                MouseArea {
                    id: mouseArea
                    x: 790
                    y: 0
                    width: 180
                    height: 60
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: informationProviderClass.doMessageChange()

                    Text {
                        id: name
                        x: -776
                        y: 14
                        color: "#ffffff"
                        text: qsTr("Take Off")
                        font.pointSize: 20
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                }
            }

            Rectangle {
                id: button_2_container
                x: 0
                y: 50
                width: 180
                height: 40
                color: "#1b1b1b"
                MouseArea {
                    id: mouseArea1
                    x: 790
                    y: 0
                    width: 180
                    height: 60
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 0
                    onClicked: informationProviderClass.doLoosingControll()

                    Text {
                        id: name1
                        x: -776
                        y: 14
                        color: "#ffffff"
                        text: qsTr("Loosing Contol")
                        font.pointSize: 20
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                border.color: "#cfeca1"
            }

            Rectangle {
                id: button_2_container1
                x: 0
                y: 50
                width: 180
                height: 40
                color: "#1b1b1b"
                MouseArea {
                    id: mouseArea2
                    x: 790
                    y: 0
                    width: 180
                    height: 60
                    onClicked: informationProviderClass.militaryJetStyleExecuted()
                    Text {
                        id: name2
                        x: -776
                        y: 14
                        color: "#ffffff"
                        text: qsTr("Military Jet Style")
                        font.pointSize: 20
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                border.color: "#cfeca1"
            }

            Rectangle {
                id: button_2_container2
                x: 0
                y: 50
                width: 200
                height: 40
                color: "#1b1b1b"
                MouseArea {
                    id: mouseArea3
                    x: 790
                    y: 0
                    width: 200
                    height: 60
                    onClicked: informationProviderClass.stopExecuted()

                    Text {
                        id: name3
                        x: -776
                        y: 14
                        color: "#ffffff"
                        text: qsTr("Stop")
                        font.pointSize: 20
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                border.color: "#f71a1a"
            }


        }

        Row {
            id: bottom_row
            width: 780
            height: 360
            layoutDirection: Qt.LeftToRight
            spacing: 10

            Item {
                id: airspeed_indicator_wrapper
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
                        id: airspeed_indicator_container
                        x: 0
                        y: 250
                        width: 97
                        height: 32
                        color: "#b3000000"
                        z: 2
                        border.color: "#a6a6a6"
                        border.width: 2
                        opacity: 1
                        property int animationEndVal: 0
                        property int animationStartVal: 0
                        property int length : 10000

                        Text {
                            id: airspeed_indicator_val
                            property int value: 140
                            text: value
                            x: 29
                            y: 0
                            width: 84
                            height: 32
                            color: "#fdfdfd"

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
                            property int animationStartVal: 0
                            property int animationEndVal: 0
                            property int length : 10000
                        }

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
                    text: qsTr("Knots")
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
                    color: "#000000"
                    radius: 1
                    border.color: "#606060"
                    z: -4
                }
            }


            Rectangle {
                id: virtual_horizon_wrapper
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
                    id: virtual_horizon_container
                    x: 0
                    y: 0
                    width: 300
                    height: 360
                    z: 0
                    rotation: 0
                    property int animationRotationStartVal: 0
                    property int animationRotationEndVal: 30

                    property int animationYStartVal: 0
                    property int animationYEndVal: 20

                    property int animationRotationLength : 5000
                    property int animationXYLength : 5000


                    Image {
                        id: horizon
                        x: 0
                        y: 0
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
                        id: degree_pointer
                        x: 140
                        y: 29
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
                    x: 92
                    y: 80
                    width: 116
                    height: 189
                    source: "vertical_angle.png"
                }

            }

            Item {
                id: airspeed_continer1
                x: 320
                width: 130
                height: 360
                Rectangle {
                    id: altitude_wrapper
                    x: 18
                    y: 8
                    width: 25
                    height: 300
                    radius: 10
                    Rectangle {
                        id: altitude_indicator_container
                        x: 0
                        y: 101
                        width: 97
                        height: 32
                        color: "#b3000000"
                        z: 2
                        opacity: 1
                        border.width: 2
                        Text {
                            id: altitude_indicator_value
                            property int value: 140
                            x: 29
                            y: 0
                            width: 84
                            height: 32
                            color: "#fdfdfd"
                            text: value
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
                    text: qsTr("Feets")
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
                    color: "#000000"
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
                        id: compass
                        width: 190
                        height: 170
                        color: "#000000"

                        Image {
                            id: compass_static
                            width: 100
                            height: 100
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "compass_dynamic.png"
                            fillMode: Image.PreserveAspectFit
                        }

                        Image {
                            id: compass_dynamic
                            width: 190
                            height: 170
                            rotation: 0
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "compass_static.png"
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                    Rectangle {
                        id: battery
                        width: 190
                        height: 170
                        color: "#191919"

                        Image {
                            id: image5
                            width: 141
                            height: 125
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "battery_indicator.png"
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                }
            }
        }
    }

    SequentialAnimation {
        id: animation_sequential_take_off
        running: false

        PauseAnimation { duration: 1000 }

        // Increase the speed indicator
        ParallelAnimation {
            PropertyAnimation {
                id: animation_airspeed_indicator_container
                target: airspeed_indicator_container
                property: "y"
                from: 250
                to: 120
                duration: 4000;
                easing.type: Easing.InOutQuad
            }


            NumberAnimation {
                id: animation_airspeed_indicator_val
                target: airspeed_indicator_val
                property: "value"
                from: 0
                to: 120
                duration: 4000
                easing.type: Easing.InOutQuad
            }
        }

        ParallelAnimation {
            SequentialAnimation {
                //Y up
                NumberAnimation {
                    id: animation_virtual_horizon_XY
                    target: virtual_horizon_container
                    property: "y"
                    from: 0
                    to: 50
                    duration: 9000
                    easing.type: Easing.InOutQuad
                }

                ParallelAnimation {

                    // Rotate Right
                    NumberAnimation {
                        id: animation_virtual_horizon_rotation
                        target: virtual_horizon_container
                        property: "rotation"
                        from: 0
                        to: 30
                        duration: 7000
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        id: animation_compass_rotation
                        target: compass_dynamic
                        property: "rotation"
                        from: 0
                        to: 30
                        duration: 7000
                        easing.type: Easing.InOutQuad
                    }
                }

                ParallelAnimation {

                    // Rotate Left
                    NumberAnimation {
                        target: virtual_horizon_container
                        property: "rotation"
                        from: 30
                        to: 0
                        duration: 7000
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: compass_dynamic
                        property: "rotation"
                        from: 30
                        to: 0
                        duration: 7000
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: virtual_horizon_container
                        property: "y"
                        from: 50
                        to: 0
                        duration: 9000
                        easing.type: Easing.InOutQuad
                    }

                }
            }

            // Altitude indicator
            ParallelAnimation {
                PropertyAnimation {
                    id: animation_altitude_indicator_container
                    target: altitude_indicator_container
                    property: "y"
                    from: 250
                    to: 120
                    duration: 21000;
                    easing.type: Easing.InOutQuad
                }


                NumberAnimation {
                    id: animation_altitude_indicator_val
                    target: altitude_indicator_value
                    property: "value"
                    from: 0
                    to: 1200
                    duration: 21000
                    easing.type: Easing.InOutQuad
                }
            }

        }
    }

    SequentialAnimation {
        id: animation_military_jet_style
        running: false

        PauseAnimation { duration: 1000 }

        ParallelAnimation {

            PropertyAnimation {
                target: airspeed_indicator_container
                property: "y"
                from: 120
                to: 50
                duration: 15000;
                easing.type: Easing.InOutQuad
            }


            NumberAnimation {
                target: airspeed_indicator_val
                property: "value"
                from: 300
                to: 420
                duration: 15000
                easing.type: Easing.InOutQuad
            }

            SequentialAnimation {
                // Rotate 360
                NumberAnimation {
                    target: virtual_horizon_container
                    property: "rotation"
                    from: 0
                    to: 360
                    duration: 7000
                    easing.type:Easing.InOutBack
                }

                ParallelAnimation {

                    NumberAnimation {
                        target: virtual_horizon_container
                        property: "y"
                        from: 0
                        to: 100
                        duration: 7000
                        easing.type:Easing.InOutQuad
                    }

                    PropertyAnimation {
                        target: altitude_indicator_container
                        property: "y"
                        from: 120
                        to: 50
                        duration: 15000;
                        easing.type: Easing.InOutQuad
                    }


                    NumberAnimation {
                        target: altitude_indicator_value
                        property: "value"
                        from: 800
                        to: 1200
                        duration: 15000
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }

    //loosing control
    SequentialAnimation {
        id: animation_loosing_controll
        running: false
        PauseAnimation { duration: 1000 }

        ParallelAnimation {
            NumberAnimation {
                target: virtual_horizon_container
                property: "y"
                from: 0
                to: 100
                duration: 15000
                easing.type:Easing.InOutQuad
            }

            PropertyAnimation {
                target: altitude_indicator_container
                property: "y"
                from: 120
                to: 50
                duration: 15000;
                easing.type: Easing.InOutQuad
            }


            NumberAnimation {
                target: altitude_indicator_value
                property: "value"
                from: 800
                to: 1200
                duration: 15000
                easing.type: Easing.InOutQuad
            }

            PropertyAnimation {
                target: airspeed_indicator_container
                property: "y"
                from: 50
                to: 230
                duration: 15000;
                easing.type: Easing.InOutQuad
            }


            NumberAnimation {
                target: airspeed_indicator_val
                property: "value"
                from: 450
                to: 200
                duration: 15000
                easing.type: Easing.InOutQuad
            }
        }

        //Starts loosing height

        SequentialAnimation {
            ParallelAnimation {

                PropertyAction {
                    target: status_val
                    property: "text"
                    value: "Airspeed Too Low!"
                }


                ColorAnimation {
                    loops: Animation.Infinite
                    target: status_val
                    property: "color"
                    from: "white"
                    to: "red"
                    duration: 1000
                }

                PropertyAnimation {
                    target: altitude_indicator_container
                    property: "y"
                    from: 50
                    to: 270
                    duration: 15000;
                    easing.type: Easing.InQuart
                }

                NumberAnimation {
                    target: altitude_indicator_value
                    property: "value"
                    from: 1200
                    to: 0
                    duration: 15000
                    easing.type: Easing.InQuart
                }

                NumberAnimation {
                    target: virtual_horizon_container
                    property: "y"
                    from: 100
                    to: 200
                    duration: 15000
                    easing.type:Easing.InQuart
                }
            }
        }

    }

    Text {
        id: status_key
        x: 10
        y: 15
        color: "#fbfbfb"
        text: qsTr("Status:")
        font.bold: true
        font.pixelSize: 20
    }

    Text {
        id: status_val
        x: 84
        y: 15
        color: "#fbfbfb"
        text: qsTr("OK")
        font.bold: true
        font.pixelSize: 20
    }

    Rectangle {
        id: rectangle
        x: 647
        y: 10
        width: 133
        height: 29
        color: "#090808"
        border.color: "#f9f8f8"

        MouseArea {
            id: open_config
            x: 0
            y: 0
            width: 133
            height: 29
            onClicked: informationProviderClass.openConfig()

            Text {
                id: text2
                color: "#fbfbfb"
                text: qsTr("Open Config")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }
    }

}

/*##^## Designer {
    D{i:1;anchors_height:460;anchors_width:780;anchors_x:10;anchors_y:10}
}
 ##^##*/
