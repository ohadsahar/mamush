import { File } from '../../models/file.model';
import { IsString } from 'class-validator';

export class CreateCategoryDTO {

	@IsString()
	name: string;

	categoryPicture: File;
}
