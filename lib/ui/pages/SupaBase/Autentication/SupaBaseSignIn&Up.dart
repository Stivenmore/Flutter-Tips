import 'package:components/data/repositories/supabase/Repository.dart';
import 'package:components/ui/pages/SupaBase/Home/SupabaseHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignIn extends StatelessWidget {
  SignIn({Key key}) : super(key: key);

  Repository _repository = Repository();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Sign In from Supabase',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.green[700]),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        child: Center(
          child: Container(
            height: 400,
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: email,
                  cursorColor: Colors.green[700],
                  style: TextStyle(color: Colors.green[700]),
                  decoration: InputDecoration(
                    focusColor: Colors.green[700],
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green[700],
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.green[700]),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  controller: password,
                  cursorColor: Colors.green[700],
                  style: TextStyle(color: Colors.green[700]),
                  decoration: InputDecoration(
                    focusColor: Colors.green[700],
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green[700],
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.green[700]),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () async {
                      final resp = await _repository.signIn(
                          email: email.text, password: password.text);
                      print(email.text);
                      print(password.text);
                      if (resp != null) {
                        email.clear();
                        password.clear();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SupabaseHome(),
                            ),
                            (route) => false);
                      } else {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Credenciales no encontradas'),
                            content: Text('Intente mas tarde'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(16)),
                      height: 50,
                      width: 120,
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    )),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () async {
                      final resp = await _repository.signUp(
                          email: email.text, password: password.text);
                      print(email.text);
                      print(password.text);
                      if (resp != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SupabaseHome(),
                            ),
                            (route) => false);
                        password.clear();
                      } else {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Credenciales no encontradas'),
                            content: Text('Intente mas tarde'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green[700]),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      height: 50,
                      width: 120,
                      child: Center(
                          child: Text(
                        'Sign Up',
                        style:
                            TextStyle(color: Colors.green[700], fontSize: 20),
                      )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
