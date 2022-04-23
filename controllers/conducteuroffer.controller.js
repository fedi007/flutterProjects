const conducteurofferServices = require("../services/conducteuroffer.services");
const Offer = require("../models/offer.model");
const Conducteuroffer = require('../models/conducteuroffer.model');

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
exports.getAll = (async (req, res) => {
  try {
    const offer = await Offer.find({
      user: {
        $nin: [req.body.user]
      },
      status: "active"
    }).populate('user')
    var listoffer = [];
    var conducteuroffer;
    for (var i = 0; i < offer.length; i++) {
      conducteuroffer = await Conducteuroffer.find({
        offer: offer[i]["id"]
      });
      if (conducteuroffer.length === 0)
        listoffer.push(offer[i])
      else {
        for (var j = 0; j < conducteuroffer.length; j++)
          if (conducteuroffer[j]["conducteur"] != req.body.conducteur)
            listoffer.push(offer[i])
      }
    }
    res.status(200).json(listoffer)
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
})
//Getting accepted offers by conducteur
exports.getacceptedoffersbyconducteur = (async (req, res) => {
  try {
    const conducteuroffer = await Conducteuroffer.find({
      conducteur: req.body.conducteur,
      completeoffer: req.body.completeoffer,
      status: "active"
    }).populate('conducteur').populate('offer').populate('truck')
    res.json(conducteuroffer)
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
})
//Delete conducteur offer
exports.delete = (async (req, res) => {
  try {
    await Conducteuroffer.findByIdAndUpdate(req.body.conducteuroffer, {
      status: "deleted"
    })
    res.status(200).json({
      "message": "success delete"
    });
  } catch (err) {
    res.status(300).json({
      message: err.message
    })
  }
})