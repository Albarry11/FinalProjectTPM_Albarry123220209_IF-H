import 'package:flutter/material.dart';
import '../services/step_tracking_service.dart';
import '../utils/notification_util.dart';
import 'journal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _steps = 0;

  @override
  void initState() {
    super.initState();
    StepTrackingService().startTracking(_updateSteps);
  }

  void _updateSteps(int steps) {
    setState(() {
      _steps = steps;
    });
    if (_steps % 1000 == 0) {
      NotificationUtil.showNotification();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habit Tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Steps Taken: $_steps', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to journal screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JournalScreen()),
                );
              },
              child: const Text('Go to Journal'),
            ),
          ],
        ),
      ),
    );
  }
}
