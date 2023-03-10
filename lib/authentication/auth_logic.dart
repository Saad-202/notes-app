import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/authentication/auth_exceptions.dart';
import 'package:notesapp/authentication/auth_provider.dart';
import 'package:notesapp/authentication/auth_user.dart';
import 'package:notesapp/firebase_options.dart';
import 'package:notesapp/state_management/text_field_provider.dart';
import 'package:provider/provider.dart';

class AuthLogic implements AuthProvider {
  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<void> initilizeApp() {
    return Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Future<void> logout() async {
    final user = currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> sendEmailVerificationCode() async {
    if (currentUser != null) {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<AuthUser> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == 'firebase_auth/network-request-failed') {
        throw NoInternetConnection();
      } else {
        print(e.code);
        print(e.runtimeType);
        throw GenericAuthException();
      }
    } catch (_) {
      print(_.hashCode);
      print(_.hashCode);
      throw GenericAuthException();
    }
  }

  @override
  Future<AuthUser> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseAuthException();
      } else if (e.code == 'network-request-failed') {
        throw NoInternetConnection();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == 'firebase_auth/network-request-failed') {
        throw NoInternetConnection();
      } else {
        print('error in catch e ');
        print(e.runtimeType);
        print(e.code);
        print('error in catch e ');
        throw GenericAuthException();
      }
    } catch (_) {
      print('error in catch_');
      print(_.runtimeType);
      print('error in catch_');
      throw GenericAuthException();
    }
  }

  @override
  Stream<User?> currentState() => FirebaseAuth.instance.authStateChanges();

  @override
  Future<void> sendPasswordResetEmail({required String email}) async =>
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
