import { Service } from 'typedi';
import { FilterDTO } from '../dto/util/filterDTO';
import { Ingredient } from '../models/ingredient.model';
import { CreateIngredientDTO } from '../dto/ingredient/createIngredientDTO';

@Service()
export class IngredientsService {

	get(filterDTO: FilterDTO): Promise<Ingredient[]> {
		return Ingredient.createQueryBuilder('ingredient')
			.andWhere('ingredient.ingredientName like :searchText', { searchText: '%' + filterDTO.name + '%' })
			.getMany();
	}

	create(createIngredientsDTO: CreateIngredientDTO): Promise<Ingredient> {
		return Ingredient.create(createIngredientsDTO).save();
	}

}
