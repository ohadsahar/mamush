import { Router } from 'express';
import { isAuthenticatedGuard } from '../guards';
import { validationMiddleware } from '../middlewares/validation.middleware';
import { UpdateUserDTO } from '../dto/user/updateUserDTO';
import { getMe, update } from '../controllers/user.controller';
import multer from 'multer';
import { storage } from '../middlewares/multerMiddleware';

const handleFile = multer({ storage }).single('profilePicture');

export const router = Router()
	.put('', handleFile, isAuthenticatedGuard, validationMiddleware(UpdateUserDTO), update)
	.get('', isAuthenticatedGuard, getMe);
