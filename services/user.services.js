const User = require("../models/user.model");
const bcrypt = require("bcryptjs");
const auth = require("../middlewares/auth.js");

// Login
async function login({ email, password }, callback) {
  const user = await User.findOne({ email });

  if (user != null) {
    if(password==undefined){
      return callback({
        message: "Invalid Email/Password!",
      });
    }
     else if (bcrypt.compareSync(password, user.password)) {
      const token = auth.generateAccessToken(email);
      // call toJSON method applied during model instantiation
      return callback(null, { ...user.toJSON(), token });
    } else {
      return callback({
        message: "Invalid Email/Password!",
      });
    }
  } else {
    return callback({
      message: "Invalid Email/Password!",
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

  const user = new User(params);
  user
    .save()
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}




module.exports = {
  login,
  register,
};
