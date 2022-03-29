const mongoose = require("mongoose");
const { Schema } = mongoose;
const uniqueValidator = require("mongoose-unique-validator");

const DeliveryTypeSchema = new Schema({
  deliveryType: {
    type: String,
    required: true,
  },
});

/*
 *  Here we are creating and setting an id property and 
    removing _id, __v, and the password hash which we do not need 
    to send back to the client.
 */
DeliveryTypeSchema.set("toJSON", {
  transform: (document, returnedObject) => {
    returnedObject.id = returnedObject._id.toString();
    delete returnedObject._id;
    delete returnedObject.__v;
    //do not reveal passwordHash
    delete returnedObject.password;
  },
});

/**
 * 1. The deliveryTypeSchema.plugin(uniqueValidator) method won’t let duplicate email id to be stored in the database.
 * 2. The unique: true property in email schema does the internal optimization to enhance the performance.
 */
DeliveryTypeSchema.plugin(uniqueValidator, { message: "Email already in use." });

const DeliveryType = mongoose.model("deliveryType", DeliveryTypeSchema);
module.exports = DeliveryType;