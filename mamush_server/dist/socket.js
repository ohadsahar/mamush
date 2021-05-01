"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const enums_1 = require("./api/dto/util/enums");
const rooms = [];
exports = module.exports = function (io) {
    io.sockets.on(enums_1.ESocketType.connection, function (socket) {
        socket.on(enums_1.ESocketType.live, function (data) {
            const countryRooms = rooms.filter((room) => room.countryID === data.countryID);
            io.emit(enums_1.ESocketType.live, {
                message: {
                    'countryRooms': countryRooms,
                    'token': data.token
                }
            });
        });
        socket.on(enums_1.ESocketType.join, function (data) {
            socket.join(data.room);
            const indexOfRoom = rooms.findIndex((room) => room.name === data.room);
            if (indexOfRoom >= 0) {
                const indexOfFirebaseToken = rooms[indexOfRoom].firebaseTokens.findIndex(firebaseToken => firebaseToken === data.firebaseToken);
                if (indexOfFirebaseToken >= 0) {
                    rooms[indexOfRoom].firebaseTokens[indexOfFirebaseToken] = data.firebaseToken;
                }
                else {
                    rooms[indexOfRoom].firebaseTokens.push(data.firebaseToken);
                }
                io.in(data.room).emit(data.room, {
                    message: {
                        'action': 'Set',
                        'token': data.firebaseToken,
                        'count': rooms[indexOfRoom].count,
                        'active': rooms[indexOfRoom].active,
                    }
                });
            }
            else {
                rooms.push({
                    'name': data.room, 'count': 0, 'firebaseTokens': [data.firebaseToken], active: null,
                    'countryID': data.countryID,
                });
                io.in(data.room).emit(data.room, {
                    message: {
                        'action': 'Set',
                        'token': data.firebaseToken,
                        'count': 0,
                        'active': false
                    }
                });
            }
        });
        socket.on(enums_1.ESocketType.user_report, function (data) {
            const indexOfRoom = rooms.findIndex((room) => room.name === data.room);
            if (indexOfRoom >= 0) {
                rooms[indexOfRoom].count += 1;
            }
            io.in(data.room).emit(data.room, {
                message: {
                    'action': 'Increment',
                    'token': data.token,
                    'count': rooms[indexOfRoom].count
                }
            });
        });
        socket.on(enums_1.ESocketType.out_for_commercials, function (data) {
            const indexOfRoom = rooms.findIndex((room) => room.name === data.room);
            if (indexOfRoom >= 0) {
                rooms[indexOfRoom].count = 0;
                rooms[indexOfRoom].active = !rooms[indexOfRoom].active;
                io.in(data.room).emit(data.room, {
                    message: {
                        'action': 'Out',
                        'firebaseTokens': rooms[indexOfRoom].firebaseTokens,
                        'id': data.id,
                        'channelName': data.room
                    }
                });
            }
        });
        socket.on(enums_1.ESocketType.leave, function (data) {
            const indexOfRoom = rooms.findIndex((currentRoom) => currentRoom.name === data.room);
            if (indexOfRoom >= 0) {
                const indexOfUserFirebaseToken = rooms[indexOfRoom].firebaseTokens.findIndex((firebaseToken) => firebaseToken === data.firebaseToken);
                if (indexOfUserFirebaseToken >= 0) {
                    rooms[indexOfRoom].firebaseTokens.splice(indexOfUserFirebaseToken, 1);
                }
            }
        });
    });
};
//# sourceMappingURL=socket.js.map