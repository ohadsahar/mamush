import { IsNumber, IsOptional, IsString } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateIngredientDTO {

	@IsOptional()
	@IsNumber()
	@Type(() => Number)
	id: number;

	@IsString()
	ingredientName: string;
}
