import { Request, Response } from 'express';
import { plainToClass } from 'class-transformer';
import { UpdateUserDTO } from '../dto/user/updateUserDTO';
import { Container } from 'typedi';
import { ResHandlerService } from '../services/res-handler.service';
import { UserService } from '../services/user.service';

const userService = Container.get(UserService);
const resHandlerService = Container.get(ResHandlerService);

export const update = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(UpdateUserDTO, req.body);
		const result = await userService.update(transformed, req.file);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};

export const getMe = async (req: Request, res: Response) => {
	try {
		const id = req.user.id;
		const result = await userService.getById(id);
		return resHandlerService.handleSuccess(res, result);
	} catch (error) {
		return resHandlerService.handleError(res, error);
	}
};
