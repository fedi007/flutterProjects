const deliveryTypeServices = require("../services/deliveryType.services");
const DeliveryType = require("../models/deliveryType.model");


// Creating one
exports.register = (req, res, next) => {
   
    deliveryTypeServices.register(req.body, (error, results) => {
      if (error) {
        return next(error);
      }
      return res.status(201).send({
        data: results,
      });
    });
  };
  // Getting all
  exports.getAll=( async (req, res) => {
    try {
        const idList=[];
      const deliveryType = await DeliveryType.find();
      deliveryType.forEach(e => idList.push(e.deliveryType));
      res.status(200).json(idList)
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })