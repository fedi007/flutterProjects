const offerController = require("../controllers/useroffer.controller");
const express = require("express");
const router = express.Router();

router.post("/register", offerController.register);
router.delete("/delete",offerController.delete);
router.post("/getbyuser",offerController.getByuser);
router.patch('/update',offerController.update);

module.exports = router;