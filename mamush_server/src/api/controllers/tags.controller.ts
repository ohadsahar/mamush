import { Request, Response } from 'express';
import { plainToClass } from 'class-transformer';
import { IdDTO } from '../dto/util/idDTO';
import { Container } from 'typedi';
import { TagsService } from '../services/tags.service';
import { ResHandlerService } from '../services/res-handler.service';

const tagsService = Container.get(TagsService);
const resHandlerService = Container.get(ResHandlerService);

export const get = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(IdDTO, req.params);
		const userID = req.user.id;
		const result = await tagsService.get(transformed, userID);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};
