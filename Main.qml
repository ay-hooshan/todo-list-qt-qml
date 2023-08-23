// https://www.youtube.com/watch?v=9BcAYDlpuT8

import QtQuick
import QtQuick.Window

Window {
    id: root
    width: 640
    height: 800
    visible: true
    title: qsTr("ToDo List")

    ToDoList {
        x: 10
        y: 10
        width: root.width - 20
        height: root.height - 20
    }
}
