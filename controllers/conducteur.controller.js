const bcrypt = require("bcryptjs");
const conducteurServices = require("../services/conducteur.services");
const Conducteur = require("../models/conducteur.model");
const Truck =require("../models/truck.model");

//Login
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

// Creating one
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
// Updating One
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
// add new truck
exports.addtruck=(async (req, res) => {
  try{
    const upconducteur=await Conducteur.updateOne({_id:req.body.id},
      {
        $addToSet:{
          truck: req.body.truck
        }
      })
    if (upconducteur.modifiedCount==1)
    res.status(200).json("truck updated");
    else 
    res.status(300).json("can't update")
  } catch (err) {
    res.status(400).json({ message: err.message })
  }
});
// delete truck 
exports.deletetruck=(async (req, res) => {
  try{
    const upconducteur=await Conducteur.updateOne({_id:req.body.id},
      {
        $pull:{
          truck: req.body.truck
        }
      })
    if (upconducteur.modifiedCount==1)
    {
    const truck  = await Truck.findById(req.body.truck)
    await truck.remove();
    res.status(200).json("truck deleted");
    }
    else 
    res.status(300).json("can't delete")
  } catch (err) {
    res.status(400).json({ message: err.message })
  }
});

