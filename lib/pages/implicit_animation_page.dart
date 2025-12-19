import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({super.key});

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Implicit Animation")),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: isBig ? 200 : 100,
          height: isBig ? 200 : 100,
          color: isBig ? Colors.blue : Colors.red,
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            isBig = !isBig;
          });
        },
      ),
    );
  }
}
