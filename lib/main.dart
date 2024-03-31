import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';
import 'package:read_it/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/utils/service_locator.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.debug);
  runApp(const KnowledgeWorldApp());
}

class KnowledgeWorldApp extends StatelessWidget {
  const KnowledgeWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.light().copyWith(
        primaryColor: kLightTheme,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
