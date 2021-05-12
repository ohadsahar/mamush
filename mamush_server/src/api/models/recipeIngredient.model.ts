import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { MainEntity } from './main.abstract';
import { Ingredient } from './ingredient.model';
import { EIngredientType } from './enums';

@Entity()
export class RecipeIngredient extends MainEntity {

	@ManyToOne(() => Ingredient, ingredient => ingredient.recipeIngredient, {
		cascade: true,
		onUpdate: 'CASCADE',
		onDelete: 'CASCADE'
	})
	@JoinColumn()
	ingredient: Ingredient | Ingredient['id'];

	@Column({ type: 'enum', enum: EIngredientType, default: EIngredientType.GRAM })
	type: EIngredientType;

	@Column()
	amount: number;

}
