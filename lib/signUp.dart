import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:space_cakes/login.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaSignUp();
}

class PaSignUp extends State<SignUpPage> {
  final FirstNameController = TextEditingController();
  final LastNameController = TextEditingController();
  final StudentNumController = TextEditingController();
  final programController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContextcontext) {
    return Ngena();
  }

  Widget Ngena() {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10)),
                color: Color.fromARGB(255, 243, 236, 33),
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 243, 229, 33)),
                  (Color.fromARGB(255, 243, 229, 33))
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
                        height: 200,
                        width: 200,
                      )),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: Text("SignUp",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 19, 14, 14))),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 50),
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
              controller: FirstNameController,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: "First Name",
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
              controller: LastNameController,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: "Last Name",
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
              controller: StudentNumController,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.numbers,
                  color: Colors.black,
                ),
                hintText: "Residential Address",
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
            child: TextFormField(
              controller: emailController,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                labelText: 'Email',
                hintText: "TheeDee@gmail.com",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
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
              controller: phoneController,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                hintText: "Phone Number",
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  (Color.fromARGB(255, 243, 222, 33)),
                  Color.fromARGB(255, 243, 219, 33)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color.fromRGBO(255, 227, 68, 1),
                )
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(),
            onPressed: () {
              String password = passwordController.text.trim();
              if (password.length < 8) {
                // Show an error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Password is too short.'),
                    duration: Duration(seconds: 3),
                  ),
                );
                return;
              }
              if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                  .hasMatch(password)) {
                // Show an error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Password is too weak.'),
                    duration: Duration(seconds: 3),
                  ),
                );
                return;
              }

              // Display a message to the user after signup is successful
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('New user created.'),
                  duration: Duration(seconds: 3),
                ),
              );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Container(
              height: 50,
              width: 200,
              child: Center(
                child: Text(
                  "SignUp",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account"),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage())),
                  },
                  child: Text(
                    "Login Here",
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
