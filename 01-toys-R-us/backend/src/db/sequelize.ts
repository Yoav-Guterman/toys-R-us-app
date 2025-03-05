import { Sequelize } from "sequelize-typescript";
import config from 'config'
import Game from "../models/game";
import Audience from "../models/audience";


const logging = config.get<boolean>('sequelize.logging') ? console.log : false

const sequelize = new Sequelize({
    models: [Game, Audience],
    dialect: 'mysql',
    ...config.get('db'),
    logging,
})

export default sequelize