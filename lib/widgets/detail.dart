import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
 String userId;
 String friendId;
 DetailPage({required this.userId, required this.friendId});

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
  
  var messageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var groupChatId = "";
    if (widget.friendId.hashCode < widget.userId.hashCode){
      groupChatId = '${widget.friendId}-${widget.userId}';
    }
    else {
      groupChatId = '${widget.userId}-${widget.friendId}';
    }

    return Scaffold(
      appBar: AppBar(title: Text("Chat page"),),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Expanded(
              child: StreamBuilder(
                stream:FirebaseFirestore.instance.collection('messages').
                  doc(groupChatId)
                    .collection(groupChatId).snapshots(),
                builder: (context, snapshot){
                  if (!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  else {
                    final List<DocumentSnapshot> documents = snapshot.requireData.docs;
                    return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: ListTile(
                              title:Text(documents[index]["content"]),
                              subtitle: Text(documents[index]["idFrom"]),
                            ),
                          );
                        });
                  }
                },
              )
            ),
            Row(children: [
              Expanded(child: TextField(decoration: InputDecoration(hintText: "Enter the message"), 
              controller: messageEditingController,)),
              IconButton(onPressed: (){

                FirebaseFirestore.instance.collection('messages').doc(groupChatId).collection(groupChatId)
                .doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
                  'idFrom':widget.userId,
                  'idTo':widget.friendId,
                  'content':messageEditingController.text,
                  'timestamp':DateTime.now().microsecondsSinceEpoch.toString()
                });
                
                
              }, icon: Icon(Icons.send))
            ],),

          ],
        ),
      )

    );
  }
}
