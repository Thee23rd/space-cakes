import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_cakes/Home/home/home.dart';

import 'signUp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PalogScreen();
}

class PalogScreen extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Sepa();
  }

  Widget Sepa() {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10)),
                color: Color.fromARGB(255, 243, 212, 33),
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 243, 219, 33)),
                  (Color.fromARGB(255, 243, 219, 33))
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20, top: 20),
                      child: Image.asset(
                        'assets/logo.png',
                        height: 300,
                        width: 300,
                      )),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: Text("Login",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 12), blurRadius: 70, color: Colors.grey)
                ]),
            alignment: Alignment.center,
            child: TextField(
              controller: emailController,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: "email",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 12), blurRadius: 70, color: Colors.grey)
                ]),
            alignment: Alignment.center,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.vpn_key,
                  color: Colors.black,
                ),
                hintText: "password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, right: 20),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text("Forgot Password?"),
              onTap: () => {},
            ),
          ),
          GestureDetector(
              onTap: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => repoHome()));
                /*  try {
                  
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);

                 
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Login Failed. Incorrect email or password.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }*/
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (Color.fromARGB(255, 243, 208, 33)),
                      Color.fromARGB(255, 243, 212, 33)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color.fromARGB(255, 255, 236, 68),
                    )
                  ],
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage())),
                  },
                  child: Text(
                    "Register Now",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
