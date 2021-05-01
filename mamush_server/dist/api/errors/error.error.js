"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const http_status_codes_1 = require("http-status-codes");
const logger_config_1 = __importDefault(require("../../config/logger.config"));
class ExtendableError extends Error {
    constructor(errorMsgCode, logMessage, error, httpStatus = http_status_codes_1.INTERNAL_SERVER_ERROR) {
        super(logMessage);
        this.errorMsgCode = errorMsgCode;
        this.logMessage = logMessage;
        this.error = error;
        this.httpStatus = httpStatus;
        this.costumeError = true;
        logger_config_1.default.error(logMessage);
        logger_config_1.default.error(error.message);
        console.log(error);
    }
    toJson() {
        return {
            msgCode: this.errorMsgCode,
            msg: this.logMessage,
            originalErrorMsg: this.error.message,
            httpStatus: this.httpStatus
        };
    }
}
exports.default = ExtendableError;
//# sourceMappingURL=error.error.js.map