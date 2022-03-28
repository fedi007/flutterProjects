const bcrypt = require("bcryptjs");
const conducteurServices = require("../services/conducteur.services");
const Conducteur = require("../models/conducteur.model");




exports.login = (req, res, next) => {
  const { username, password } = req.body;

  conducteurServices.login({ username, password }, (error, results) => {
    if (error) {
      return next(error);
    }
    return res.status(200).send({
      message: "Success",
      data: results,
    });
  });
};


exports.register = (req, res, next) => {
  const { password } = req.body;

  const salt = bcrypt.genSaltSync(10);

  req.body.password = bcrypt.hashSync(password, salt);

  conducteurServices.register(req.body, (error, results) => {
    if (error) {
      return next(error);
    }
    return res.status(200).send({
      message: "Success",
      data: results,
    });
  });
};

exports.update=(async (req, res) => {
  try{
    const upconducteur=await Conducteur.updateOne({username:req.body.lastusername},{username: req.body.username})
    if (upconducteur.modifiedCount==1)
    res.json(req.body.username)
    else 
    res.status(300).json("can't update")
  } catch (err) {
    res.status(400).json({ message: err.message })
  }
});
