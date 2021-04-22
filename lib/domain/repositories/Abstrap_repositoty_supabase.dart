abstract class AbstrapRepoSupabase {
  Future signIn({String email, String password});

  Future signUp({String email, String password});

  Future forgatPass({String email});

  Future signOut();

  Future isAuth();
}
