import QtQuick 2.15
import "Types.js" as Types

pragma Singleton
Item {
    property var fakeDatabase: [
        {name:"admin",username:"admin",password:"admin"}
    ]
    property string status: ""
    property string errorMessage: ""

    property var commit: (function(state, payload = undefined) {
        const mutations = {
            [Types.REGISTER_REQUEST]: function (payload) {
                status = "Fake API Request"
                errorMessage = ""
            },
            [Types.REGISTER_ERROR]: function (payload) {
                status = "Register Failed"
                errorMessage = payload
            },
            [Types.REGISTER_SUCCESS]: function (payload) {
                status = "Register Successful"
                errorMessage = ""

                fakeDatabase.push(payload)
                console.log(JSON.stringify(fakeDatabase))
            }
        }

        mutations[state](payload);
    })

    function register(payload)
    {
        commit(Types.REGISTER_REQUEST);

        if(fakeDatabase.find(user => user.username === payload.username))
        {
            commit(Types.REGISTER_ERROR, "Username Already Exists!");
            throw { status, errorMessage };
        }
        else
        {
            commit(Types.REGISTER_SUCCESS, payload);
        }
    }

    function login()
    {
        commit(Types.AUTHENTICATE)
    }

    function logoff()
    {}
}
