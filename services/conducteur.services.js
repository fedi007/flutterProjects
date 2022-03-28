const Conducteur = require("../models/conducteur.model");
const bcrypt = require("bcryptjs");
const auth = require("../middlewares/auth.js");




async function login({ username, password }, callback) {
  const conducteur = await Conducteur.findOne({ username });

  if (conducteur != null) {
    if (bcrypt.compareSync(password, conducteur.password)) {
      const token = auth.generateAccessToken(username);
      // call toJSON method applied during model instantiation
      return callback(null, { ...conducteur.toJSON(), token });
    } else {
      return callback({
        message: "Invalid Username/Password!",
      });
    }
  } else {
    return callback({
      message: "Invalid Username/Password!",
    });
  }
}


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
    login,
  };
  
