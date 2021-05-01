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
const body_parser_1 = __importDefault(require("body-parser"));
const cors_1 = __importDefault(require("cors"));
require("dotenv/config");
const express_1 = __importDefault(require("express"));
const helmet_1 = __importDefault(require("helmet"));
const morgan_1 = __importDefault(require("morgan"));
const nocache_1 = __importDefault(require("nocache"));
const passport_1 = __importDefault(require("passport"));
require("reflect-metadata");
const routes_1 = __importDefault(require("./api/routes"));
const db_config_1 = __importDefault(require("./config/db.config"));
const env_config_1 = __importDefault(require("./config/env.config"));
const jwt_config_1 = require("./config/jwt.config");
const logger_config_1 = __importDefault(require("./config/logger.config"));
// Load configurations
const config = env_config_1.default();
const app = express_1.default();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const socket = require('./socket');
logger_config_1.default.info("Starting server...");
logger_config_1.default.info(`Env: ${config.name}`);
// Express configuration
app.use(helmet_1.default());
app.use(cors_1.default());
app.use(nocache_1.default());
app.use(passport_1.default.initialize());
app.use(body_parser_1.default.json());
app.use(body_parser_1.default.urlencoded({ extended: true }));
app.use(morgan_1.default(config.logLevel || 'tiny'));
app.use(routes_1.default);
function init() {
    return __awaiter(this, void 0, void 0, function* () {
        let db = yield db_config_1.default();
        jwt_config_1.initJWT();
        if (db) {
            logger_config_1.default.info("DB is connected");
            logger_config_1.default.info(config.dbHost);
        }
        else {
            logger_config_1.default.error("Cannot connect to db. this could be fatal");
        }
        socket(io);
        http.listen(process.env.PORT || config.port || 8096, () => logger_config_1.default.info(`Server listening on port ${process.env.PORT || config.port || 8096}. Enjoy!`));
    });
}
init();
exports.default = app;
//# sourceMappingURL=app.js.map