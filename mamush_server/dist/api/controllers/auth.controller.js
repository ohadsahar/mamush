"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.me = exports.update = exports.register = void 0;
const typedi_1 = require("typedi");
const auth_service_1 = require("../services/auth.service");
const res_handler_service_1 = require("../services/res-handler.service");
const class_transformer_1 = require("class-transformer");
const registerDTO_1 = require("../dto/auth/registerDTO");
const userUpdateDTO_1 = require("../dto/auth/userUpdateDTO");
const authService = typedi_1.Container.get(auth_service_1.AuthService);
const resService = typedi_1.Container.get(res_handler_service_1.ResHandlerService);
exports.register = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const transformed = class_transformer_1.plainToClass(registerDTO_1.RegisterDTO, req.body);
        const jwt = yield authService.register(transformed);
        if (jwt) {
            const user = yield authService.getByPhoneNumber(transformed.phoneNumber);
            return resService.handleSuccess(res, { user, jwt });
        }
    }
    catch (e) {
        return resService.handleError(res, e);
    }
});
exports.update = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const transformed = class_transformer_1.plainToClass(userUpdateDTO_1.UserUpdateDTO, Object.assign(Object.assign({}, req.body), req.params));
        const result = yield authService.update(transformed);
        return resService.handleSuccess(res, result);
    }
    catch (e) {
        return resService.handleError(res, e);
    }
});
exports.me = (req, res) => {
    resService.handleSuccess(res, req.user);
};
//# sourceMappingURL=auth.controller.js.map