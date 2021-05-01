import { IsString } from 'class-validator';
import { File } from '../../models/file.model';
import { Type } from 'class-transformer';

export class UpdateUserDTO {

	@Type(() => Number)
	id: number;

	@IsString()
	fullName: string;

	profilePicture: string;
}
