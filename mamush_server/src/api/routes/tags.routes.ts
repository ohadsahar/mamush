import { Router } from 'express';
import { isAuthenticatedGuard } from '../guards';
import { validationMiddleware } from '../middlewares/validation.middleware';
import { IdDTO } from '../dto/util/idDTO';
import { get } from '../controllers/tags.controller';

export const router = Router()
.get('/:id', isAuthenticatedGuard, validationMiddleware(IdDTO), get)
