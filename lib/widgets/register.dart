import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegisterPage extends StatelessWidget {

  // Initialize Firebase authentication
  FirebaseAuth _auth = FirebaseAuth.instance;
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register"),),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextField(decoration: InputDecoration(hintText: "Enter email"), controller: emailEditingController,),
                TextField(decoration: InputDecoration(hintText: "Enter password"), obscureText: true, controller: passwordEditingController,),
                ElevatedButton(onPressed: (){
                  _auth.createUserWithEmailAndPassword(email: emailEditingController.text,
                      password: passwordEditingController.text).then((val){
                        if (val != null){
                          // TODO replace with toast
                          // val is the response from the server, inside val there is a property user which
                          // stores user information from firebase authentication

                          User user = val.user!;
                          // I save (set) the information inside firestore , collection users
                          FirebaseFirestore.instance.collection('users').doc(user.uid).set(
                            {
                              "id":user.uid,
                              "email":user.email,
                              "registeredDate":DateTime.now()
                            }
                          );
                          print("Succesfully registered");
                        }
                  // TODO replace with toast
                        else {
                          print("Something is wrong");
                        }
                  });


                }, child: Text("Register")),
              ],
            ),
          ),
        )


    );
  }
}
