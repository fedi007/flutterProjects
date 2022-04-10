const Offer = require("../models/offer.model");
// Creating one
async function register(params, callback) {
    if (params.deliveryType === undefined) {
      return callback(
        {
          message: "delevryType Required",
        },
        ""
      );
    }
    const offer = new Offer(params);
    offer
      .save()
      .then((response) => {
        return callback(null, response);
      })
      .catch((error) => {
        return callback(error);
      });
  }
  module.exports = {
    register,
  };