import { Service } from 'typedi';
import { User } from '../models/user.model';

import getConfig from '../../config/env.config';
import * as jwt from 'jsonwebtoken';
import { RegisterDTO } from '../dto/auth/registerDTO';
import { UserUpdateDTO } from '../dto/auth/userUpdateDTO';

@Service()
export class AuthService {

	async register(registerDTO: RegisterDTO): Promise<string> {
		const userExists = await this.getByPhoneNumber(registerDTO.phoneNumber);
		if (userExists) {
			return this.createJWT({ id: userExists.id });
		}
		const userCreated = await User.create(registerDTO).save();
		return this.createJWT({ id: userCreated.id });
	}

	async update(userUpdateDTO: UserUpdateDTO): Promise<User> {
		return User.create(userUpdateDTO).save();
	}

	createJWT(payload, expiration?: string) {
		let token_expires = getConfig().jwt.token_expires;
		if (expiration)
			token_expires = expiration;
		return jwt.sign(payload, getConfig().jwt.key, { expiresIn: token_expires });
	}

	getByPhoneNumber(phoneNumber: string): Promise<User> {
		return User.findOne({ phoneNumber: phoneNumber }, {relations:['profilePicture']});
	}
}


