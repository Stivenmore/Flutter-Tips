import 'package:components/data/repositories/supabase/Repository.dart';
import 'package:components/ui/pages/SupaBase/Autentication/SupaBaseSignIn&Up.dart';
import 'package:flutter/material.dart';

class SupabaseHome extends StatefulWidget {
  SupabaseHome({Key key}) : super(key: key);

  @override
  _SupabaseHomeState createState() => _SupabaseHomeState();
}

class _SupabaseHomeState extends State<SupabaseHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            final resp = await Repository().signOut();
            if (resp == true) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ));
            } else {
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Tenemos problemas con el server'),
                  content: Text('Intente mas tarde'),
                ),
              );
            }
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}
