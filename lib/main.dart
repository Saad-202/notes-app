import 'package:flutter/material.dart';
import 'package:notesapp/authentication/auth_services.dart';
import 'package:notesapp/firebase_options.dart';
import 'package:notesapp/pages/auth/email_send.dart';
import 'package:notesapp/pages/auth/forgot_password.dart';
import 'package:notesapp/pages/auth/signin_page.dart';
import 'package:notesapp/pages/auth/signup_page.dart';
import 'package:notesapp/pages/auth/verify_account_page.dart';
import 'package:notesapp/pages/homepage.dart';
import 'package:notesapp/pages/notes/add_or_update.dart';
import 'package:notesapp/state_management/email_provider.dart';
import 'package:notesapp/state_management/text_field_provider.dart';
import 'package:notesapp/state_management/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'assets/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

//all routes
Map<String, WidgetBuilder> routes = {
  '/add_or_update': (context) => const AddorUpdate(),
  '/homePage': (context) => const HomePage(),
  '/sign_in': (context) => const SigninPage(),
  '/sign_up': (context) => const SignupPage(),
  '/verify_email': (context) => const VerifyAccountPage(),
  '/email_send': (context) => const EmailSend(),
  '/forgot_password': (context) => const ForgotPassword()
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TextFieldProvider()),
        ChangeNotifierProvider(create: (_) => EmailProvider()),
      ],
      builder: (context, child) {
        return Consumer<ThemeProvider>(builder: (context, value, child) {
          return MaterialApp(
            routes: routes,
            themeMode: value.currentThemeMode,
            theme: currentTheme(Brightness.light),
            darkTheme: currentTheme(Brightness.dark),
            home: StreamBuilder(
                stream: AuthServices.firebase().currentState(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went Wrong'),
                    );
                  } else if (AuthServices.firebase().currentUser == null) {
                    return const SigninPage();
                  } else {
                    return const HomePage();
                  }
                }),
          );
        });
      },
    );
  }
}
