import 'package:chat_app/widgets/detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _employees = [
    {
    "name":"Clint",
    "department":"Marketing"
    },
    {
      "name":"Alice",
      "department":"I.T"
    },
    {
      "name":"John",
      "department":"I.T"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee page"),),
      body:ListView.builder(
          itemCount: _employees.length,
          itemBuilder: (context,index){
        return Card(
          child: ListTile(
            title: Text(_employees[index]["name"]!),
            subtitle: Text(_employees[index]["department"]!),
            trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>DetailPage())
              );
            },
          ),
        );
      })
    );
  }
}
