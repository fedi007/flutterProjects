const userofferServices = require("../services/useroffer.services");
const Offer = require("../models/offer.model");
const Conducteuroffer = require("../models/conducteuroffer.model");

// Creating one 
exports.register = (req, res, next) => {
  userofferServices.register(req.body, (error, results) => {
    if (error) {
      return next(error);
    }
    return res.status(201).send({

      data: results,
    });
  });
};

// Deleting One
exports.delete = (async (req, res) => {
  try {
    offer = await Offer.findById(req.body.id)
    await offer.remove()
    res.status(200).json({
      message: 'Deleted Offer'
    })
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
})



// Get by user
exports.getByuser = (async (req, res) => {
  try {
    const offer = await Offer.find({
      user: req.body.user
    }).populate('user');
    var listoffer=[];
    for(var i=0;i<offer.length;i++)
     if(await Conducteuroffer.findOne({offer:offer[i]["id"]})==null)
     listoffer.push(offer[i]);
    res.status(200).json(listoffer)
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
})
// Updating One
exports.update = (async (req, res) => {
  try {
    var emptyvalue =true;

    for(var i in req.body)
    {
     if(req.body[i]=="" || req.body[i]==null)
      emptyvalue=false
    }
    if(emptyvalue)
    {
    const upoffer = await Offer.updateOne(

      {
        _id: req.body.id
      }, {
        deliveryType: req.body.deliveryType,
       depart: req.body.depart,
       arrivee: req.body.arrivee,
       load: req.body.load,
       quantity: req.body.quantity,
       time: req.body.time,
       daytime: req.body.daytime,
      })
    const offer = await Offer.findById(req.body.id);
    if (upoffer.modifiedCount == 1)
      res.status(200).json(offer)
    else
      res.status(400).json("can't update")
    }else
    res.status(400).json("values can't be empty")
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
});
// Get accepted offers by user
exports.getacceptedoffersbyuser = (async (req, res) => {
  const userlist = [];
  try {
    const conducteuroffer = await Conducteuroffer.find({
      completeoffer: req.body.completeoffer
    }).populate('conducteur').populate('offer').populate('truck')
    conducteuroffer.forEach((function (e) {
      if (e["offer"]["user"] == req.body.user)
        userlist.push(e);
    }));
    res.status(200).json(userlist)
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
})
// user accepte offer
exports.useraccepteoffer = (async (req, res) => {
  try {
    const upconducteuroffer = await Conducteuroffer.updateOne({
      _id: req.body.id
    }, {
      completeoffer: true
    })
    if (upconducteuroffer.modifiedCount == 1)
      res.status(200).json("success update")
    else
      res.status(400).json("can't update")
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
});
