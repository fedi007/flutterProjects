const offerController = require("../controllers/offer.controller");
const express = require("express");
const router = express.Router();

router.post("/register", offerController.register);


module.exports = router;