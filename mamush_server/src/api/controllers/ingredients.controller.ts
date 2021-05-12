import { Request, Response } from 'express';
import { plainToClass } from 'class-transformer';
import { Container } from 'typedi';
import { ResHandlerService } from '../services/res-handler.service';
import { FilterDTO } from '../dto/util/filterDTO';
import { IngredientsService } from '../services/ingredients.service';
import { CreateIngredientDTO } from '../dto/ingredient/createIngredientDTO';

const ingredientsService = Container.get(IngredientsService);
const resHandlerService = Container.get(ResHandlerService);

export const get = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(FilterDTO, req.params);
		const result = await ingredientsService.get(transformed);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};

export const create = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(CreateIngredientDTO, req.body);
		const result = await ingredientsService.create(transformed);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};
