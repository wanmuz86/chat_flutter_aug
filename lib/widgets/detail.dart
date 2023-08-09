import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var _messages = [
    {
      "sender":"John",
      "receiver":"Alice",
      "message":"Let's have lunch",
      "dt":"1/10/03 10.30"
    },
    {
      "sender":"John",
      "receiver":"Alice",
      "message":"Are you there?",
      "dt":"1/10/03 10.33"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat page"),),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        title:Text(_messages[index]["message"]!),
                        subtitle: Text(_messages[index]["dt"]!),
                      ),
                    );
                  }),
            ),
            Row(children: [
              Expanded(child: TextField(decoration: InputDecoration(hintText: "Enter the message"),)),
              IconButton(onPressed: (){}, icon: Icon(Icons.send))
            ],),

          ],
        ),
      )

    );
  }
}
