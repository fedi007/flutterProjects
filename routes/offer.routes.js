const offerController = require("../controllers/offer.controller");
const express = require("express");
const router = express.Router();

router.post("/register", offerController.register);
router.delete("/delete",offerController.delete);
router.get("/getall",offerController.getAll);
router.post("/getbyuser",offerController.getByuser);
router.patch('/update',offerController.update);


module.exports = router;