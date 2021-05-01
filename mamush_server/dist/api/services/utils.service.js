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
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
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
Object.defineProperty(exports, "__esModule", { value: true });
exports.emailTemplateMap = exports.parsePhone = exports.isValidPhone = exports.getFixedValue = exports.UtilsService = void 0;
const typedi_1 = require("typedi");
const errors_1 = require("../errors");
const libPhoneNumber = __importStar(require("google-libphonenumber"));
let UtilsService = class UtilsService {
    constructor() {
    }
    /**
     * Return new object from given one with only picked fields
     * @param obj
     * @param fields
     */
    pickFieldsFromArray(obj, fields) {
        return new Promise((resolve, reject) => {
            if (typeof (obj) !== 'object') {
                return reject(new Error('bad type'));
            }
            return resolve(fields.reduce((total, current) => {
                if (current in obj)
                    total[current] = obj[current];
                return total;
            }, {}));
        });
    }
    filterArray(obj, arrayFields) {
        return obj.map(val => {
            return Object.keys(val)
                .filter(key => arrayFields.includes(key))
                .filter(key => val[key] !== '')
                .reduce((obj, key) => {
                obj[key] = val[key];
                return obj;
            }, {});
        });
    }
    trimStringsFromObj(obj) {
        return Object.keys(obj).map(k => obj[k] = typeof obj[k] === 'string' ? obj[k].trim() : obj[k]);
    }
    strToBool(str) {
        if (typeof str === 'boolean')
            return str;
        else
            return (str == 'true');
    }
    validatePhoneNumber(phoneNumber) {
        try {
            let str = phoneNumber;
            if (str[0] != "+")
                str = `+${str}`;
            const phoneUtil = libPhoneNumber.PhoneNumberUtil.getInstance();
            const phoneUtilFormat = libPhoneNumber.PhoneNumberFormat;
            const parseNumber = phoneUtil.parseAndKeepRawInput(str);
            const internationalNumber = phoneUtil.format(parseNumber, phoneUtilFormat.E164);
            return internationalNumber;
        }
        catch (e) {
            return null;
        }
    }
    /**
     * Check missing fields in object
     * @param obj
     * @param fields
     */
    checkMissingFields(obj, fields) {
        return new Promise((resolve, reject) => {
            let missingFields = fields.filter(field => !(field in obj));
            return resolve(missingFields);
        });
    }
    /**
     * @description Handle missing fields in object scenario
     * @template T The type for obj
     * @param {DeepPartial<T>} obj the object to check
     * @param {(Array<keyof T & string>)} required fields in obj
     * @param {string} controllerNamespace
     * @param {string} endPoint
     * @memberof UtilsService
     * @author Natan Farkash
     */
    handleMissingFields(obj, required, controllerNamespace, endPoint) {
        return __awaiter(this, void 0, void 0, function* () {
            const missingFields = yield this.checkMissingFields(obj, required);
            if (missingFields.length)
                throw new errors_1.BadRequestError(`${controllerNamespace}.error.${endPoint}`, missingFields.join(', ') + ' are mandatory', new Error("missing params"));
        });
    }
    parseQueryString(query) {
        const result = {};
        for (const [key, value] of Object.entries(query)) {
            switch (value) {
                case false.toString(): {
                    result[key] = false;
                    break;
                }
                case true.toString(): {
                    result[key] = true;
                    break;
                }
                default: {
                    result[key] = value && isFinite(value) ? +value : value;
                }
            }
        }
        return result;
    }
};
UtilsService = __decorate([
    typedi_1.Service(),
    __metadata("design:paramtypes", [])
], UtilsService);
exports.UtilsService = UtilsService;
exports.getFixedValue = (num, precision = 0.2) => {
    return +num.toFixed(precision);
};
/**
 * return if it is legal israeli phone number
 *
 * @param phone - phone number to check
 * @returns {boolean}
 */
exports.isValidPhone = (phone) => {
    return /^\+?(972|0)?(\-)?([5]{1}\d{8})$/.test(phone);
};
/**
 * format phone numbers
 *
 * gets a phone number according to the /^\+?(972|0)?(\-)?([5]{1}\d{8})$/ regex
 * return number started with 972
 * @param phone
 * @returns {*}
 */
exports.parsePhone = (phone) => {
    let parsedPhone = phone;
    if (parsedPhone.startsWith('+'))
        parsedPhone = parsedPhone.substring(1);
    if (!parsedPhone.startsWith('972')) {
        if (parsedPhone.startsWith('0')) {
            parsedPhone = '972' + parsedPhone.substring(1);
        }
        else {
            parsedPhone = '972' + parsedPhone;
        }
    }
    return parsedPhone;
};
exports.emailTemplateMap = {
    NEW_MESSAGE: 'd-85dedd60dc1f461da4eb9ec72127ebce',
};
//# sourceMappingURL=utils.service.js.map