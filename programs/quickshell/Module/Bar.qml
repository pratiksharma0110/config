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
            model: Hyprland.workspaces.values.filter(w =>
                    w.id <= 10 && (
                    w.id === Hyprland.focusedWorkspace?.id ||
                   w.lastIpcObject?.windows > 0 ||
                   w.windows > 0
            )
    )




    Text {


       required property var modelData

        property var ws: modelData
        property bool isActive: ws.id === Hyprland.focusedWorkspace?.id

        text: ws.id.toString()
        color: isActive ? Colors.background : Colors.muted
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
