import { Router } from 'express';
import { isAuthenticatedGuard } from '../guards';
import { validationMiddleware } from '../middlewares/validation.middleware';
import { CreateRecipeDTO } from '../dto/recipe/createRecipeDTO';
import { create, get, getById, searchByAll } from '../controllers/recipe.controller';
import multer from 'multer';
import { IdDTO } from '../dto/util/idDTO';
import { storage } from '../middlewares/multerMiddleware';

const handleFile = multer({ storage }).single('recipePicture');

export const router = Router()
	.post('', handleFile, isAuthenticatedGuard, create)
	.get('/category/:id', isAuthenticatedGuard, validationMiddleware(IdDTO), get)
	.get('/:id', isAuthenticatedGuard, validationMiddleware(IdDTO), getById)
	.post('/search', isAuthenticatedGuard, searchByAll);
