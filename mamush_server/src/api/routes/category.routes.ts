import { Router } from 'express';
import { validationMiddleware } from '../middlewares/validation.middleware';
import { CreateCategoryDTO } from '../dto/category/createCategoryDTO';
import { create, get } from '../controllers/category.controller';
import { isAuthenticatedGuard } from '../guards';
import multer from 'multer';
import { storage } from '../middlewares/multerMiddleware';

const handleFile = multer({ storage }).single('categoryPicture');

export const router = Router()
	.post('', handleFile, isAuthenticatedGuard, validationMiddleware(CreateCategoryDTO), create)
	.get('', isAuthenticatedGuard, get);
