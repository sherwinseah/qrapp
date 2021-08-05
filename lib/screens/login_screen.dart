import 'package:flutter/material.dart';
import 'package:qrapp/screens/tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('../assets/images/background.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/images/Platform_Logo_Blue.png',
              scale: 3,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "I am a...",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: "Raleway"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(TabsScreen.routename);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.blue.shade900,
                      ),
                      Text('Customer'),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade400),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.store_mall_directory,
                        color: Colors.blue.shade900,
                      ),
                      Text('Merchant'),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade400),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
