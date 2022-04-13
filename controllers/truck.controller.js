const truckServices = require("../services/truck.services");
//const Truck = require("../models/truck.model");


// Creating one
exports.register = (req, res, next) => {
   
    truckServices.register(req.body, (error, results) => {
      if (error) {
        return next(error);
      }
      return res.status(200).send({
        data: results,
      });
    });
  };