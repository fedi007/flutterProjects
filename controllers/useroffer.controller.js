const userofferServices = require("../services/useroffer.services");
const Offer = require("../models/offer.model");
const Conducteuroffer = require("../models/conducteuroffer.model");

// Creating one 
exports.register = (req, res, next) => {
   userofferServices.register(req.body, (error, results) => {
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
      res.json({ message: 'Deleted Offer' })
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })



  // Get by user
  exports.getByuser=( async (req, res) => {
    try {
      const offer = await Offer.find({ user:req.body.user }).populate('user');
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
  // Get accepted offers by user
  exports.getacceptedoffersbyuser=( async (req, res) => {
    const userlist=[];
    try {
      const conducteuroffer = await Conducteuroffer.find({}).populate('conducteur').populate('offer')
      conducteuroffer.forEach((function(e)
      {
              if(e["offer"]["user"]==req.body.user)
              userlist.push(e);
      }));
      res.json(userlist)
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })
