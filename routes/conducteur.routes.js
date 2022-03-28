const conducteurController = require("../controllers/conducteur.controller");

const express = require("express");
const router = express.Router();

router.post("/register", conducteurController.register);

module.exports = router;