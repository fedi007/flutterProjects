const bcrypt = require("bcryptjs");
const userServices = require("../services/user.services");
const User = require("../models/user.model");



// Creating one 
exports.register = (async (req, res) => {
  var registermethod = await this.registermethod(req);
  if (registermethod["errtype"] == "1")
    res.status(400).json({
      "message": registermethod["message"]
    })
  else if (registermethod["errtype"] == "2")
    res.status(500).json({
      "message": registermethod["message"]
    })
  else
  res.status(200).json({"message": "Success","data":registermethod});
});


exports.registermethod = (async (req) => {
  var result = {};
  try {
    const {
      password
    } = req.body;

    const salt = bcrypt.genSaltSync(10);

    req.body.password = bcrypt.hashSync(password, salt);

    const user = new User(req.body);
    await user.save().then((response) => {
        result = response
      })
      .catch((err) => {
        result = {
          "errtype": "1",
          "message": err["message"]
        }
      });
    return result
  } catch (err) {
    return {
      "errtype": "2",
      "message": err.message
    }
  }
})


//Login
exports.login = (req, res, next) => {
  const {
    email,
    password
  } = req.body;

  userServices.login({
    email,
    password
  }, (error, results) => {
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
exports.update = (async (req, res) => {

  try {
    if ((req.body.username == "" || req.body.username == null) && req.body.isdriver != true) {
      res.status(300).json(" username can't be empty");
    } else {
      const upuser = await User.findByIdAndUpdate(req.body.user, {
        username: req.body.username,
        isdriver: req.body.isdriver
      })
      res.status(200).json(upuser)
    }
  } catch (err) {
    res.status(400).json({
      message: err.message
    })
  }
});


// delete offer not register
exports.deleteuserrnotregister = (async (req) => {
  try {
    const user = await User.findByIdAndDelete(req.body.user)
    console.log(user)
    if (user != null)
      return user;
    else
      return null

  } catch (err) {
    return null;
  }
});