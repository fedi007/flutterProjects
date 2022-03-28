const Conducteur = require("../models/conducteur.model");
const bcrypt = require("bcryptjs");
const auth = require("../middlewares/auth.js");

async function register(params, callback) {
    if (params.username === undefined) {
      return callback(
        {
          message: "Username Required",
        },
        ""
      );
    }
    const conducteur = new Conducteur(params);
    conducteur
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
  