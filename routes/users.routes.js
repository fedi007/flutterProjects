const usersController = require("../controllers/user.controller");
const express = require("express");
const router = express.Router();

router.post("/register", usersController.register);
router.post("/login", usersController.login);
router.get("/user-Profile", usersController.userProfile);
router.patch('/update',usersController.update)

module.exports = router;