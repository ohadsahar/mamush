"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const auth_routes_1 = require("../routes/auth.routes");
const user_routes_1 = require("../routes/user.routes");
const APIRouter = express_1.Router({ mergeParams: true });
APIRouter.use('/auth', auth_routes_1.router);
APIRouter.use('/user', user_routes_1.router);
exports.default = APIRouter;
//# sourceMappingURL=index.js.map