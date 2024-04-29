const express = require('express');
const cartRouter = express.Router();
const cartController = require("../../controllers/addToCart")

cartRouter.post('/', cartController.addToCart);

module.exports = cartRouter;