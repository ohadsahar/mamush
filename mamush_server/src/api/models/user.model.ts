import { Column, Entity, JoinColumn, OneToMany, OneToOne } from 'typeorm';
import { MainEntity } from './main.abstract';
import { File } from './file.model';
import { Recipe } from './recipe.model';

@Entity()
export class User extends MainEntity {

	@Column()
	phoneNumber: string;

	@Column({ nullable: true })
	fullName: string;

	@OneToOne(() => File, { nullable: true, onDelete: 'SET NULL' })
	@JoinColumn()
	profilePicture: File;



}
