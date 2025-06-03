import 'package:flutter/material.dart';
import 'package:what_chat/features/user/presentation/screens/login_page.dart';
import 'package:what_chat/app/theme/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Welcome to WhatsApp",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: tabColor),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Image.asset(
              "assets/bg_image.png",
              height: 300,
              width: 300,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Read our Privacy Policy Tap, 'Agree and Continue' to accept the Team of Service.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15,
              color: blackColor
              ),
              
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: tabColor,
                    ),
                    child: Center(
                      child: Text(
                        "Agree and Continue",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
