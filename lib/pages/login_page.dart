import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_input_box.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              

              MyCustomInputBox(
                label: 'EMAIL',
                inputHint: 'Email',
              ),
              
              SizedBox(
                height: 30,
              ),
              
              MyCustomInputBox(
                label: 'PASSWORD',
                inputHint: 'Password',
              ),
              
              SizedBox(
                height: 60,
              ),
              Container(
                height: 60,
                width: scrWidth,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ElevatedButton(
                    child: Text("SIGN IN".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                    
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.white)))),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/catalog')),
              ),

              SizedBox(
                height: 30,
              ),
              Text("Sign with a social account "),

              SizedBox(
                height: 30,
              ),
              
              Center(
                child: Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(FontAwesomeIcons.facebook, size: 16.0),
                      Icon(FontAwesomeIcons.google, size: 16.0),
                      Icon(FontAwesomeIcons.twitter, size: 16.0),
                    ],
                  ),
                ),
              ),
              

              
            ],
          ),
        ),
      ),
    );
  }
}
