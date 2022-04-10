const Conducteuroffer = require("../models/conducteuroffer.model");
// Creating one
async function register(params, callback) {
    const conducteuroffer = new Conducteuroffer(params);
    conducteuroffer
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