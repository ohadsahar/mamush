import {IsString} from "class-validator";

export class RegisterDTO {

    @IsString()
    phoneNumber:string;
}
