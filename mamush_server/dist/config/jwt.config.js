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
exports.initJWT = void 0;
const passport_1 = __importDefault(require("passport"));
const passport_jwt_1 = require("passport-jwt");
const errors_1 = require("../api/errors");
const env_config_1 = __importDefault(require("./env.config"));
const logger_config_1 = __importDefault(require("./logger.config"));
const user_model_1 = require("../api/models/user.model");
const config = env_config_1.default();
exports.initJWT = () => {
    logger_config_1.default.info('Initiating jwt');
    const options = {
        jwtFromRequest: passport_jwt_1.ExtractJwt.fromAuthHeaderAsBearerToken(),
        secretOrKey: config.jwt.key,
        ignoreExpiration: config.jwt.ignoreExpiration
    };
    let strategy = new passport_jwt_1.Strategy(options, function (jwt_payload, done) {
        return __awaiter(this, void 0, void 0, function* () {
            let userAdmin = yield user_model_1.User.findOne({ id: jwt_payload.id });
            if (userAdmin) {
                return done(null, { userAdmin });
            }
            let user = yield user_model_1.User.findOne({ id: jwt_payload.id });
            if (!user) {
                return done(null, false, new errors_1.ForbiddenError('auth.error.invalid_token', 'User wasn\'t found', new Error('No user with id' + jwt_payload.id)));
            }
            return done(null, { user });
        });
    });
    passport_1.default.use(strategy);
};
//# sourceMappingURL=jwt.config.js.map