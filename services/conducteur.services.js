const Conducteur = require("../models/conducteur.model");
const bcrypt = require("bcryptjs");
const auth = require("../middlewares/auth.js");



// Login
async function login({ username, password }, callback) {
  const conducteur = await (await Conducteur.findOne({ username }).populate('truck'));
  if (conducteur != null) {
    if (bcrypt.compareSync(password, conducteur.password)) {
      const token = auth.generateAccessToken(username);
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

// Creating one
async function register(params, callback) {
    if (params.username === undefined) {
      return callback(
        {
          message: "Username Required",
        },
        ""
      );
    }
    const truck =[];
    truck.push(params['truck']);
     params['truck']=truck;
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
  
