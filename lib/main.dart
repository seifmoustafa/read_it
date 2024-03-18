import 'package:flutter/material.dart';
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
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
