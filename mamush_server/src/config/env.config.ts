import minimist, { ParsedArgs } from 'minimist';
import * as path from 'path';

const argv: ParsedArgs = minimist(process.argv.slice(2));

const constants = {
	jwt: {
		forgot_password_token_expires: '1h',
		token_expires: '365 days',
		key: 'l23@#shfa1340**@dfg009Alk3#Vk_anlj',
		ignoreExpiration: false
	},
	aws: {
		aws_s3_bucket: 'uchakra-prod',
		aws_s3_key_id: 'AKIASE2GFSL5SCT7XFXC',
		aws_s3_access_key: 'pf1wHhq3E9JGQadhMNKCUK5+LcyH+0TdesQTjkPC',
		upload_dir: 'uploads/'
	},
	uploadDir: path.join(__dirname, '../')
};

export interface IConfig {
	name: string;
	production: boolean;
	logLevel: string;
	serverUrl: string;
	port: number;
	dbHost: string;
	dbPort: number;
	dbUser: string;
	dbPass: string;
	dbName: string;
	uploadDir: string;
	bucketName: string;
	appName: string;
	ssl: boolean;
	awsAuth: {
		accessKeyId: string;
		secretAccessKey: string;
	};
	synchronize: boolean;
	logging: boolean;
	dropSchema: boolean;
	jwt: {
		token_expires: string,
		key: string,
		ignoreExpiration: boolean,
		forgot_password_token_expires?: string;
	},
	aws: {
		aws_s3_bucket: string;
		aws_s3_key_id: string;
		aws_s3_access_key: string;
		upload_dir: string;
	}

}

let config: any;
const init = () => {
	let envPath = path.join(path.dirname(__dirname), 'env');
	switch (argv.env) {
		case 'prod':
		case 'production':
			config = require(path.join(envPath, 'dev.json'));
			break;
		case 'dev':
		case 'develop':
			config = require(path.join(envPath, 'dev.json'));
			break;
		default:
			config = require(path.join(envPath, 'dev.json'));
			break;
	}
	return Object.assign(config, constants);
};

const getConfig = (): IConfig => {
	return config || init(); //  "exec": "set TS_NODE_TRANSPILE_ONLY=true&ts-node -r tsconfig-paths/register src/app.ts",
};

export default getConfig;
