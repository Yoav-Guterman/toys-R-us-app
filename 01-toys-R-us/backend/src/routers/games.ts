import { Router } from "express";
import validation from "../middlewares/validation";
import paramsValidation from "../middlewares/params-validation";
import { createGame, deleteGame, getGamesPerAudience } from "../controllers/games/controller";
import { deleteGameValidator, getPerAudienceValidator, newGameValidator } from "../controllers/games/validator";

const gamesRouter = Router()

gamesRouter.get('/:AudienceId', paramsValidation(getPerAudienceValidator), getGamesPerAudience)
gamesRouter.post('/', validation(newGameValidator), createGame)
gamesRouter.delete('/:id', paramsValidation(deleteGameValidator), deleteGame)

export default gamesRouter