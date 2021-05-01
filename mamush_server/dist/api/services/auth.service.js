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
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
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
exports.AuthService = void 0;
const typedi_1 = require("typedi");
const user_model_1 = require("../models/user.model");
const env_config_1 = __importDefault(require("../../config/env.config"));
const jwt = __importStar(require("jsonwebtoken"));
let AuthService = class AuthService {
    register(registerDTO) {
        return __awaiter(this, void 0, void 0, function* () {
            const userExists = yield this.getByPhoneNumber(registerDTO.phoneNumber);
            if (userExists) {
                return this.createJWT({ id: userExists.id });
            }
            const userCreated = yield user_model_1.User.create(registerDTO).save();
            return this.createJWT({ id: userCreated.id });
        });
    }
    update(userUpdateDTO) {
        return __awaiter(this, void 0, void 0, function* () {
            return user_model_1.User.create(userUpdateDTO).save();
        });
    }
    createJWT(payload, expiration) {
        let token_expires = env_config_1.default().jwt.token_expires;
        if (expiration)
            token_expires = expiration;
        return jwt.sign(payload, env_config_1.default().jwt.key, { expiresIn: token_expires });
    }
    getByPhoneNumber(phoneNumber) {
        return user_model_1.User.findOne({ phoneNumber: phoneNumber });
    }
};
AuthService = __decorate([
    typedi_1.Service()
], AuthService);
exports.AuthService = AuthService;
//# sourceMappingURL=auth.service.js.map