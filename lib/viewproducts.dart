import 'package:flutter/material.dart';
import 'package:red_coprative/account.dart';
import 'package:red_coprative/login.dart';

class ViewproductScreen extends StatefulWidget {
  const ViewproductScreen({super.key});

  @override
  State<ViewproductScreen> createState() => _ViewproductScreenState();
}

class _ViewproductScreenState extends State<ViewproductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            // Top section with app name and logout icon
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 32),
                    onPressed: () {
                      // Navigate to the Accountscreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Accountscreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset("assets/profilelogout.png"),
                    onPressed: () async {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                  ),
                ],
              ),
            ),
            ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("${vi}"))),
                )
              );
            },)
         ]
       )
      )
    );
  }
}