const mongoose = require("mongoose");
const { Schema } = mongoose;
const uniqueValidator = require("mongoose-unique-validator");

const ConducteurSchema = new Schema({
  username: {
    type: String,
    required: true,
    unique: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  TruckModel: {
    type: String,
    required: true,
 },
   TruckLicense: {
     type: String,
     required: true,
   },
  date: {
    type: Date,
    default: Date.now(),
  },
});


ConducteurSchema.set("toJSON", {
  transform: (document, returnedObject) => {
    returnedObject.id = returnedObject._id.toString();
    delete returnedObject._id;
    delete returnedObject.__v;
    //do not reveal passwordHash
    delete returnedObject.password;
  },
});


ConducteurSchema.plugin(uniqueValidator, { message: "Email already in use." });

const Conducteur = mongoose.model("conductors", ConducteurSchema);
module.exports = Conducteur;