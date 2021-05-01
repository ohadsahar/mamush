import { S3 } from 'aws-sdk';
import { createHash } from 'crypto';
import del from 'del';
import { readFile } from 'fs';
import moment from 'moment';
import { extname } from 'path';
import { Service } from 'typedi';
import { DeepPartial } from 'typeorm';
import { promisify } from 'util';
import { File } from '../models/file.model';
import getConfig from '../../config/env.config';

@Service()
export class FileService {

	create(params: DeepPartial<File>) {
		return File.create(params).save();
	}

	async uploadS3(filePath: string, originalName: string, extensions?: Array<any>) {
		this.checkExtension(filePath, originalName, extensions);
		const Body = await promisify(readFile)(filePath);
		return await this.uploadBuffer(Body, originalName, filePath);
	}

	uploadBuffer(Body, name: string, filePath?: string) {
		return new Promise<S3.ManagedUpload.SendData>((resolve, reject) => {
			new S3().upload(
				{
					Body,
					Bucket: getConfig().aws.aws_s3_bucket,
					Key: `${moment().format('YYYY-MM-DD')}/${createHash('sha1').update(Date.now().toString()).digest('hex')}/${createHash('md5').update(name).digest('hex')}/${name}`,
					ACL: 'public-read'
				},
				async (error, data) => {
					if (error) reject(error);
					if (filePath) await this.cleanFile(filePath);
					resolve(data);
				}
			);
		});
	}

	checkExtension(filePath: string, originalName: string, extensions: Array<string>) {
		if (!extensions) return;
		if (!filePath) throw new Error(
			'general.error.no_file',
		);
		if (!extensions.includes(extname(originalName).toLocaleLowerCase())) throw new Error(
			'general.error.file_ext',
		);

	}

	cleanFile(filePath: string) {
		return del([filePath]);
	}

	uploadImage(filename, originalname) {
		return this.uploadS3(getConfig().aws.upload_dir + filename, originalname, ['.jpg', '.jpeg', '.png']);
	}

	async removeS3(fileName: string) {
		return new Promise((resolve, reject) => {
			new S3().deleteObjects(
				{
					Bucket: getConfig().aws.aws_s3_bucket,
					Delete: { Objects: [{ Key: fileName }] }
				},
				(error, data) => {
					if (error) reject(error);
					resolve(data);
				}
			);
		});
	}

	saveImage(file: File) {
		return File.save(file);
	}

	async deleteFile(fileId: number): Promise<any> {
		return File.delete(fileId);
	}

}
