import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 188, 188),
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ExpansionTile(
              title: new RichText(
                  text: new TextSpan(
                children: <TextSpan>[
                  new TextSpan(
                      style: new TextStyle(
                        color: Colors.black,
                      ),
                      text: 'From '),
                  new TextSpan(
                      text: 'TUNIS ',
                      style: new TextStyle(
                          fontSize: 18, color: Color(0xFF005b71))),
                  new TextSpan(
                      style: new TextStyle(
                        color: Colors.black,
                      ),
                      text: 'To '),
                  new TextSpan(
                      text: 'GABES ',
                      style: new TextStyle(
                          fontSize: 18, color: Color(0xFF005b71))),
                ],
              )),
              subtitle: Text("Simen w yajour / Delivering and unloading"),
              children: [
                ListTile(
                  title: Text("Edit"),

                  trailing: Icon(Icons.edit),
                ),
                ListTile(
                  title: Text("Delete"),
                  trailing: Icon(Icons.delete),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
