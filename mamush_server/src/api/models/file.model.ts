import { Column, Entity } from 'typeorm';
import { MainEntity } from './main.abstract';

@Entity()
export class File extends MainEntity {

	@Column()
	fileName: string;

	@Column()
	filePath: string;
}
