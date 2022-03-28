const usersController = require("../controllers/user.controller");

const express = require("express");
const router = express.Router();
const User = require("../models/user.model");

router.post("/register", usersController.register);
router.post("/login", usersController.login);
router.get("/user-Profile", usersController.userProfile);

router.patch('/update',  getuser, async (req, res) => {
    if (req.body.username =="") {
      req.body.username=res.user.username
    }
  
    try {
      
      const user = new User({
        "_id":res.user._id,
        "username":req.body.username,
        "email":res.user.email,
        "password":res.user.password
      }
      );
      await res.user.remove()
      const updateduser = await user.save()
      return res.json(updateduser)
    }
     catch (err) {
      return res.status(400).json({ message: err.message })
    }
  })
  async function getuser(req, res, next) {
    let user
    const lastusername=req.body.lastusername;
    try {
      
      user = await User.findOne({ username:lastusername })
      if (user == null) {
        return res.status(404).json({ message: 'Cannot find user' })
      }
    } catch (err) {
      return res.status(500).json({ message: err.message })
    }
    res.user = user
  
    next()
  }



module.exports = router;