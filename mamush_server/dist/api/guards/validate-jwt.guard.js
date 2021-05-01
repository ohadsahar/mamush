"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.validateJwt = void 0;
const passport_1 = require("passport");
const typedi_1 = require("typedi");
const errors_1 = require("../errors");
const res_handler_service_1 = require("../services/res-handler.service");
const lodash_1 = require("lodash");
const resService = typedi_1.Container.get(res_handler_service_1.ResHandlerService);
exports.validateJwt = (req, res, next) => {
    return passport_1.authenticate('jwt', { session: false, failWithError: true }, (err, data, info) => {
        var _a;
        if (err) {
            return resService.handleError(res, new errors_1.ForbiddenError('general.error.authenticate_jwt', 'error authenticating jwt', err));
        }
        if (!data || !(data === null || data === void 0 ? void 0 : data.user) && !(data === null || data === void 0 ? void 0 : data.userAdmin)) {
            return resService.handleError(res, new errors_1.ForbiddenError('general.error.authenticate_jwt', 'error authenticating jwt', new Error("no data")));
        }
        else {
            const user = (_a = data.user) !== null && _a !== void 0 ? _a : data.userAdmin;
            req.user = lodash_1.cloneDeep(user);
            req.isAuthenticated = () => true;
        }
        return next();
    })(req, res, next);
};
//# sourceMappingURL=validate-jwt.guard.js.map