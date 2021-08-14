import QtQuick 2.0
import "Types.js" as Types

pragma Singleton
Item {

    signal createSignal(string text, string status)

    function create(text, status)
    {
        createSignal(text, status);
    }

    function show(text, status)
    {
        create(text, status);
    }

    function add(text, status)
    {
        create(text, status);
    }

    function push(text, status)
    {
        create(text, status);
    }

    function success(text)
    {
        create(text, Types.TOAST_SUCCESS);
    }

    function alert(text)
    {
        create(text, Types.TOAST_ERROR);
    }

    function error(text)
    {
        alert(text);
    }
}
