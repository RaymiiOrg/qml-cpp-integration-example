/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3
 */

import QtQuick 2.0
import QtQuick.Controls 2.0

/* This class is named TrafficLightQML to make the difference
 * between the QML side and the C++ side clear */

Item {
    property bool redActive: false
    property bool orangeActive: false
    property bool greenActive: false

    readonly property int circleRadius: 180

    Rectangle {
        id: background
        width: parent.width * 0.8
        height: parent.height * 0.8
        color: "#202020"
        radius: 5

        Rectangle {
            id: red
            radius: circleRadius
            width: parent.width * 0.8
            height: width
            color: "#ff0000"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: parent.width * 0.1
            anchors.leftMargin: parent.width * 0.1
            opacity: redActive ? 1 : 0.2
        }

        Rectangle {
            id: orange
            radius: circleRadius
            width: parent.width * 0.8
            height: width
            color: "#ffa500"
            anchors.top: red.bottom
            anchors.left: parent.left
            anchors.topMargin: parent.width * 0.1
            anchors.leftMargin: parent.width * 0.1
            opacity: orangeActive ? 1 : 0.2
        }

        Rectangle {
            id: green
            radius: circleRadius
            width: parent.width * 0.8
            height: width
            color: "#32cd32"
            anchors.top: orange.bottom
            anchors.left: parent.left
            anchors.topMargin: parent.width * 0.1
            anchors.leftMargin: parent.width * 0.1
            opacity: greenActive ? 1 : 0.2
        }
    }
}
