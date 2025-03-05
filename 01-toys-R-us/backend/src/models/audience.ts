import {
    AllowNull,
    BelongsToMany,
    Column,
    DataType,
    Default,
    HasMany,
    Index,
    Model,
    PrimaryKey,
    Table
} from "sequelize-typescript";
import Game from "./game";

@Table({
    underscored: true
})
export default class Audience extends Model {

    @PrimaryKey
    @Default(DataType.UUIDV4)
    @Column(DataType.UUID)
    id: string

    @AllowNull(false)
    @Column(DataType.STRING(40))
    name: string

    @HasMany(() => Game)
    games: Game[]
}