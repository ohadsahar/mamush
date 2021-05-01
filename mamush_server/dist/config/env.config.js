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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const minimist_1 = __importDefault(require("minimist"));
const path = __importStar(require("path"));
const argv = minimist_1.default(process.argv.slice(2));
const constants = {
    jwt: {
        forgot_password_token_expires: '1h',
        token_expires: '365 days',
        key: "l23@#shfa1340**@dfg009Alk3#Vk_anlj",
        ignoreExpiration: false
    },
    uploadDir: path.join(__dirname, '../')
};
let config;
const init = () => {
    let envPath = path.join(path.dirname(__dirname), 'env');
    switch (argv.env) {
        case 'prod':
        case 'production':
            config = require(path.join(envPath, 'prod.json'));
            break;
        case 'dev':
        case 'develop':
            config = require(path.join(envPath, 'dev.json'));
            break;
        default:
            config = require(path.join(envPath, 'prod.json'));
            break;
    }
    return Object.assign(config, constants);
};
const getConfig = () => {
    return config || init(); //  "exec": "set TS_NODE_TRANSPILE_ONLY=true&ts-node -r tsconfig-paths/register src/app.ts",
};
exports.default = getConfig;
//# sourceMappingURL=env.config.js.map