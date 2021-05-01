"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.router = void 0;
const express_1 = require("express");
const validation_middleware_1 = require("../middlewares/validation.middleware");
const registerDTO_1 = require("../dto/auth/registerDTO");
const auth_controller_1 = require("../controllers/auth.controller");
const guards_1 = require("../guards");
exports.router = express_1.Router();
exports.router.post('/register', validation_middleware_1.validationMiddleware(registerDTO_1.RegisterDTO), auth_controller_1.register);
exports.router.post('/me', guards_1.isAuthenticatedGuard, auth_controller_1.me);
exports.router.put('/:id', guards_1.isAuthenticatedGuard, auth_controller_1.update);
//# sourceMappingURL=auth.routes.js.map