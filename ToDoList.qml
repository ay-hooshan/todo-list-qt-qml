import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

import ToDo 1.0

Item {
    id: rootItem

    property int itemHeight: 100

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 10
            Layout.bottomMargin: 0

            //            color: 'red'
            ListView {
                id: mylv

                anchors.fill: parent
                spacing: 10
                clip: true

                model: ToDoModel {
                    list: toDoList
                }

                delegate: RowLayout {
                    width: mylv.width
                    height: rootItem.itemHeight

                    AyBtn {
                        Layout.preferredWidth: height
                        Layout.fillHeight: true
                        btnText: ''
                        color: model.done ? "green" : "white"
                        onBtnClicked: () => {
                                          model.done = !model.done
                                          console.log(model.done)
                                      }
                    }

                    AyLineEdit {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        textInputed: model.title
                        color: model.done ? "lightgreen" : "lightgrey"
                        onEnterPressed: model.title = textInputed
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: rootItem.itemHeight
            color: 'darkblue'

            RowLayout {
                anchors.fill: parent

                Button {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "New Item"
                    onClicked: toDoList.appendItem()
                }

                Button {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Remove Completed"
                    onClicked: toDoList.removeCompletedItems()
                }
            }
        }
    }
}
