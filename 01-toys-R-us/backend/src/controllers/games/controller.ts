import { NextFunction, Request, Response } from "express";

import { StatusCodes } from "http-status-codes";
import Game from "../../models/game";
import Audience from "../../models/audience";
import { literal } from "sequelize";

export async function getGamesPerAudience(req: Request<{ AudienceId: string }>, res: Response, next: NextFunction) {
    try {
        const { AudienceId } = req.params

        const games = await Game.findAll({
            where: { AudienceId },
            include: [Audience]
        })

        res.status(StatusCodes.OK).json(games);
    } catch (e) {
        next(e);
    }
}

export async function getCheaperPriceGames(req: Request<{}, {}, { price: number }>, res: Response, next: NextFunction) {
    try {
        const maximumGamePrice = req.body.price

        const gamesLowerThanPrice = await Game.findAll({
            where: literal(`price <= ${maximumGamePrice}`),
            include: [Audience]
        })

        res.json(gamesLowerThanPrice)
    } catch (e) {
        next(e)
    }
}

export async function createGame(req: Request<{}, {}, {
    name: string,
    AudienceId: string,
    description: string,
    price: number
}>, res: Response, next: NextFunction) {
    try {
        const newGame = await Game.create(req.body)
        res.json(newGame)
    } catch (e) {
        next(e)
    }
}

export async function deleteGame(req: Request<{ id: string }>, res: Response, next: NextFunction) {
    try {
        const id = req.params.id

        await Game.destroy({ where: { id } })
        res.json({ success: true })
    } catch (e) {
        next(e)
    }
}