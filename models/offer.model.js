const mongoose = require("mongoose");
const { default: mongooseDeepPopulate } = require("mongoose-deep-populate");
const { Schema } = mongoose;
const uniqueValidator = require("mongoose-unique-validator");


const OfferSchema = new Schema({
  depart: {
    type: String,
    required: true,
  },
  arrivee: {
    type: String,
    required: true,
  },
  deliveryType: {
    type: String,
    required: true,
  },
  user: {
    type: Schema.Types.ObjectId,
    required: true,
    ref:'user',
  },
   quantity: {
       type: String,
     required: true,
   },
  time: {
    type: String,
    required: true,
  },

  load: {
    type: String,
    required: true,
  },
  date: {
    type: Date,
    default: Date.now(),
  },
});


OfferSchema.set("toJSON", {
  transform: (document, returnedObject) => {
    returnedObject.id = returnedObject._id.toString();
    delete returnedObject._id;
    delete returnedObject.__v;
    //do not reveal passwordHash
    delete returnedObject.password;
  },
});


//OfferSchema.plugin(uniqueValidator, { message: "Email already in use." });
OfferSchema.plugin(uniqueValidator, { message: "Email already in use." });



const Offer = mongoose.model("offer", OfferSchema);
module.exports = Offer;