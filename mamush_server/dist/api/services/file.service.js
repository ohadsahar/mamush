"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
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
exports.FileService = void 0;
const aws_sdk_1 = require("aws-sdk");
const crypto_1 = require("crypto");
const del_1 = __importDefault(require("del"));
const fs_1 = require("fs");
const moment_1 = __importDefault(require("moment"));
const path_1 = require("path");
const typedi_1 = require("typedi");
const util_1 = require("util");
const file_model_1 = require("../models/file.model");
let FileService = class FileService {
    create(params) {
        return file_model_1.File.create(params).save();
    }
    uploadS3(filePath, originalName, extensions) {
        return __awaiter(this, void 0, void 0, function* () {
            this.checkExtension(filePath, originalName, extensions);
            const Body = yield util_1.promisify(fs_1.readFile)(filePath);
            return yield this.uploadBuffer(Body, originalName, filePath);
        });
    }
    uploadBuffer(Body, name, filePath) {
        return new Promise((resolve, reject) => {
            new aws_sdk_1.S3().upload({
                Body,
                Bucket: process.env.AWS_S3_BUCKET,
                Key: `${moment_1.default().format('YYYY-MM-DD')}/${crypto_1.createHash('sha1').update(Date.now().toString()).digest('hex')}/${crypto_1.createHash('md5').update(name).digest('hex')}/${name}`,
                ACL: 'public-read'
            }, (error, data) => __awaiter(this, void 0, void 0, function* () {
                if (error)
                    reject(error);
                if (filePath)
                    yield this.cleanFile(filePath);
                resolve(data);
            }));
        });
    }
    checkExtension(filePath, originalName, extensions) {
        if (!extensions)
            return;
        if (!filePath)
            throw new Error('general.error.no_file');
        if (!extensions.includes(path_1.extname(originalName).toLocaleLowerCase()))
            throw new Error('general.error.file_ext');
    }
    cleanFile(filePath) {
        return del_1.default([filePath]);
    }
    uploadImage(filename, originalname) {
        return this.uploadS3(process.env.UPLOAD_DIR + filename, originalname, ['.jpg', '.jpeg', '.png']);
    }
    removeS3(fileName) {
        return __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => {
                new aws_sdk_1.S3().deleteObjects({
                    Bucket: process.env.AWS_S3_BUCKET,
                    Delete: { Objects: [{ Key: fileName }] }
                }, (error, data) => {
                    if (error)
                        reject(error);
                    resolve(data);
                });
            });
        });
    }
    saveImage(file) {
        return file_model_1.File.save(file);
    }
    deleteFile(fileId) {
        return __awaiter(this, void 0, void 0, function* () {
            return file_model_1.File.delete(fileId);
        });
    }
};
FileService = __decorate([
    typedi_1.Service()
], FileService);
exports.FileService = FileService;
//# sourceMappingURL=file.service.js.map