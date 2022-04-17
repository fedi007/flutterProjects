const Conducteuroffer = require("../models/conducteuroffer.model");


 exports.deletebydate=(async (req,res) => {
         var date1= new Date("2022-04-18T11:08:51.667Z");
         var date2= new Date("2022-04-18T11:08:51.668Z");
        const conducteuroffer = await Conducteuroffer.find().select('date -_id');
        //console.log(conducteuroffer[0]["date"]);
        console.log(date1<date2);

  
  });
  