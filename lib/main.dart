import 'package:flutter/material.dart';
import 'pages/implicit_animation_page.dart';
import 'pages/explicit_animation_page.dart';
import 'pages/interactive_animation_page.dart';
import 'pages/transition_example_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation & Transition',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation & Transition'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            menuButton(context, "Implicit Animation", const ImplicitAnimationPage()),
            menuButton(context, "Explicit Animation", const ExplicitAnimationPage()),
            menuButton(context, "Interactive Animation", const InteractiveAnimationPage()),
            menuButton(context, "Page Transition", const TransitionExamplePage()),
          ],
        ),
      ),
    );
  }

  Widget menuButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        child: Text(title),
      ),
    );
  }
}
