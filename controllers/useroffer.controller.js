const Offer = require("../models/offer.model");
const Conducteuroffer = require("../models/conducteuroffer.model");

// Creating one 
exports.register = (async (params) => {
  var result;
  try {
    const offer = new Offer(params);
    await offer.save().then((response) => {
        result = response
      })
      .catch((err) => {
        result = {
          "errtype": "1",
          "message": err["message"]
        }
      });
    return result
  } catch (err) {
    return {
      "errtype": "2",
      "message": err.message
    }
  }
});


// Updating One
exports.update = (async (req, res) => {
  try {

    var emptyvalue = true;

    for (var i in req.body) {
      if (req.body[i] == "" || req.body[i] == null)
        emptyvalue = false
    }
    if (emptyvalue) {

      var offer = await Offer.findById(req.body.offer)

      const register = await this.register({
        "depart": offer["depart"],
        "arrivee": offer["arrivee"],
        "deliveryType": offer["deliveryType"],
        "user": "6260906844e691322c31cada",
        "quantity": offer["quantity"],
        "time": offer["time"],
        "daytime": offer["daytime"],
        "load": offer["load"],
        "status": "deleted"
      });

      if (register["errtype"] == "1")
        res.status(400).json(register["message"])
      else if (register["errtype"] == "2")
        res.status(500).json(register["message"])

      const upoffer = await Offer.updateOne(

        {
          _id: req.body.offer
        }, {
          deliveryType: req.body.deliveryType,
          depart: req.body.depart,
          arrivee: req.body.arrivee,
          load: req.body.load,
          quantity: req.body.quantity,
          time: req.body.time,
          daytime: req.body.daytime,
          load: req.body.load
        })

      if (upoffer.modifiedCount == 1) {
        offer = await Offer.findById(req.body.offer)
        res.status(200).json(offer)
      } else {
        const deleteoffernotregister = this.deleteoffernotregister(register["_id"])
        if (deleteoffernotregister != null)
          return res.status(400).json({
            "message": " can't update"
          });
        else
          return res.status(500).json("error wrong offer in database need fix")
      }
    } else
      res.status(400).json({
        "message": "values can't be empty"
      })


  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
});




// Deleting One
exports.delete = (async (req, res) => {
  try {
    offer = await Offer.findByIdAndUpdate(req.body.offer, {
      status: "deleted"
    })
    res.json({
      message: "Deleted Offer"
    })
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
})





// Get offers by user
exports.getByuser = (async (req, res) => {
  try {
    const offer = await Offer.find({
      user: req.body.user,
      status: "active"
    }).populate('user');
    var listoffer = [];
    for (var i = 0; i < offer.length; i++)
      if (await Conducteuroffer.findOne({
          offer: offer[i]["id"]
        }) == null)
        listoffer.push(offer[i]);
    res.status(200).json(listoffer)
  } catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
})


// Get accepted offers by user
exports.getacceptedoffersbyuser = (async (req, res) => {
  const userlist = [];
  try {
    const conducteuroffer = await Conducteuroffer.find({
      completeoffer: req.body.completeoffer,
      status: "active"
    }).populate('conducteur').populate('offer').populate('truck')
    conducteuroffer.forEach((function (e) {
      if (e["offer"]["user"] == req.body.user)
        userlist.push(e);
    }));
    res.json(userlist)
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
      res.status(300).json("can't update")
  } catch (err) {
    res.status(400).json({
      message: err.message
    })
  }
});

// delete offer not register
exports.deleteoffernotregister = (async (req) => {
  try {
    const offer = await Offer.findByIdAndDelete(req)
    if (offer != null)
      return offer;
    else
      return null

  } catch (err) {
    return null;
  }
});