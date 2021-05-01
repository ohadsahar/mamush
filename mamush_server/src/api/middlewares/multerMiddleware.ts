import multer from 'multer';
import getConfig from '../../config/env.config';

export const storage = multer.diskStorage({
	destination: function (req, file, cb) {
		cb(null, getConfig().aws.upload_dir);
	},
	filename: function (req, file, cb) {
		cb(null, Date.now() + file.originalname);
	}
});
