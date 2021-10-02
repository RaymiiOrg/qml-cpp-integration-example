/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3
 */

import QtQuick 2.0
import QtQuick.Controls 2.0

/* This class is named TrafficLightQML to make the difference
 * between the QML side and the C++ side clear */

Item {
    id: trafficLightButtons
    // properties have an implicit signal when they change,
    // so we can handle onPowerStateChanged without
    // defining a signal ourself, just setting the property is
    // enough.
    property bool powerState: false
    signal nextLamp()

    Rectangle {
        anchors.fill: parent

        Button {
            id: nextButton
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            height: 20
            enabled: powerState
            text: "Next colour"
            onClicked: { nextLamp(); }
        }

        Button {
            id: onoffButton
            anchors.top: nextButton.bottom
            anchors.left: parent.left
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            height: 20
            text: powerState ? "Off" : "On"
            onClicked: { powerState = !powerState }
        }
    }
}
