import 'package:flutter/material.dart';
import 'register.dart';
import 'forgot.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(decoration: InputDecoration(hintText: "Enter email"), controller: emailEditingController,),
              TextField(decoration: InputDecoration(hintText: "Enter password"), obscureText: true, controller: passwordEditingController,),
              ElevatedButton(onPressed: (){


                _auth.signInWithEmailAndPassword(email: emailEditingController.text, password: passwordEditingController.text)
                    .then((val){
                  if (val != null){
                    User user = val.user!;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> HomePage(currentUserId: user.uid,)));
                  }
                  else {
                    print("Something is wrong");
                  }

                }).catchError((err){
                  print(err);
                });


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
