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
exports.update = void 0;
const class_transformer_1 = require("class-transformer");
const updateUserDTO_1 = require("../dto/user/updateUserDTO");
const typedi_1 = require("typedi");
const res_handler_service_1 = require("../services/res-handler.service");
const user_service_1 = require("../services/user.service");
const userService = typedi_1.Container.get(user_service_1.UserService);
const resHandlerService = typedi_1.Container.get(res_handler_service_1.ResHandlerService);
exports.update = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const transformed = class_transformer_1.plainToClass(updateUserDTO_1.UpdateUserDTO, req.body);
        const result = yield userService.update(transformed, req.file);
        return resHandlerService.handleSuccess(res, result);
    }
    catch (error) {
        return resHandlerService.handleError(res, error);
    }
});
//# sourceMappingURL=user.controller.js.map