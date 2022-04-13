const truckController = require("../controllers/truck.controller");
const express = require("express");
const router = express.Router();

router.post("/register", truckController.register);


module.exports = router;