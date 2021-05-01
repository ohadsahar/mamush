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
const typeorm_1 = require("typeorm");
const logger_config_1 = __importDefault(require("./logger.config"));
const orm_config_1 = __importDefault(require("./orm.config"));
const bootstrapDb = () => __awaiter(void 0, void 0, void 0, function* () {
    let conn;
    try {
        conn = yield typeorm_1.createConnection(Object.assign(Object.assign({}, orm_config_1.default), { type: "postgres" }));
    }
    catch (e) {
        conn = false;
        logger_config_1.default.error(e.message);
    }
    return conn;
});
exports.default = bootstrapDb;
//# sourceMappingURL=db.config.js.map