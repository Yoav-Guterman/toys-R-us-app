import {
    AllowNull,
    BelongsTo,
    BelongsToMany,
    Column,
    DataType,
    Default,
    ForeignKey,
    HasMany,
    Index,
    Model,
    PrimaryKey,
    Table
} from "sequelize-typescript";
import Audience from "./audience";

@Table({
    underscored: true
})
export default class Game extends Model {

    @PrimaryKey
    @Default(DataType.UUIDV4)
    @Column(DataType.UUID)
    id: string

    @ForeignKey(() => Audience)
    @AllowNull(false)
    @Column(DataType.UUID)
    AudienceId: string

    @AllowNull(false)
    @Column(DataType.STRING(40))
    name: string

    @AllowNull(false)
    @Column(DataType.STRING(40))
    description: string

    @AllowNull(false)
    @Column(DataType.DECIMAL(10, 2))
    price: number

    @BelongsTo(() => Audience)
    audiences: Audience
}