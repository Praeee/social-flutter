import 'package:flutter/material.dart';
import 'package:social/utils/variables.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,
      body: 

      Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Social",
              style: mystyle(30,Colors.white,FontWeight.w600),
              ),
          //Text Login
              SizedBox(height:10,),
              Text(
                "Login",
                style: mystyle(25,Colors.white,FontWeight.w600),
              ),
              SizedBox(height:20,),
              Container(
                width: 64,
                height: 64,
                child: Image.asset('images/social-media.png'),
              ),
          //Email
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left : 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress ,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Email',
                      labelStyle: mystyle(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                      prefixIcon:  Icon(Icons.email)),
                ),
              ),

          //Password
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left : 20, right: 20),
                child: TextField(
                obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                      labelStyle: mystyle(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                      prefixIcon:  Icon(Icons.lock)),
                ),
              ),

          //Button Login
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width /2,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                   ),
                  child: Center(
                    child: Text('Login', 
                    style: mystyle(20,Colors.black,FontWeight.w700),
                    ) ,
                  ),
                ),

          //Register
              SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an account?",
                  style: mystyle(20),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp())),
                  child: Text(
                    "Register",
                    style: mystyle(20, Colors.purple, FontWeight.w700),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      
    );
  }
}