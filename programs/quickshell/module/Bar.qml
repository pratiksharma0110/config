import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Module

PanelWindow {
    id: root

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 32
    color: Colors.background

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 6

        Repeater {
            model: 10

            Text {
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                property bool hasWindows: ws !== undefined

                text: (index + 1).toString()
                color: isActive ? Colors.background : (hasWindows ? Colors.blue : Colors.muted)
                font { family: Colors.fontFamily; pixelSize: Colors.fontSize; bold: isActive }

                Rectangle {
                    visible: parent.isActive
                    anchors.centerIn: parent
                    width: parent.implicitWidth + 8
                    height: parent.implicitHeight + 4
                    radius: 4
                    color: Colors.blue
                    z: -1
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }

        Item { Layout.fillWidth: true }

        Text {
            id: clock
            color: Colors.lavender
            font { family: Colors.fontFamily; pixelSize: Colors.fontSize }
            text: Qt.formatDateTime(new Date(), "ddd MMM dd  HH:mm")

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd MMM dd  HH:mm")
            }
        }
    }
}
