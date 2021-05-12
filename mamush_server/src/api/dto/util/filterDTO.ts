import { IsArray, IsNumber, IsOptional, IsString } from 'class-validator';
import { IdDTO } from './idDTO';
import { Type } from 'class-transformer';

export class FilterDTO {

	@IsString()
	@IsOptional()
	name: string;

	@IsArray()
	@IsOptional()
	ids: IdDTO[];

	@IsArray()
	@IsOptional()
	tags: IdDTO[];

	@IsOptional()
	@IsNumber()
	@Type(() => Number)
	category: number;
}
