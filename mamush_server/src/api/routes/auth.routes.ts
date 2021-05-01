import { Router } from 'express';
import { validationMiddleware } from '../middlewares/validation.middleware';
import { RegisterDTO } from '../dto/auth/registerDTO';
import { me, register, update } from '../controllers/auth.controller';
import { isAuthenticatedGuard } from '../guards';

export const router = Router();

router.post('/register', validationMiddleware(RegisterDTO), register);
router.post('/me', isAuthenticatedGuard, me);
router.put('/:id', isAuthenticatedGuard, update);



