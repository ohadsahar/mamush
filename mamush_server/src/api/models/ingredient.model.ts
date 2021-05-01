import { Column, Entity, JoinTable, ManyToMany } from 'typeorm';
import { EIngredientType } from './enums';
import { Recipe } from './recipe.model';
import { MainEntity } from './main.abstract';

@Entity()
export class Ingredient extends MainEntity{

	@Column()
	ingredientName: string;

	@Column({ type: 'enum', enum: EIngredientType, default: EIngredientType.GRAM })
	type: EIngredientType;

	@Column()
	amount: number;

}
