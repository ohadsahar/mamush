import { Router } from 'express';
import { validationMiddleware } from '../middlewares/validation.middleware';
import { isAuthenticatedGuard } from '../guards';
import { FilterDTO } from '../dto/util/filterDTO';
import { create, get } from '../controllers/ingredients.controller';
import { CreateIngredientDTO } from '../dto/ingredient/createIngredientDTO';

export const router = Router()
	.get('/:name', validationMiddleware(FilterDTO), isAuthenticatedGuard, get)
	.post('/', validationMiddleware(CreateIngredientDTO), isAuthenticatedGuard, create);
