import csrfFetch from "./csrf";
import { SET_USER_PROFILE } from "./profile";

export const ADD_CONNECTION = 'connection/addConnection';
export const DELETE_CONNECTION = 'connection/deleteConnection';

const addConnection = (connection) => {
    return {
        type: ADD_CONNECTION,
        payload: connection
    }
}

const deleteConnection = (connecteeId) => {
    return {
        type: DELETE_CONNECTION,
        payload: connecteeId
    }
}

export const createConnection = (connection) => async dispatch => {
    const {connecterId, connecteeId} = connection
    const response = await csrfFetch("/api/connections", {
        method: "POST",
        body: JSON.stringify({
            connection:{
                connecterId,
                connecteeId
            }
    })
});
    const data = await response.json();
    dispatch(addConnection(data.user));
    return response;
}

export const removeConnection = (connecteeId) => async dispatch => {
    const response = await csrfFetch(`/api/connections/${connecteeId}`, {
        method: "DELETE"
    });
    const data = await response.json();
    dispatch(deleteConnection(data.user));
    return response;
};

export const connectionReducer = (state = {}, action) => {
    switch (action.type) {
        case SET_USER_PROFILE:
            return { ...action.payload.connectedUser };
        case ADD_CONNECTION:
            return { ...state, ...action.payload };
        case DELETE_CONNECTION:
            const newState = { ...state };
            delete newState[action.payload];
            return newState;
        default:
            return state;
    }
};