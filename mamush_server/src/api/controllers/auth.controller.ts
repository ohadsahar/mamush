import { Request, Response } from 'express';
import { Container } from 'typedi';
import { AuthService } from '../services/auth.service';
import { ResHandlerService } from '../services/res-handler.service';
import { plainToClass } from 'class-transformer';
import { RegisterDTO } from '../dto/auth/registerDTO';
import { UserUpdateDTO } from '../dto/auth/userUpdateDTO';

const authService = Container.get(AuthService);
const resService = Container.get(ResHandlerService);

export const register = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(RegisterDTO, req.body);
		const jwt = await authService.register(transformed);
		if (jwt) {
			const user = await authService.getByPhoneNumber(transformed.phoneNumber);
			return resService.handleSuccess(res, { user, jwt });
		}
	} catch (e) {
		return resService.handleError(res, e);
	}
};

export const update = async (req: Request, res: Response) => {
	try {
		const transformed = plainToClass(UserUpdateDTO, { ...req.body, ...req.params });
		const result = await authService.update(transformed);
		return resService.handleSuccess(res, result);
	} catch (e) {
		return resService.handleError(res, e);
	}
};

export const me = (req: Request, res: Response) => {
	resService.handleSuccess(res, req.user);
};





