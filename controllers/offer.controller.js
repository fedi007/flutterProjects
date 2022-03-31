const offerServices = require("../services/offer.services");
const Offer = require("../models/offer.model");

// Creating one
exports.register = (req, res, next) => {
   offerServices.register(req.body, (error, results) => {
      if (error) {
        return next(error);
      }
      return res.status(200).send({

        data: results,
      });
    });
  };
  // Deleting One
  exports.delete=( async (req, res) => {
    try {
      offer = await Offer.findById(req.body.id)
      await offer.remove()
      res.json({ message: 'Deleted Subscriber' })
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })

  // Getting all
  exports.getAll=( async (req, res) => {
    try {
      const offer = await Offer.find()
      res.json(offer)
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })

  // Get by user
  exports.getByuser=( async (req, res) => {
    try {
      const offer = await Offer.find({ username:req.body.username });
      console.log(offer)
      res.json(offer)
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })
  // Updating One
  exports.update=(async (req, res) => {
    try{
      const upoffer=await Offer.updateOne(
        {id:req.body.id},{deliveryType:req.body.deliveryType,depart:req.body.depart,arrivee:req.body.arrivee,load:req.body.load})
      if (upoffer.modifiedCount==1)
      res.json(req.body)
      else 
      res.status(300).json("can't update")
    } catch (err) {
      res.status(400).json({ message: err.message })
    }
  });