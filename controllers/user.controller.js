const bcrypt = require("bcryptjs");
const userServices = require("../services/user.services");
const User = require("../models/user.model");


/**
 * 1. To secure the password, we are using the bcryptjs, It stores the hashed password in the database.
 * 2. In the SignIn API, we are checking whether the assigned and retrieved passwords are the same or not using the bcrypt.compare() method.
 * 3. In the SignIn API, we set the JWT token expiration time. Token will be expired within the defined duration.
 */
// Creating one
exports.register = (req, res, next) => {
  const { password } = req.body;

  const salt = bcrypt.genSaltSync(10);

  req.body.password = bcrypt.hashSync(password, salt);

  userServices.register(req.body, (error, results) => {
    if (error) {
      return next(error);
    }
    return res.status(201).send({
      message: "Success",
      data: results,
    });
  });
};
  //Login
exports.login = (req, res, next) => {
  const { username, password } = req.body;

  userServices.login({ username, password }, (error, results) => {
    if (error) {
      return next(error);
    }
    return res.status(200).send({
      message: "Success",
      data: results,
    });
  });
};
// Updating One
exports.update=(async (req, res) => {

  try{
    if((req.body.username=="" || req.body.username==null) && req.body.isdriver!=true){
    res.status(300).json(" can't update");
    }else{
    const upuser=await User.updateOne({username:req.body.lastusername},{username: req.body.username ,isdriver:req.body.isdriver})
    if(upuser.modifiedCount==1)
  res.status(200).json(req.body)
  else
  res.status(400).json("can't update")
    }
  } catch (err) {
    res.status(500).json({ message: err.message })
  }
});

