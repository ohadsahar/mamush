"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
const user_model_1 = require("../api/models/user.model");
const env_config_1 = __importDefault(require("./env.config"));
const file_model_1 = require("../api/models/file.model");
const config = env_config_1.default();
const ormConfig = {
    type: 'postgres',
    host: config.dbHost,
    port: config.dbPort,
    username: config.dbUser,
    password: config.dbPass,
    database: config.dbName,
    entities: [
        user_model_1.User,
        file_model_1.File
    ],
    ssl: config.ssl,
    synchronize: config.synchronize || false,
    logging: config.logging || false,
    dropSchema: config.dropSchema || false,
};
module.exports = ormConfig;
//# sourceMappingURL=orm.config.js.map