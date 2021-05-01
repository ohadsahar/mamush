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
const db_config_1 = __importDefault(require("./config/db.config"));
const jwt_config_1 = require("./config/jwt.config");
const logger_config_1 = __importDefault(require("./config/logger.config"));
const typedi_1 = require("typedi");
const country_service_1 = require("./api/services/country.service");
const channel_service_1 = require("./api/services/channel.service");
const tvShow_service_1 = require("./api/services/tvShow.service");
const enums_1 = require("./api/dto/util/enums");
const countryService = typedi_1.Container.get(country_service_1.CountryService);
const channelService = typedi_1.Container.get(channel_service_1.ChannelService);
const tvShowService = typedi_1.Container.get(tvShow_service_1.TvShowService);
const countries = [
    { name: 'Israel' },
    { name: 'USA' }
];
const channels = [
    { name: 'ערוץ 12', type: enums_1.EChannelType.core, country: 1 },
    { name: 'ערוץ 13', type: enums_1.EChannelType.core, country: 1 },
    { name: 'CNN', type: enums_1.EChannelType.core, country: 2 },
    { name: 'AXN', type: enums_1.EChannelType.core, country: 2 },
];
const tvShows = [
    { tvShowName: 'ארץ נהדרת', startHour: '12:50', endHour: '12:52', country: 1, channel: 1 },
    { tvShowName: 'חתונה ממבט ראשון', startHour: '12:52', endHour: '12:54', country: 1, channel: 1 },
    { tvShowName: 'Ninja USA', startHour: '2021-01-08 17:01:52.291766+02', endHour: '2021-01-08 17:01:52.291766+02', country: 2, channel: 4 },
];
function init() {
    return __awaiter(this, void 0, void 0, function* () {
        let db = yield db_config_1.default();
        jwt_config_1.initJWT();
        if (db) {
            logger_config_1.default.info("DB is connected");
            yield startFreshStart();
        }
        else {
            logger_config_1.default.error("Cannot connect to db. this could be fatal");
        }
    });
}
function startFreshStart() {
    return __awaiter(this, void 0, void 0, function* () {
        logger_config_1.default.info('Create Countries');
        for (const country of countries) {
            yield countryService.upsert(country);
        }
        logger_config_1.default.info('Created Countries');
        logger_config_1.default.info('Create Channels');
        for (const channel of channels) {
            yield channelService.upsert(channel);
        }
        logger_config_1.default.info('Created Channels');
        logger_config_1.default.info('Create Tv Shows');
        for (const tvShow of tvShows) {
            yield tvShowService.upsert(tvShow);
        }
        logger_config_1.default.info('Created Tv Shows');
    });
}
init();
//# sourceMappingURL=freshstart.js.map