import QtQuick 2.15
import "Types.js" as Types

pragma Singleton
Item {
    property var fakeDatabase: [
        {name:"admin",username:"admin",password:"admin"}
    ]
    property string status: ""
    property string errorMessage: ""

    property QtObject user: QtObject {
        property string name
    }


    property var commit: (function(state, payload = undefined) {
        const mutations = {
            [Types.REGISTER_REQUEST]: function (payload)
            {
                status = "Fake API Request";
                errorMessage = "";
            },
            [Types.REGISTER_ERROR]: function (payload)
            {
                status = "Register Failed"
                errorMessage = payload
            },
            [Types.REGISTER_SUCCESS]: function (payload)
            {
                status = "Register Successful";
                errorMessage = "";

                fakeDatabase.push(payload)
                console.log(JSON.stringify(fakeDatabase))
            },
            [Types.AUTH_REQUEST]: function (payload)
            {
                status = "Fake API Request";
                errorMessage = "";
            },
            [Types.AUTH_ERROR]: function (payload)
            {
                status = "Login Failed";
                errorMessage = payload;
            },
            [Types.AUTH_SUCCESS]: function (payload)
            {
                status = "Login Successful";
                errorMessage = "";

                user.name = payload.name
            },
            [Types.AUTH_LOGOFF]: function (payload)
            {
                status = "Log Off Successful";
                errorMessage = "";

                user.name = ""
            },
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

    function login(payload)
    {
        commit(Types.AUTH_REQUEST)

        const userDB = fakeDatabase.find(user => user.username === payload.username);

        if( userDB === undefined)
        {
            commit(Types.AUTH_ERROR, "User Not Found!");
            throw { status, errorMessage };
        }

        if( userDB.password !== payload.password)
        {
            commit(Types.AUTH_ERROR, "Invalid Password!");
            throw { status, errorMessage };
        }

        commit(Types.AUTH_SUCCESS, userDB);
    }

    function logoff()
    {
        commit(Types.AUTH_LOGOFF)
    }
}
