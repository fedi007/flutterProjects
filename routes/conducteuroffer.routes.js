
const conducteurofferController = require("../controllers/conducteuroffer.controller");
const express = require("express");
const router = express.Router();


router.get("/getall",conducteurofferController.getAll);
router.post("/register", conducteurofferController.register);
router.post("/getacceptedoffersbyconducteur", conducteurofferController.getacceptedoffersbyconducteur);

module.exports = router;