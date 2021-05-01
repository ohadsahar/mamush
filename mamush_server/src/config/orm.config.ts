import { User } from '../api/models/user.model';
import getConfig from './env.config';
import { File } from '../api/models/file.model';
import { Category } from '../api/models/category.model';
import { Recipe } from '../api/models/recipe.model';
import { Ingredient } from '../api/models/ingredient.model';
import { Instructions } from '../api/models/instructions.model';
import { Tag } from '../api/models/tag.model';

const config = getConfig();

const ormConfig = {
	type: 'postgres',
	host: config.dbHost,
	port: config.dbPort,
	username: config.dbUser,
	password: config.dbPass,
	database: config.dbName,
	entities: [
		User,
		File,
		Category,
		Recipe,
		Ingredient,
		Instructions,
		Tag
	],
	ssl: config.ssl,
	synchronize: config.synchronize || false,
	logging: config.logging || false,
	dropSchema: config.dropSchema || false,
};

export = ormConfig;

