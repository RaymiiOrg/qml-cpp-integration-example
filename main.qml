/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3
 */

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
// For the singleton instance
import org.raymii.RoadObjects 1.0
// For setContextProperty instance, but only for the Enum access
import org.raymii.RoadObjectUncreatableType 1.0
//// For the instance registered with RegisterType
import org.raymii.RoadObjectType 1.0

ApplicationWindow {
    width: 650
    height: 480
    visible: true
    title: qsTr("C++ Expose example, QMLRegisterSingleton vs setContextProperty")

    QtObject{
            id: internals
            readonly property string helpText: "C++ Qt/Qml example by [raymii.org](https://raymii.org).

Shows different methods to expose C++ classes to QML:
- `qmlRegisterSingleton<>` (one instance of thing)
- `rootContext->setContextProperty()` (one instance of thing)
- `qmlRegisterType<>` (many instances of thing)

License: GNU AGPLv3
"
    }

    RowLayout {
        id: rowLayout
        spacing: 5

        Rectangle {
            id: singletonInstance
            width: 150
            height: 250
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5

            Text {
                id: singletonText
                width: parent.width
                height: 20
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                text: "qmlRegisterSingleton<>"
                fontSizeMode: Text.Fit
                wrapMode: Text.WordWrap
            }

            TrafficLightQml {
                id: trlSingleton
                width: 50
                height: 140
                anchors.top: singletonText.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.leftMargin: 50
                redActive: TrafficLightSingleton.lamp === TrafficLightSingleton.Red;
                orangeActive: TrafficLightSingleton.lamp === TrafficLightSingleton.Orange;
                greenActive: TrafficLightSingleton.lamp === TrafficLightSingleton.Green;
            }

            TrafficLightQmlControlButtons {
                id: trlSingletonControls
                anchors.top: trlSingleton.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                width: parent.width
                height: 60

                onPowerStateChanged: { TrafficLightSingleton.setPowerState(!TrafficLightSingleton.powerState); }
                onNextLamp: { TrafficLightSingleton.nextLamp(); }
            }
        }

        Rectangle {
            id: contextPropertyInstance
            width: 150
            height: 250
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            Text {
                id: contextPropertyInstanceText
                width: parent.width
                height: 20
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                text: "setContextProperty"
                fontSizeMode: Text.Fit
                wrapMode: Text.WordWrap
            }

            TrafficLightQml {
                id: trlContextProperty
                width: 50
                height: 140
                anchors.top: contextPropertyInstanceText.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.leftMargin: 50
                redActive: trafficLightContextProperty.lamp === TrafficLightUncreatableType.Red
                orangeActive: trafficLightContextProperty.lamp === TrafficLightUncreatableType.Orange
                greenActive: trafficLightContextProperty.lamp === TrafficLightUncreatableType.Green
            }

            TrafficLightQmlControlButtons {
                id: trlContextPropertyControls
                anchors.top: trlContextProperty.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                width: parent.width
                height: 60
                onPowerStateChanged: { trafficLightContextProperty.setPowerState(!trafficLightContextProperty.powerState); }
                onNextLamp: { trafficLightContextProperty.nextLamp(); }
            }
        }


        Rectangle {
            id: typeInstance1
            width: 150
            height: 250
            Layout.alignment : Qt.AlignLeft | Qt.AlignTop

            TrafficLightType {
                id: trafficLightTypeInstance1
            }

            Text {
                id: typeText1
                width: parent.width
                height: 20
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                text: "qmlRegisterType<>
instance #1"
                fontSizeMode: Text.Fit
                font.pointSize: 10
                minimumPointSize: 6
                wrapMode: Text.WordWrap
            }

            TrafficLightQml {
                id: trltype1
                width: 50
                height: 140
                anchors.top: typeText1.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.leftMargin: 50
                redActive: trafficLightTypeInstance1.lamp === TrafficLightType.Red;
                orangeActive: trafficLightTypeInstance1.lamp === TrafficLightType.Orange;
                greenActive: trafficLightTypeInstance1.lamp === TrafficLightType.Green;
            }

            TrafficLightQmlControlButtons {
                id: trltype1Controls
                anchors.top: trltype1.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                width: parent.width
                height: 60

                onPowerStateChanged: { trafficLightTypeInstance1.setPowerState(!trafficLightTypeInstance1.powerState); }
                onNextLamp: { trafficLightTypeInstance1.nextLamp(); }
            }
        }

        Rectangle {
            id: typeInstance2
            width: 150
            height: 250
            Layout.alignment : Qt.AlignLeft | Qt.AlignTop

            TrafficLightType {
                id: trafficLightTypeInstance2
            }

            Text {
                id: typeText2
                width: parent.width
                height: 20
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                text: "qmlRegisterType<>
instance #2"
                font.pointSize: 10
                minimumPointSize: 6
                fontSizeMode: Text.Fit
                wrapMode: Text.WordWrap
            }

            TrafficLightQml {
                id: trltype2
                width: 50
                height: 140
                anchors.top: typeText2.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.leftMargin: 50
                redActive: trafficLightTypeInstance2.lamp === TrafficLightType.Red;
                orangeActive: trafficLightTypeInstance2.lamp === TrafficLightType.Orange;
                greenActive: trafficLightTypeInstance2.lamp === TrafficLightType.Green;
            }

            TrafficLightQmlControlButtons {
                id: trltype2Controls
                anchors.top: trltype2.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                width: parent.width
                height: 60

                onPowerStateChanged: { trafficLightTypeInstance2.setPowerState(!trafficLightTypeInstance2.powerState); }
                onNextLamp: { trafficLightTypeInstance2.nextLamp(); }
            }
        }

    }

    Button {
        id: exitButton
        anchors.top: rowLayout.bottom
        anchors.left: parent.left
        anchors.topMargin: 20
        anchors.leftMargin: 5
        width: 150
        height: 20
        text: "Exit"
        onClicked: {
            Qt.callLater(Qt.quit);
        }
    }


    Text {
        width: 150
        height: 60
        anchors.top: exitButton.bottom
        anchors.left: parent.left
        anchors.topMargin: 20
        anchors.leftMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignLeft
        textFormat: TextEdit.MarkdownText
        text: internals.helpText
        fontSizeMode: Text.Fit
        wrapMode: Text.WordWrap
    }

    Component.onCompleted: {
        console.log(Date.now())
//        Qt.callLater(Qt.quit);
    }
}
