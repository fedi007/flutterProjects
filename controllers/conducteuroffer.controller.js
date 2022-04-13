const conducteurofferServices = require("../services/conducteuroffer.services");
const Offer=require("../models/offer.model");
const Conducteuroffer=require('../models/conducteuroffer.model');

// Creating one 
exports.register = (req, res, next) => {
   conducteurofferServices.register(req.body, (error, results) => {
      if (error) {
        return next(error);
      }
      return res.status(200).send({

        data: results,
      });
    });
  };

  // Getting all
  exports.getAll=( async (req, res) => {
    try {
      const offer = await Offer.find().populate('user')
      res.json(offer)
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })
  //Getting accepted offers by conducteur
  exports.getacceptedoffersbyconducteur=(async (req, res) => {
    try {
      const conducteuroffer = await Conducteuroffer.find({conducteur:req.body.conducteur,completeoffer:req.body.completeoffer}).populate('conducteur').populate('offer').populate('truck')
      res.json(conducteuroffer)
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })