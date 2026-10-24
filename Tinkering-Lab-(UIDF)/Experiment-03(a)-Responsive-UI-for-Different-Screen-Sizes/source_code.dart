import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current screen width.
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive UI'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWideScreen = constraints.maxWidth >= 600;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Responsive Flutter Application',
                  style: TextStyle(
                    fontSize: isWideScreen ? 30 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Screen width: ${screenWidth.toStringAsFixed(0)} px',
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 25),

                // Change layout based on available width.
                if (isWideScreen)
                  const Row(
                    children: [
                      Expanded(
                        child: InfoCard(
                          icon: Icons.phone_android,
                          title: 'Mobile',
                          description: 'Compact layout for small devices.',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: InfoCard(
                          icon: Icons.tablet,
                          title: 'Tablet',
                          description: 'Expanded layout for larger screens.',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: InfoCard(
                          icon: Icons.desktop_windows,
                          title: 'Desktop',
                          description: 'Wide layout for desktop displays.',
                        ),
                      ),
                    ],
                  )
                else
                  const Column(
                    children: [
                      InfoCard(
                        icon: Icons.phone_android,
                        title: 'Mobile',
                        description: 'Compact layout for small devices.',
                      ),
                      SizedBox(height: 16),
                      InfoCard(
                        icon: Icons.tablet,
                        title: 'Tablet',
                        description: 'Expanded layout for larger screens.',
                      ),
                      SizedBox(height: 16),
                      InfoCard(
                        icon: Icons.desktop_windows,
                        title: 'Desktop',
                        description: 'Wide layout for desktop displays.',
                      ),
                    ],
                  ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Responsive Button'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
