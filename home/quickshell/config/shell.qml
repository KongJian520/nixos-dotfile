import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 35
    color: "#1e1e2e" // 设置一个背景颜色以便观察

    Row {
        anchors.centerIn: parent
        spacing: 10

        Repeater {
            // 获取所有工作区并按 ID 排序
            model: Hyprland.workspaces.values.sort((a, b) => a.id - b.id)

            delegate: Rectangle {
                implicitWidth: 30
                implicitHeight: 25
                radius: 4
                
                // 如果是当前激活的工作区，改变颜色
                color: modelData.id === Hyprland.focusedWorkspace?.id ? "#89b4fa" : "#313244"

                Text {
                    anchors.centerIn: parent
                    text: modelData.id
                    color: modelData.id === Hyprland.focusedWorkspace?.id ? "#11111b" : "#cdd6f4"
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    // 点击切换到该工作区
                    onClicked: Hyprland.dispatch("workspace " + modelData.id)
                }
            }
        }
    }
}