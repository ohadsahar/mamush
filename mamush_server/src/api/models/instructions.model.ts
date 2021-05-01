import { Column, Entity, ManyToOne } from 'typeorm';
import { MainEntity } from './main.abstract';
import { Recipe } from './recipe.model';

@Entity()
export class Instructions extends MainEntity {

	@Column()
	instructionsDescription: string;

	@Column({ nullable: true })
	hasTimer: boolean;

	@Column({ nullable: true })
	timer: number;

	@ManyToOne(() => Recipe,)
	recipe: Recipe | Recipe['id'];

}
