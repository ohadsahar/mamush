import { Service } from 'typedi';
import { IdDTO } from '../dto/util/idDTO';
import { Tag } from '../models/tag.model';

@Service()
export class TagsService {

	async get(idDTO: IdDTO, userID: number): Promise<Tag[]> {
		let query = await Tag.createQueryBuilder('tags')
			.where('tags.user = :userID', { userID: userID })
			.andWhere('tags.category.id = :id', { id: idDTO.id })
			.getMany();
		return query;
	}

}
