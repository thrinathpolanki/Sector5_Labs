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
      title: 'Media Query Demo',
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
    // Get the screen width using MediaQuery.
    final double screenWidth = MediaQuery.sizeOf(context).width;

    // Define breakpoints.
    String deviceType;
    int columns;

    if (screenWidth < 600) {
      deviceType = 'Mobile';
      columns = 1;
    } else if (screenWidth < 1024) {
      deviceType = 'Tablet';
      columns = 2;
    } else {
      deviceType = 'Desktop';
      columns = 4;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive UI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Media Query & Breakpoints',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 10),

            Text(
              'Screen Width: ${screenWidth.toStringAsFixed(0)} px',
              style: const TextStyle(fontSize: 16),
            ),

            Text(
              'Device Type: $deviceType',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Responsive grid.
            Expanded(
              child: GridView.count(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: const [
                  ResponsiveCard(
                    icon: Icons.home,
                    title: 'Home',
                  ),
                  ResponsiveCard(
                    icon: Icons.person,
                    title: 'Profile',
                  ),
                  ResponsiveCard(
                    icon: Icons.settings,
                    title: 'Settings',
                  ),
                  ResponsiveCard(
                    icon: Icons.notifications,
                    title: 'Notifications',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const ResponsiveCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 45),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
