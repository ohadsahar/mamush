import { Service } from 'typedi';
import { CreateRecipeDTO } from '../dto/recipe/createRecipeDTO';
import { Recipe } from '../models/recipe.model';
import { FileService } from './file.service';
import { IdDTO } from '../dto/util/idDTO';
import { FilterDTO } from '../dto/util/filterDTO';
import { File } from '../models/file.model';

@Service()
export class RecipeService {
	constructor(private fileService: FileService) {
	}

	async create(createRecipeDTO: CreateRecipeDTO, userID: number, recipePicture?): Promise<Recipe> {

		for (let i = 0; i < createRecipeDTO.recipeIngredients.length; i++) {
			if (createRecipeDTO.recipeIngredients[i].id) {
				createRecipeDTO.recipeIngredients[i].id = Number(createRecipeDTO.recipeIngredients[i].id);
			}
		}
		for (let i = 0; i < createRecipeDTO.tags.length; i++) {
			createRecipeDTO.tags[i].id = Number(createRecipeDTO.tags[i].id);
			createRecipeDTO.tags[i].category = Number(createRecipeDTO.tags[i].category);
			createRecipeDTO.tags[i].user = Number(userID);
		}

		if (recipePicture) {
			const fileModel = new File();
			const { Location, Key } = await this.fileService.uploadImage(recipePicture.filename, recipePicture.originalname);
			fileModel.fileName = Key;
			fileModel.filePath = Location;
			createRecipeDTO.recipePicture = await this.fileService.saveImage(fileModel);
		}

		createRecipeDTO.user = userID;
		return Recipe.create(createRecipeDTO).save();
	}

	get(idDTO: IdDTO, userID: number): Promise<Recipe[]> {

		return Recipe.createQueryBuilder('recipe')
			.leftJoinAndSelect('recipe.recipeIngredients', 'recipeIngredients')
			.leftJoinAndSelect('recipe.user', 'user')
			.leftJoinAndSelect('recipeIngredients.ingredient', 'ingredient')
			.leftJoinAndSelect('recipe.instructions', 'instructions')
			.leftJoinAndSelect('recipe.recipePicture', 'recipePicture')
			.leftJoinAndSelect('recipe.category', 'category')
			.leftJoinAndSelect('recipe.tags', 'tags')
			.where('user.id =:id', { id: userID })
			.andWhere('category.id = :id', { id: idDTO.id })
			.getMany();
	}

	getById(idDTO: IdDTO): Promise<Recipe> {
		return Recipe.findOne({ id: idDTO.id }, { relations: ['recipeIngredients', 'instructions', 'recipePicture'] });
	}

	async searchByAll(filterDTO: FilterDTO, userID: number): Promise<Recipe[]> {
		let query = await Recipe.createQueryBuilder('recipe')
			.leftJoinAndSelect('recipe.recipeIngredients', 'recipeIngredients')
			.leftJoinAndSelect('recipe.instructions', 'instructions')
			.leftJoinAndSelect('recipe.recipePicture', 'recipePicture')
			.leftJoinAndSelect('recipe.category', 'category')
			.leftJoinAndSelect('recipe.tags', 'tags')
			.leftJoinAndSelect('recipe.user', 'user')
			.where('user.id =:id', { id: userID });

		if (filterDTO.category) {
			query.andWhere('category.id = :id', { id: filterDTO.category });
		}
		if (filterDTO.ids?.length) {
			query.andWhere('recipeIngredients.id IN (:...ids)', { ids: filterDTO.ids });
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
