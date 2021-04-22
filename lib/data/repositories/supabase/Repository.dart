import 'package:components/domain/repositories/Abstrap_repositoty_supabase.dart';
import 'package:supabase/supabase.dart';

class Repository extends AbstrapRepoSupabase {
  static const supabaseUrl = 'https://inblwjovimekeathlubd.supabase.co';
  static const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYxOTA4ODIzMCwiZXhwIjoxOTM0NjY0MjMwfQ.2GoLfa4a8sOFXLazampWixaYgJNSdfJcdvgMdSjNmms';

  final supabase = SupabaseClient(supabaseUrl, supabaseKey);

  @override
  Future signIn({String email, String password}) async {
    try {
      final resp = await supabase.auth.signIn(email: email, password: password);
      return resp;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future forgatPass({String email}) async {}

  @override
  Future signUp({String email, String password}) async {
    try {
      final resp = await supabase.auth.signUp(email, password);
      print('Sign Up');
      await supabase.from('Users').insert([{
        'email': email,
        'password': password,
        'uuid': resp.user.id,
        'LastSignIn': resp.user.lastSignInAt
      }]).execute();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future signOut() async {
    try {
      await supabase.auth.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future isAuth() async {
    try {
      final uid = supabase.auth.currentUser.id;
      return uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
