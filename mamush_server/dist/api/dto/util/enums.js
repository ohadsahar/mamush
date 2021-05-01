"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Edays = exports.ESocketType = exports.EChannelType = exports.EUserType = void 0;
var EUserType;
(function (EUserType) {
    EUserType["admin"] = "admin";
    EUserType["regular"] = "regular";
})(EUserType = exports.EUserType || (exports.EUserType = {}));
var EChannelType;
(function (EChannelType) {
    EChannelType["sport"] = "sport";
    EChannelType["core"] = "core";
})(EChannelType = exports.EChannelType || (exports.EChannelType = {}));
var ESocketType;
(function (ESocketType) {
    ESocketType["connection"] = "connection";
    ESocketType["live"] = "live";
    ESocketType["join"] = "join";
    ESocketType["leave"] = "leave";
    ESocketType["user_report"] = "user_report";
    ESocketType["out_for_commercials"] = "out_for_commercials";
})(ESocketType = exports.ESocketType || (exports.ESocketType = {}));
var Edays;
(function (Edays) {
    Edays["one"] = "1";
    Edays["two"] = "2";
    Edays["three"] = "3";
    Edays["four"] = "4";
    Edays["five"] = "5";
    Edays["six"] = "6";
    Edays["seven"] = "7";
})(Edays = exports.Edays || (exports.Edays = {}));
//# sourceMappingURL=enums.js.map