const bcrypt = require("bcryptjs");
const conducteurServices = require("../services/conducteur.services");
const Conducteur = require("../models/conducteur.model");
const truckController = require('../controllers/truck.controller')

//Login
exports.login = (req, res, next) => {
  const {
    email,
    password
  } = req.body;

  conducteurServices.login({
    email,
    password
  }, (error, results) => {
    if (error) {
      return next(error);
    }
    if (results["status"] == "accepted") {
      return res.status(200).send({
        message: "Success",
        data: results,
      });
    } else if (results["status"] == "waiting")
      return res.status(403).json("wait admin for answer")

    else if (results["status"] == "deleted")
      return res.status(403).json("your compte was deleted")
    else
      return res.status(500).json("server error")
  });
};

// Creating one
exports.register = (req, res, next) => {

  const register = truckController.register({
    "truckModel": req.body.truckModel,
    "truckLicense": req.body.truckLicense,
  })
  if (register != null) {
    const {
      password
    } = req.body;

    const salt = bcrypt.genSaltSync(10);

    req.body.password = bcrypt.hashSync(password, salt);
    const params = {
      "username": req.body.username,
      "email": req.body.email,
      "password": req.body.password,
      "truck": register["id"]
    }
    conducteurServices.register(params, (error, results) => {
      if (error) {
        const deletetruck= truckController.deletetrucknotregister(register["id"]);
        if (deletetruck!=null)
        return next(error);
        else
        return res.status(500).json("error wrong truck in database need fix")
      }
      return res.status(200).send({
        message: "Success",
        data: results,
      });
    });
  } else
  {
    return res.status(500).json({
      message: "error"
    })
  }
};
// Updating One
exports.update = (async (req, res) => {
  try {
    const upconducteur = await Conducteur.updateOne({
      username: req.body.lastusername
    }, {
      username: req.body.username
    })
    if (upconducteur.modifiedCount == 1)
      res.json(req.body.username)
    else
      res.status(300).json("can't update")
  } catch (err) {
    res.status(400).json({
      message: err.message
    })
  }
});