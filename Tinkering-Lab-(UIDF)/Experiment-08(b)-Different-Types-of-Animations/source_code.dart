import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationTypesApp());
}

class AnimationTypesApp extends StatelessWidget {
  const AnimationTypesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Types',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  bool fade = false;
  bool slide = false;
  bool scale = false;
  bool rotate = false;

  void resetAnimations() {
    setState(() {
      fade = false;
      slide = false;
      scale = false;
      rotate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Different Animations'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Animation Demo',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // Fade Animation
                const Text(
                  'Fade Animation',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                AnimatedOpacity(
                  opacity: fade ? 0.1 : 1.0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: const Icon(
                    Icons.favorite,
                    size: 80,
                    color: Colors.red,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      fade = !fade;
                    });
                  },
                  child: const Text('Fade'),
                ),

                const SizedBox(height: 30),

                // Slide Animation
                const Text(
                  'Slide Animation',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                AnimatedSlide(
                  offset: slide
                      ? const Offset(1.5, 0)
                      : Offset.zero,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: const Icon(
                    Icons.star,
                    size: 80,
                    color: Colors.orange,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      slide = !slide;
                    });
                  },
                  child: const Text('Slide'),
                ),

                const SizedBox(height: 30),

                // Scale Animation
                const Text(
                  'Scale Animation',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                AnimatedScale(
                  scale: scale ? 1.8 : 1.0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.elasticOut,
                  child: const Icon(
                    Icons.flutter_dash,
                    size: 70,
                    color: Colors.blue,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      scale = !scale;
                    });
                  },
                  child: const Text('Scale'),
                ),

                const SizedBox(height: 30),

                // Rotation Animation
                const Text(
                  'Rotation Animation',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                AnimatedRotation(
                  turns: rotate ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: const Icon(
                    Icons.settings,
                    size: 80,
                    color: Colors.green,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rotate = !rotate;
                    });
                  },
                  child: const Text('Rotate'),
                ),

                const SizedBox(height: 30),

                OutlinedButton(
                  onPressed: resetAnimations,
                  child: const Text('Reset All'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
