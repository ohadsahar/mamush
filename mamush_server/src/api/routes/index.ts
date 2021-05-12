import { Router } from 'express';
import { router as AuthRoutes } from '../routes/auth.routes';
import { router as UserRoutes } from '../routes/user.routes';
import { router as CategoryRoutes } from '../routes/category.routes';
import { router as RecipeRoutes } from './recipe.routes';
import { router as TagsRoutes } from './tags.routes';
import { router as IngredientsRoutes } from './ingredients.routes';

const APIRouter = Router({ mergeParams: true });

APIRouter.use('/auth', AuthRoutes);
APIRouter.use('/user', UserRoutes);
APIRouter.use('/category', CategoryRoutes);
APIRouter.use('/recipe', RecipeRoutes);
APIRouter.use('/tags', TagsRoutes);
APIRouter.use('/ingredients', IngredientsRoutes);

export default APIRouter;
