const express = require('express');
const controller = require('../controllers/atraccion');
const router = express.Router();

const path = 'atraccion';
router.get(`/${path}`, controller.getData);
module.exports = router;