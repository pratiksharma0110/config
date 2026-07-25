import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 32
    color: "#1e1e2e"

    property color colBg: "#1e1e2e"
    property color colFg: "#cdd6f4"
    property color colMuted: "#6c7086"
    property color colBlue: "#89b4fa"
    property color colGreen: "#a6e3a1"
    property color colLavender: "#b4befe"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 13

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
                color: isActive ? root.colBg : (hasWindows ? root.colBlue : root.colMuted)
                font { family: root.fontFamily; pixelSize: root.fontSize; bold: isActive }

                Rectangle {
                    visible: parent.isActive
                    anchors.centerIn: parent
                    width: parent.implicitWidth + 8
                    height: parent.implicitHeight + 4
                    radius: 4
                    color: root.colBlue
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
            color: root.colLavender
            font { family: root.fontFamily; pixelSize: root.fontSize }
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
