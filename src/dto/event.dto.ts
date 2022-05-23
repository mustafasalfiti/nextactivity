import { IsArray, IsNotEmpty, IsNumber, IsObject, IsString } from "class-validator";
import { Types } from "mongoose";

export class CreateEventDto {

    @IsObject()
    @IsNotEmpty()
    readonly createdBy: Types.ObjectId;

    @IsString()
    @IsNotEmpty()
    readonly titel:string;

    @IsString()
    @IsNotEmpty()
    readonly event_type: string;

    @IsObject()
    @IsNotEmpty()
    readonly description: Description;

    @IsObject()
    readonly location: ILocation;


    // @Type(() => Date)
    // @IsDate()
    // readonly start_date: Date;

    // @Type(() => Date)
    // @IsDate()
    // readonly end_date: Date;

    @IsArray()
    readonly people_joined: Types.ObjectId[];

    @IsNotEmpty()
    @IsNumber()
    readonly people_required: number;
}


export class UpdateEventDto {
    @IsString()
    @IsNotEmpty()
    readonly titel:string;

    @IsString()
    @IsNotEmpty()
    readonly event_type: string;

    @IsObject()
    @IsNotEmpty()
    readonly description: Description;

    @IsObject()
    readonly location: ILocation;


    // @Type(() => Date)
    // @IsDate()
    // readonly start_date: Date;

    // @Type(() => Date)
    // @IsDate()
    // readonly end_date: Date;

    @IsArray()
    readonly people_joined: Types.ObjectId[];

    @IsNotEmpty()
    @IsNumber()
    readonly people_required: number;
}