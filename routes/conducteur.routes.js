const conducteurController = require("../controllers/conducteur.controller");

const express = require("express");
const router = express.Router();

router.post("/register", conducteurController.register);
router.post("/login", conducteurController.login);
router.patch('/update',conducteurController.update);
router.patch('/update/addtruck',conducteurController.addtruck);
router.patch('/update/deletetruck',conducteurController.deletetruck);

module.exports = router;