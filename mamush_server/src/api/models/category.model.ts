import { Column, Entity, JoinColumn, OneToMany, OneToOne } from 'typeorm';
import { MainEntity } from './main.abstract';
import { File } from './file.model';
import { Tag } from './tag.model';

@Entity()
export class Category extends MainEntity {

	@Column()
	name: string;

	@OneToOne(() => File, { nullable: true, onDelete: 'SET NULL' })
	@JoinColumn()
	categoryPicture: File;

	@OneToMany(() => Tag, tag => tag.category,)
	@JoinColumn()
	tags: Tag[];

}
