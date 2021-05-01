"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.storage = void 0;
const multer_1 = __importDefault(require("multer"));
exports.storage = multer_1.default.diskStorage({
    destination: function (req, file, cb) {
        cb(null, process.env.UPLOAD_DIR);
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + file.originalname);
    }
});
//# sourceMappingURL=multerMiddleware.js.map