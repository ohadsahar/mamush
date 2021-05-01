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
exports.MainEntity = void 0;
const typeorm_1 = require("typeorm");
class MainEntity extends typeorm_1.BaseEntity {
    constructor() {
        super(...arguments);
        this._type = this.constructor.name;
    }
}
__decorate([
    typeorm_1.PrimaryGeneratedColumn(),
    __metadata("design:type", Number)
], MainEntity.prototype, "id", void 0);
__decorate([
    typeorm_1.Column({ type: 'timestamp with time zone', name: '_createdAt', default: () => 'LOCALTIMESTAMP' }),
    __metadata("design:type", String)
], MainEntity.prototype, "_createdAt", void 0);
__decorate([
    typeorm_1.Column({ type: 'timestamp with time zone', name: '_updatedAt', default: () => 'LOCALTIMESTAMP' }),
    __metadata("design:type", String)
], MainEntity.prototype, "_updatedAt", void 0);
__decorate([
    typeorm_1.VersionColumn(),
    __metadata("design:type", Number)
], MainEntity.prototype, "_version", void 0);
exports.MainEntity = MainEntity;
//# sourceMappingURL=main.abstract.js.map