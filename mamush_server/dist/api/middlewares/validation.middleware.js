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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.storage = exports.validationMiddleware = void 0;
const class_transformer_1 = require("class-transformer");
const class_validator_1 = require("class-validator");
const lodash_1 = require("lodash");
const typedi_1 = require("typedi");
const res_handler_service_1 = require("../services/res-handler.service");
const multer_1 = __importDefault(require("multer"));
const env_config_1 = __importDefault(require("../../config/env.config"));
const resHandlerService = typedi_1.Container.get(res_handler_service_1.ResHandlerService);
exports.validationMiddleware = (clazz) => {
    return (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const transformedObject = class_transformer_1.plainToClass(clazz, Object.assign(Object.assign(Object.assign({}, req.body), req.params), req.query));
        const errors = yield class_validator_1.validate(transformedObject);
        if (errors && !lodash_1.isEmpty(errors)) {
            resHandlerService.handleValidationErrors(res, errors);
        }
        else {
            next();
        }
    });
};
exports.storage = multer_1.default.diskStorage({
    destination: function (req, file, cb) {
        cb(null, env_config_1.default().uploadDir);
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + file.originalname);
    }
});
//# sourceMappingURL=validation.middleware.js.map