const offerServices = require("../services/offer.services");

exports.register = (req, res, next) => {
   offerServices.register(req.body, (error, results) => {
      if (error) {
        return next(error);
      }
      return res.status(200).send({
        message: "Success",
        data: results,
      });
    });
  };