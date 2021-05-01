import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { MainEntity } from './main.abstract';
import { Category } from './category.model';
import { User } from './user.model';

@Entity()
export class Tag extends MainEntity {

	@Column()
	name: string;

	@ManyToOne(() => Category, { cascade: true, eager: true })
	category: Category | Category['id'];

	@ManyToOne(() => Tag, { cascade: true, onUpdate: 'CASCADE', onDelete: 'CASCADE' })
	@JoinColumn()
	user: User | User['id'];

}
