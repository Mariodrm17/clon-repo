//traer el controlador
const moongose = require('mongoose');
const atraccionSchema = new moongose.Schema(
    {
        id: {
            type: Number,
            required: true,
            unique: true
        },
        nombre: {
            type: String
        },
        tipo: {
            type: String
        },
        altura_minima: {
            type: Number
        },
        descripcion: {
            type: String
        },
        fecha_apertura: {
            type: Date
        },
        tiempo_espera_promedio: {
            type: Number
        },
        ubicacion: {
            type: String
        },
        capacidad: {
            type: Number
        },
        estado: {
            type: String
        }

    }
)
module.exports = moongose.model('atraccion', atraccionSchema);
