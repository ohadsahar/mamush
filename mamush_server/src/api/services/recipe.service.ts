import { Service } from 'typedi';
import { CreateRecipeDTO } from '../dto/recipe/createRecipeDTO';
import { Recipe } from '../models/recipe.model';
import { File } from '../models/file.model';
import { FileService } from './file.service';
import { IdDTO } from '../dto/util/idDTO';
import { FilterDTO } from '../dto/util/filterDTO';

@Service()
export class RecipeService {
	constructor(private fileService: FileService) {
	}

	async create(createRecipeDTO: CreateRecipeDTO, user, recipePicture?): Promise<Recipe> {

		for (let i = 0; i < createRecipeDTO.ingredients.length; i++) {
			createRecipeDTO.ingredients[i].id = Number(createRecipeDTO.ingredients[i].id);
		}
		for (let i = 0; i < createRecipeDTO.tags.length; i++) {
			createRecipeDTO.tags[i].id = Number(createRecipeDTO.tags[i].id);
			createRecipeDTO.tags[i].category = Number(createRecipeDTO.tags[i].category);
			createRecipeDTO.tags[i].user = Number(user.id);
		}

		if (recipePicture) {
			const fileModel = new File();
			const { Location, Key } = await this.fileService.uploadImage(recipePicture.filename, recipePicture.originalname);
			fileModel.fileName = Key;
			fileModel.filePath = Location;
			createRecipeDTO.recipePicture = await this.fileService.saveImage(fileModel);
		}
		createRecipeDTO.user = user;
		return Recipe.create(createRecipeDTO).save();
	}

	get(idDTO: IdDTO): Promise<Recipe[]> {
		return Recipe.find({
			where: {
				category: idDTO.id
			},
			relations: ['ingredients', 'instructions', 'recipePicture']
		});
	}

	getById(idDTO: IdDTO): Promise<Recipe> {
		return Recipe.findOne({ id: idDTO.id }, { relations: ['ingredients', 'instructions', 'recipePicture'] });
	}

	async searchByAll(filterDTO: FilterDTO): Promise<Recipe[]> {
		let query = await Recipe.createQueryBuilder('recipe')
			.leftJoinAndSelect('recipe.ingredients', 'ingredients')
			.leftJoinAndSelect('recipe.instructions', 'instructions')
			.leftJoinAndSelect('recipe.recipePicture', 'recipePicture')
			.leftJoinAndSelect('recipe.category', 'category')
			.leftJoinAndSelect('recipe.tags', 'tags');

		if (filterDTO.category) {
			query.andWhere('category.id = :id', { id: filterDTO.category });
		}
		if (filterDTO.ids?.length) {
			query.andWhere('ingredients.id IN (:...ids)', { ids: filterDTO.ids });
		}

		if (filterDTO?.name) {
			query = query.andWhere('recipe.recipeName like :searchText', { searchText: '%' + filterDTO.name + '%' });
		}

		if (filterDTO.tags?.length) {
			query.andWhere('tags.id IN (:...ids)', { ids: filterDTO.tags });
		}

		return query.getMany();
	}

}
