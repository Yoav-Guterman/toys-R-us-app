import { Router } from "express";
import { getAudiences } from "../controllers/audiences/controller";

const audienceRouter = Router()

audienceRouter.get('/', getAudiences) // get all

export default audienceRouter