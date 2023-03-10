import 'package:firebase_auth/firebase_auth.dart';
import 'package:notesapp/authentication/auth_logic.dart';
import 'package:notesapp/authentication/auth_provider.dart';
import 'package:notesapp/authentication/auth_user.dart';

class AuthServices implements AuthProvider {
  AuthProvider provider;
  AuthServices(this.provider);

  factory AuthServices.firebase() => AuthServices(AuthLogic());
  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> initilizeApp() => provider.initilizeApp();

  @override
  Future<void> logout() => provider.logout();
  @override
  Future<void> sendEmailVerificationCode() =>
      provider.sendEmailVerificationCode();

  @override
  Future<AuthUser> signIn({required String email, required String password}) =>
      provider.signIn(email: email, password: password);

  @override
  Future<AuthUser> signUp({required String email, required String password}) =>
      provider.signUp(email: email, password: password);

  @override
  Stream<User?> currentState() => provider.currentState();

  @override
  Future<void> sendPasswordResetEmail({required String email}) =>
      provider.sendPasswordResetEmail(email: email);
}
