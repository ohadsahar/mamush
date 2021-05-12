import { IsArray, IsBoolean, IsNumber, IsOptional, IsString } from 'class-validator';
import { Type } from 'class-transformer';
import { EIngredientType } from '../../models/enums';

export class CreateRecipeDTO {

	@IsString()
	recipeName: string;

	@IsArray()
	recipeIngredients: CreateRecipeIngredientsDTO[];

	@IsArray()
	instructions: CreateInstructionsDTO[];

	@IsArray()
	tags: CreateTagDTO[];

	@IsOptional()
	recipePicture: any;

	@IsNumber()
	@Type(() => Number)
	category: number;

	user: number;

}

export class CreateRecipeIngredientsDTO {

	@IsNumber()
	@Type(() => Number)
	id: number;

	@IsNumber()
	@Type(() => Number)
	ingredient: number;

	@IsString()
	type: EIngredientType;

	@IsNumber()
	@Type(() => Number)
	amount: number;

}

export class CreateInstructionsDTO {

	@IsNumber()
	@IsString()
	instructionsDescription: string;

	@IsBoolean()
	@IsOptional()
	hasTimer: boolean;

	@IsNumber()
	@Type(() => Number)
	@IsOptional()
	timer: number;
}

export class CreateTagDTO {

	@IsNumber()
	@Type(() => Number)
	id: number;

	@IsString()
	name: string;

	@IsNumber()
	@Type(() => Number)
	category: number;

	user: number;

}
