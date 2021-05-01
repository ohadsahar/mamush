"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.isAuthenticatedGuard = void 0;
const validate_jwt_guard_1 = require("./validate-jwt.guard");
exports.isAuthenticatedGuard = [validate_jwt_guard_1.validateJwt];
// export const isAdminGuard = [...isAuthenticatedGuard, isAdmin];
//# sourceMappingURL=index.js.map