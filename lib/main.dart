import 'package:components/src/pages/Home_Page.dart';
import 'package:components/src/pages/SMTP/SMTP.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Opc());
  }
}

class Opc extends StatelessWidget {
  const Opc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SMTP())),
                child: Text(
                  'SMTP',
                  style: TextStyle(fontSize: 24),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                child: Text(
                  'JsonLocal',
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }
}
