import QtQuick 2.15
import QtQuick.Layouts 1.12

ColumnLayout {
    Layout.fillWidth: true
    spacing: 30

    property var isValid: (function()
    {
        const valid = [];
        for(let index = 0; index < children.length; index++)
        {
            if(children[index] instanceof Input)
            {
                children[index].input.validate();
                valid.push(children[index].isValid)
            }
        }

        return valid.every(element => element === true);
    })

    property var reset: (function()
    {
        for(let index = 0; index < children.length; index++)
        {
            if(children[index] instanceof Input)
            {
                children[index].input.text = "";
            }
        }
    })

    Keys.onPressed: {
        if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return)
        {
            submit.clicked()
        }
    }
}
