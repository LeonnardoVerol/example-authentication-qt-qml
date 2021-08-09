import QtQuick 2.15
import QtQuick.Layouts 1.12
import "../../../SharedComponents"

ColumnLayout {
    Layout.fillWidth: true
    spacing: 30

    property var isValid: (function()
    {
        let valid;
        for(let index = 0; index < children.length; index++)
        {
            if(children[index] instanceof Input)
            {
                children[index].input.validate();
                valid = children[index].isValid
            }
        }
        return valid;
    })
}
