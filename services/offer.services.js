const Offer = require("../models/offer.model");
async function register(params, callback) {
    console.log("params")
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