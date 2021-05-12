import { Request, Response } from 'express';
import { Container } from 'typedi';
import { ResHandlerService } from '../services/res-handler.service';
import { plainToClass } from 'class-transformer';
import { CreateRecipeDTO } from '../dto/recipe/createRecipeDTO';
import { RecipeService } from '../services/recipe.service';
import { IdDTO } from '../dto/util/idDTO';
import { FilterDTO } from '../dto/util/filterDTO';

const resHandlerService = Container.get(ResHandlerService);
const recipeService = Container.get(RecipeService);

export const create = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(CreateRecipeDTO, req.body);
		const userID = req.user.id;
		const result = await recipeService.create(transformed, userID, req.file);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};

export const get = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(IdDTO, req.params);
		const userID = req.user.id;
		const result = await recipeService.get(transformed, userID);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};

export const getById = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(IdDTO, req.params);
		const result = await recipeService.getById(transformed);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};

export const searchByAll = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(FilterDTO, req.body);
		const userID = req.user.id;
		const result = await recipeService.searchByAll(transformed, userID);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};
