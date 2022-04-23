const bcrypt = require("bcryptjs");
const userServices = require("../services/user.services");
const User = require("../models/user.model");


// Creating one
exports.register = (req, res, next) => {
  const { password } = req.body;

  const salt = bcrypt.genSaltSync(10);

  req.body.password = bcrypt.hashSync(password, salt);

  userServices.register(req.body, (error, results) => {
    if (error) {
      return next(error);
    }
    return res.status(200).send({
      message: "Success",
      data: results,
    });
  });
};
  //Login
exports.login = (req, res, next) => {
  const { email, password } = req.body;

  userServices.login({ email, password }, (error, results) => {
    if (error) {
      return next(error);
    }
    if (results["status"] == "active") {
      return res.status(200).send({
        message: "Success",
        data: results,
      });
    } else if (results["status"] == "deleted")
      return res.status(403).json("your compte was deleted")
    else
      return res.status(500).json("server error")
  });
};
// Updating One
exports.update=(async (req, res) => {

  try{
    if(req.body.username=="" || req.body.username==null){
    res.status(300).json(" username can't be empty");
    }else{
    const upuser=await User.updateOne({username:req.body.lastusername},{username: req.body.username ,isdriver:req.body.isdriver})
    if(upuser.modifiedCount==1)
  res.status(200).json(req.body)
  else
  res.status(300).json("can't update")
    }
  } catch (err) {
    res.status(400).json({ message: err.message })
  }
});


// delete offer not register
exports.deleteuserrnotregister = (async (req) => {
  try {
    const user = await User.findByIdAndDelete(req)
    if (user != null)
      return user;
    else
      return null

  } catch (err) {
    return null;
  }
});