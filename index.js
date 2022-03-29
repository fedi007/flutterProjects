const express = require("express");
const app = express();
const mongoose = require("mongoose");
const dbConfig = require("./config/db.config");

const auth = require("./middlewares/auth.js");
const errors = require("./middlewares/errors.js");
const unless = require("express-unless");
var id;
// connect to mongodb

/**
 * With useNewUrlParser: The underlying MongoDB driver has deprecated their current connection string parser. 
 * Because this is a major change, they added the useNewUrlParser flag to allow users to fall back to the old parser if they find a bug in the new parser. 
 * You should set useNewUrlParser: true unless that prevents you from connecting.
 * 
 * With useUnifiedTopology, the MongoDB driver sends a heartbeat every heartbeatFrequencyMS to check on the status of the connection. 
 * A heartbeat is subject to serverSelectionTimeoutMS , so the MongoDB driver will retry failed heartbeats for up to 30 seconds by default.
 */
mongoose.Promise = global.Promise;
mongoose
  .connect(dbConfig.db, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(
    () => {
      console.log("Database connected");
    },
    (error) => {
      console.log("Database can't be connected: " + error);
    }
  );

// middleware for authenticating token submitted with requests
/**
 * Conditionally skip a middleware when a condition is met.
 */
auth.authenticateToken.unless = unless;
app.use(
  auth.authenticateToken.unless({
    path: [{
        url: "/users/login",
        methods: ["POST"]
      },
      {
        url: "/users/register",
        methods: ["POST"]
      },
      {
        url: "/users/update",
        methods: ["PATCH"]
      },
      {
        url: "/conducteur/register",
        methods: ["POST"]
      },
      {
        url: "/conducteur/login",
        methods: ["POST"]
      },
      {
        url: "/conducteur/update",
        methods: ["PATCH"]
      },
      {
        url: "/users/offer/register",
        methods: ["POST"]
      },
      {
        url: "/conducteur/offer/getall",
        methods: ["GET"]
      },
      {
        url: "/users/offer/delete",
        methods: ["DELETE"]
      },
      {
        url: "/users/offer/getbyuser",
        methods: ["POST"]
      },
      {
        url: "/users/offer/update",
        methods: ["PATCH"]
      },
    ],
  })
);

app.use(express.json());

// initialize routes
app.use("/users", require("./routes/users.routes"));

app.use("/conducteur", require("./routes/conducteur.routes"));

app.use("/users/offer", require("./routes/offer.routes"));
app.use("/conducteur/offer", require("./routes/offer.routes"));

// middleware for error responses
app.use(errors.errorHandler);

// listen for requests
app.listen(4000, () => {
  console.log("Ready to Go!");
});