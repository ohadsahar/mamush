"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const path = __importStar(require("path"));
const winston_1 = require("winston");
const { combine, timestamp, printf } = winston_1.format;
const customFormat = printf(info => {
    return `${info.timestamp} ${info.level}: ${info.message}`;
});
const Logger = winston_1.createLogger({
    level: 'info',
    format: combine(timestamp(), customFormat),
    transports: [
        //
        // - Write to all logs with level `info` and below to `combined.log`
        // - Write all logs error (and below) to `error.log`.
        //
        new winston_1.transports.File({
            filename: path.join(path.dirname(path.dirname(__dirname)), 'logs', 'error.log'),
            level: 'error'
        }),
        new winston_1.transports.File({ filename: path.join(path.dirname(path.dirname(__dirname)), 'logs', 'combined.log') })
    ]
});
if (process.env.NODE_ENV !== 'production') {
    Logger.add(new winston_1.transports.Console({
        level: 'debug',
        format: combine(winston_1.format.colorize(), customFormat)
    }));
}
exports.default = Logger;
//# sourceMappingURL=logger.config.js.map