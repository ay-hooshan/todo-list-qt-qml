import QtQuick

import ToDo 1.0
Column {
    Rectangle {
        id: lvframe
        height: 600
        width: 600
        ListView {
            id: mylv

            property bool defaultCondition: false
            anchors.fill: parent
            spacing: 10
            clip: true
            model: ToDoModel {
                list: toDoList
            }
            delegate: Row {
                spacing: 10

                AyBtn {
                    btnText: "-"
                    width: mylv.width * 0.2
                    height: mylv.height / 7
                    color: model.done ? "green" : "white"
                    onBtnClicked: () => {
                        model.done = !model.done
                        console.log(model.done)
                    }

                }

                AyLineEdit {
                    width: mylv.width * 0.75
                    height: mylv.height / 7
                    textInputed: model.title
                    color: model.done ?  "lightgreen" : "lightgrey"
                    onEnterPressed: model.title = textInputed
                }
            }
        }
    }

    AyBtn {
        btnText: "New Item"
        width: 200
        height: 50
        anchors.left: lvframe.left
        anchors.top: lvframe.bottom
        anchors.margins: 10
        onBtnClicked: toDoList.appendItem()
    }

    AyBtn {
        btnText: "Remove Completed"
        width: 200
        height: 50
        anchors.right: lvframe.right
        anchors.top: lvframe.bottom
        anchors.margins: 10
        onBtnClicked: toDoList.removeCompletedItems()
    }
}



