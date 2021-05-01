import {Service} from 'typedi'
import {DeepPartial} from 'typeorm'
import {BadRequestError} from '../errors'
import * as libPhoneNumber from 'google-libphonenumber';

@Service()
export class UtilsService{
    constructor(){
    }


    /**
     * Return new object from given one with only picked fields
     * @param obj
     * @param fields
     */
    pickFieldsFromArray<T>(obj: any, fields: string[]): Promise<Partial<T>>{
        return new Promise((resolve, reject) => {
            if(typeof (obj) !== 'object'){
                return reject(new Error('bad type'));
            }

            return resolve(
                fields.reduce((total: any, current: any) => {
                    if(current in obj) total[current] = obj[current];
                    return total;
                }, {})
            );

        });
    }

    filterArray<T>(obj: any, arrayFields: string[]): Array<T>{
        return obj.map(val => {
            return Object.keys(val)
                .filter(key => arrayFields.includes(key))
                .filter(key => val[key] !== '')
                .reduce((obj, key) => {
                    obj[key] = val[key];
                    return obj;
                }, {});
        });
    }

    trimStringsFromObj(obj){
        return Object.keys(obj).map(k => obj[k] = typeof obj[k] === 'string' ? obj[k].trim() : obj[k]);
    }

    strToBool(str){
        if(typeof str === 'boolean')
            return str;
        else return (str == 'true');
    }

    validatePhoneNumber(phoneNumber){
        try{
            let str = phoneNumber;
            if(str[0] != "+")
                str = `+${str}`;
            const phoneUtil = libPhoneNumber.PhoneNumberUtil.getInstance();
            const phoneUtilFormat = libPhoneNumber.PhoneNumberFormat;
            const parseNumber = phoneUtil.parseAndKeepRawInput(str);
            const internationalNumber = phoneUtil.format(parseNumber, phoneUtilFormat.E164);
            return internationalNumber;
        } catch(e){
            return null;
        }
    }

    /**
     * Check missing fields in object
     * @param obj
     * @param fields
     */
    checkMissingFields(obj: any, fields: string[]): Promise<string[]>{
        return new Promise((resolve, reject) => {
            let missingFields: string[] = fields.filter(field => !(field in obj));
            return resolve(missingFields);
        });
    }

    /**
     * @description Handle missing fields in object scenario
     * @template T The type for obj
     * @param {DeepPartial<T>} obj the object to check
     * @param {(Array<keyof T & string>)} required fields in obj
     * @param {string} controllerNamespace
     * @param {string} endPoint
     * @memberof UtilsService
     * @author Natan Farkash
     */
    async handleMissingFields<T>(obj: DeepPartial<T>, required: Array<keyof T & string>, controllerNamespace: string, endPoint: string){
        const missingFields = await this.checkMissingFields(obj, required);
        if(missingFields.length) throw new BadRequestError(`${controllerNamespace}.error.${endPoint}`, missingFields.join(', ') + ' are mandatory', new Error("missing params"));

    }

    parseQueryString(query: { [key: string]: string }){
        const result: { [key: string]: any } = {};
        for(const [key, value] of Object.entries(query)){
            switch(value){
                case false.toString():{
                    result[key] = false;
                    break;
                }
                case true.toString():{
                    result[key] = true;
                    break;
                }
                default:{
                    result[key] = value && isFinite(value as any) ? +value : value;
                }
            }
        }
        return result;
    }

}

export const getFixedValue = (num: number, precision = 0.2) => {
    return +num.toFixed(precision);
}

/**
 * return if it is legal israeli phone number
 *
 * @param phone - phone number to check
 * @returns {boolean}
 */
export const isValidPhone = (phone: string) => {
    return /^\+?(972|0)?(\-)?([5]{1}\d{8})$/.test(phone);
}

/**
 * format phone numbers
 *
 * gets a phone number according to the /^\+?(972|0)?(\-)?([5]{1}\d{8})$/ regex
 * return number started with 972
 * @param phone
 * @returns {*}
 */
export const parsePhone = (phone) => {
    let parsedPhone = phone;
    if(parsedPhone.startsWith('+'))
        parsedPhone = parsedPhone.substring(1);
    if(!parsedPhone.startsWith('972')){
        if(parsedPhone.startsWith('0')){
            parsedPhone = '972' + parsedPhone.substring(1);
        }
        else{
            parsedPhone = '972' + parsedPhone;
        }
    }
    return parsedPhone;
}


export const emailTemplateMap = {
    NEW_MESSAGE: 'd-85dedd60dc1f461da4eb9ec72127ebce',
};

