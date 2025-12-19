import 'package:flutter/material.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({super.key});

  @override
  State<ExplicitAnimationPage> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(controller);
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explicit Animation")),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Opacity(
              opacity: fadeAnimation.value,
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: child,
              ),
            );
          },
          child: const Icon(
            Icons.flutter_dash,
            size: 120,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}
