import { NextFunction, Request, Response } from "express";
import { StatusCodes } from "http-status-codes";
import Audience from "../../models/audience";

export async function getAudiences(req: Request, res: Response, next: NextFunction) {
    try {
        const types = await Audience.findAll();
        res.status(StatusCodes.OK).json(types);
    } catch (e) {
        next(e);
    }
}