"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.router = void 0;
const express_1 = require("express");
const guards_1 = require("../guards");
const validation_middleware_1 = require("../middlewares/validation.middleware");
const updateUserDTO_1 = require("../dto/user/updateUserDTO");
const user_controller_1 = require("../controllers/user.controller");
const multer_1 = __importDefault(require("multer"));
const storage = multer_1.default.diskStorage({
    destination: function (req, file, cb) {
        cb(null, process.env.UPLOAD_DIR);
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + file.originalname);
    }
});
const handleFile = multer_1.default({ storage }).single('profilePicture');
exports.router = express_1.Router()
    .put('/update', handleFile, guards_1.isAuthenticatedGuard, validation_middleware_1.validationMiddleware(updateUserDTO_1.UpdateUserDTO), user_controller_1.update);
//# sourceMappingURL=user.routes.js.map