import 'package:flutter/material.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Forgot Password"),),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextField(decoration: InputDecoration(hintText: "Enter email"),),
                ElevatedButton(onPressed: (){}, child: Text("Forgot Password")),
              ],
            ),
          ),
        )


    );
  }
}
