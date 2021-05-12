import { Column, Entity, JoinColumn, JoinTable, ManyToMany, ManyToOne, OneToMany, OneToOne } from 'typeorm';
import { MainEntity } from './main.abstract';
import { Category } from './category.model';
import { User } from './user.model';
import { File } from './file.model';
import { Instructions } from './instructions.model';
import { Tag } from './tag.model';
import { RecipeIngredient } from './recipeIngredient.model';

@Entity()
export class Recipe extends MainEntity {

	@Column({ nullable: true })
	recipeName: string;

	@ManyToMany(() => RecipeIngredient,
		{ cascade: true, eager: true })
	@JoinTable()
	recipeIngredients: RecipeIngredient[];

	@ManyToMany(() => Tag,
		{ cascade: true, eager: true })
	@JoinTable()
	tags: Tag[];

	@OneToMany(() => Instructions, instructions => instructions.recipe,
		{ cascade: true, eager: true })
	@JoinColumn()
	instructions: Instructions[];

	@ManyToOne(() => Category,
		{ cascade: true, onUpdate: 'CASCADE', onDelete: 'CASCADE' })
	@JoinColumn()
	category: Category | Category['id'];

	@ManyToOne(() => Recipe,
		{ cascade: true, onUpdate: 'CASCADE', onDelete: 'CASCADE' })
	@JoinColumn()
	user: User | User['id'];

	@OneToOne(() => File,
		{ nullable: true, onDelete: 'SET NULL' })
	@JoinColumn()
	recipePicture: File;
}
