import 'package:firebase_auth/firebase_auth.dart';
import 'package:notesapp/authentication/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;
  Future<void> initilizeApp();
  Stream<User?> currentState();

  Future<AuthUser> signIn({
    required String email,
    required String password,
  });

  Future<AuthUser> signUp({
    required String email,
    required String password,
  });

  Future<void> sendEmailVerificationCode();
  Future<void> logout();

  Future<void> sendPasswordResetEmail({required String email});
}
