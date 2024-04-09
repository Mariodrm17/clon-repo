const model = require('../models/atraccion');

exports.getData = async (req, res) => {
    try {
        const atracciones = await model.find();
        // res.send(atracciones);
        res.render('atraccion', { atracciones });
    } catch (error) {
        res.status(500).send('Hubo un error');
    }
}