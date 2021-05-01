import { Service } from 'typedi';
import { UpdateUserDTO } from '../dto/user/updateUserDTO';
import { User } from '../models/user.model';
import { FileService } from './file.service';
import { File } from '../models/file.model';

@Service()
export class UserService {

	constructor(private fileService: FileService) {
	}

	async update(updateUserDTO: UpdateUserDTO, profilePicture?): Promise<User> {
		const existsUser = await this.getById(updateUserDTO.id);
		if (profilePicture) {
			if (existsUser.profilePicture) {
				await this.fileService.removeS3(existsUser.profilePicture.fileName);
			}
			const fileModel = new File();
			const { Location, Key } = await this.fileService.uploadImage(profilePicture.filename, profilePicture.originalname);
			fileModel.fileName = Key;
			fileModel.filePath = Location;
			existsUser.profilePicture = await this.fileService.saveImage(fileModel);
		}
		existsUser.fullName = updateUserDTO.fullName ?? existsUser.fullName;
		return User.create(existsUser).save();
	}

	getById(id: number): Promise<User> {
		return User.findOne(id, {relations:['profilePicture']});
	}
}
