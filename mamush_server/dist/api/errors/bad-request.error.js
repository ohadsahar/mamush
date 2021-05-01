"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.BadRequestError = void 0;
const http_status_codes_1 = require("http-status-codes");
const error_error_1 = __importDefault(require("./error.error"));
class BadRequestError extends error_error_1.default {
    constructor(errorMsgCode, logMessage, error) {
        super(errorMsgCode, logMessage, error ? error : new Error(logMessage), http_status_codes_1.BAD_REQUEST);
    }
}
exports.BadRequestError = BadRequestError;
//# sourceMappingURL=bad-request.error.js.map