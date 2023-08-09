import 'package:flutter/material.dart';
import 'register.dart';
import 'forgot.dart';
import 'home.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(decoration: InputDecoration(hintText: "Enter email"),),
              TextField(decoration: InputDecoration(hintText: "Enter password"), obscureText: true,),
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> HomePage()));

              }, child: Text("Login")),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));

              },child: Text("No account? Register now!"),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPage()));

              },child: Text("Forgot Password"),)
            ],
          ),
        ),
      )


    );

  }
}
