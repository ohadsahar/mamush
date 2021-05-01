"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ResHandlerService = void 0;
const http_status_codes_1 = require("http-status-codes");
const typedi_1 = require("typedi");
let ResHandlerService = class ResHandlerService {
    constructor() {
    }
    handleError(res, error, status = http_status_codes_1.INTERNAL_SERVER_ERROR) {
        var _a;
        console.log(error);
        // @ts-ignore
        error.errInUse = (_a = error === null || error === void 0 ? void 0 : error.code) === null || _a === void 0 ? void 0 : _a.includes('ROW_IS_REFERENCED');
        return res.status((error === null || error === void 0 ? void 0 : error.httpStatus) ? error.httpStatus : status).json({
            error: error,
            success: false,
        });
    }
    /**
     * handle success response
     * send data, success and new token TODO: add create token
     * @param res
     * @param data
     * @param status
     */
    handleSuccess(res, data, status = http_status_codes_1.OK) {
        return res.status(status).json({
            data,
            success: true
        });
    }
    /**
     * handle file response
     * send data, success and new token TODO: add create token
     * @param res
     * @param data
     * @param status
     */
    handleFile(res, data, status = http_status_codes_1.OK) {
        return res.status(status).type('application/pdf').attachment().end(data);
    }
    handleValidationErrors(res, errors) {
        let validateFields = errors.map((err, index) => {
            let msg = err.property;
            if (index != errors.length - 1)
                msg += ", ";
            return msg;
        });
        res.status(http_status_codes_1.INTERNAL_SERVER_ERROR).json({
            success: false,
            errors: errors.map((err) => {
                return {
                    property: err.property,
                    constraints: err.constraints
                };
            }),
            error: {
                errorMsgCode: "Fields validation error",
                logMessage: `The following fields should be validated: ${validateFields}`
            }
        });
    }
};
ResHandlerService = __decorate([
    typedi_1.Service(),
    __metadata("design:paramtypes", [])
], ResHandlerService);
exports.ResHandlerService = ResHandlerService;
//# sourceMappingURL=res-handler.service.js.map