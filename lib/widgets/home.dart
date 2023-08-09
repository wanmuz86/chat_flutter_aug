import 'package:chat_app/widgets/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String currentUserId;

  HomePage({required this.currentUserId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee page"),),
      body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder:(context,snapshot){
          if (!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          else {
            final List<DocumentSnapshot> documents = snapshot.requireData.docs;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context,index){
                  return documents[index]["id"] == widget.currentUserId ? Container():  Card(
                    child: ListTile(
                      title: Text(documents[index]["email"]!),
                      subtitle: Text(documents[index]["department"]!),
                      trailing: Icon(Icons.chevron_right),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>DetailPage(userId: widget.currentUserId,
                            friendId: documents[index]["id"],))
                        );
                      },
                    ),
                  );
                });
          }
        }
      )
    );
  }
}
