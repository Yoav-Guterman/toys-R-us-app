import Joi from "joi";

export const newGameValidator = Joi.object({
    AudienceId: Joi.string().uuid().required(),
    price: Joi.number().min(0).required(),
    name: Joi.string().trim().max(40).required(),
    description: Joi.string().max(255).trim().required()
})

export const getPerAudienceValidator = Joi.object({
    AudienceId: Joi.string().uuid().required()
})

export const deleteGameValidator = Joi.object({
    id: Joi.string().uuid().required()
})
