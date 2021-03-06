import 'package:components/ui/pages/Home_Page.dart';
import 'package:components/ui/pages/SMTP/SMTP.dart';
import 'package:components/ui/pages/SupaBase/Autentication/SupaBaseSignIn&Up.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Opc(),
    theme: ThemeData(
      primaryColor: Colors.black,
    ),);
  }
}

class Opc extends StatelessWidget {
  const Opc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FLUTTER TIPS',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SMTP())),
                child: Text(
                  'Send Email with Flutter',
                  style: TextStyle(fontSize: 22),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                child: Text(
                  'JsonLocal',
                  style: TextStyle(fontSize: 22),
                )),
            SizedBox(
              height: 20,
            ),
             TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignIn())),
                child: Text(
                  'SupaBase with Flutter',
                  style: TextStyle(fontSize: 22),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'FireBase Auth and Testing',
                  style: TextStyle(fontSize: 22),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'CI/CD Firebase and GitHub Action',
                  style: TextStyle(fontSize: 22),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  '...',
                  style: TextStyle(fontSize: 22),
                )),
          ],
        ),
      ),
    );
  }
}
