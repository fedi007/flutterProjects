const conducteurofferServices = require("../services/conducteuroffer.services");

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
      const offer = await Offer.find()
      res.json(offer)
    } catch (err) {
      res.status(500).json({ message: err.message })
    }
  })