import { Request, Response } from 'express';
import { plainToClass } from 'class-transformer';
import { CreateCategoryDTO } from '../dto/category/createCategoryDTO';
import { Container } from 'typedi';
import { ResHandlerService } from '../services/res-handler.service';
import { CategoryService } from '../services/category.service';

const categoryService = Container.get(CategoryService);
const resHandlerService = Container.get(ResHandlerService);
export const create = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(CreateCategoryDTO, req.body);
		const result = await categoryService.create(transformed, req.file);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};

export const get = async (req: Request, res: Response) => {
	try {
		const result = await categoryService.get();
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};
