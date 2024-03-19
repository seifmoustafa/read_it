import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowledge_world/core/utils/app_router.dart';

void main() {
  runApp(const KnowledgeWorldApp());
}

class KnowledgeWorldApp extends StatelessWidget {
  const KnowledgeWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)),
      debugShowCheckedModeBanner: false,
    );
  }
}
