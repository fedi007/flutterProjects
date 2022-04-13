const Truck = require("../models/truck.model");



// Creating one
async function register(params, callback) {
    const truck = new Truck(params);
    truck
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
  