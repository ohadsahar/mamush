import { Column, Entity, OneToMany } from 'typeorm';
import { MainEntity } from './main.abstract';
import { RecipeIngredient } from './recipeIngredient.model';

@Entity()
export class Ingredient extends MainEntity {

	@Column()
	ingredientName: string;

	@OneToMany(() => RecipeIngredient, recipeIngredient => recipeIngredient.ingredient)
	recipeIngredient: RecipeIngredient[];

}
