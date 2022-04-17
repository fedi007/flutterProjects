const Conducteur = require("../models/conducteur.model");
const truckServices = require("../services/truck.services");
const Truck = require("../models/truck.model");
const Conducteuroffer = require("../models/conducteuroffer.model")


// Creating one
exports.register = (req, res, next) => {

  truckServices.register(req.body, (error, results) => {
    if (error) {
      return next(error);
    }
    return res.status(201).send({
      data: results,
    });
  });
};
// add new truck
exports.addtruck = (async (req, res) => {
  try {
    const upconducteur = await Conducteur.updateOne({
      _id: req.body.conducteur
    }, {
      $addToSet: {
        truck: req.body.truck
      }
    })
    if (upconducteur.modifiedCount == 1)
      res.status(200).json("truck updated");
    else
      res.status(400).json("can't update")
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
});

// delete truck 
exports.deletetruck = (async (req, res) => {
  try {
    const conducteuroffer = await Conducteuroffer.exists({
      truck: req.body.truck
    })
    if (!conducteuroffer) {
      const upconducteur = await Conducteur.updateOne({
        _id: req.body.conducteur
      }, {
        $pull: {
          truck: req.body.truck
        }
      })
      if (upconducteur.modifiedCount == 1) {
        const truck = await Truck.findById(req.body.truck)
        await truck.remove();
        res.status(200).json("truck deleted");
      } else
        res.status(500).json({
          message: err.message
        })
    } else
      res.status(400).json({
        "err": "1",
        "description":"this truck has an offer"
      })
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
});

// get trucks by conducteur
exports.gettrucksbyconducteur = (async (req, res) => {
  try {
    const conducteur = await Conducteur.findById(req.body.conducteur).populate('truck')
    res.status(200).json(conducteur["truck"])
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
})