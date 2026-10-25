import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({super.key});

  @override
  State<AnimationHomePage> createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create the animation controller.
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the animation range.
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void startAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    // Release animation resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value * 2 * 3.14159,
                  child: Opacity(
                    opacity: 0.3 + (_animation.value * 0.7),
                    child: Container(
                      width: 100 + (_animation.value * 100),
                      height: 100 + (_animation.value * 100),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                          10 + (_animation.value * 40),
                        ),
                      ),
                      child: const Icon(
                        Icons.flutter_dash,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: startAnimation,
              child: const Text('Start / Reverse Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
