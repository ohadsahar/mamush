import { Service } from 'typedi';
import { Category } from '../models/category.model';
import { CreateCategoryDTO } from '../dto/category/createCategoryDTO';
import { File } from '../models/file.model';
import { FileService } from './file.service';

@Service()
export class CategoryService {

	constructor(private fileService: FileService) {
	}

	async create(createCategoryDTO: CreateCategoryDTO, categoryPicture?): Promise<Category> {
		const fileModel = new File();
		const { Location, Key } = await this.fileService.uploadImage(categoryPicture.filename, categoryPicture.originalname);
		fileModel.fileName = Key;
		fileModel.filePath = Location;
		createCategoryDTO.categoryPicture = await this.fileService.saveImage(fileModel);
		return Category.create(createCategoryDTO).save();
	}

	async get(): Promise<Category[]> {
		return Category.find({relations:['categoryPicture']});
	}
}
