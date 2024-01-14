
// https://www.youtube.com/watch?v=9BcAYDlpuT8
import QtQuick
import QtQuick.Window

Window {
    id: rootItem
    width: 640
    height: 800
    visible: true
    title: qsTr("ToDo List")

    ToDoList {
        anchors.fill: parent
    }
}
