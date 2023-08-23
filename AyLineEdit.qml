import QtQuick 2.0

Rectangle {
    border.color: "black"
    radius: 20
    clip: true

    property alias textInputed: ayinput.text  // bi-direction binding

    signal enterPressed()

    TextInput {
        id: ayinput
        font.family: "cmu concrete"
        font.pixelSize: 30
        color: focus ? "black" : "grey"
        anchors.fill: parent
        anchors.leftMargin: 10
        verticalAlignment: Text.AlignVCenter
    }

    Keys.onReturnPressed: () => {
        enterPressed();
    }
}
