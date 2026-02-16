import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock notifications data
    final List<Map<String, String>> notifications = [
      {
        'title': 'Application Status Update',
        'body': 'Your application to IIT Bombay has been received.',
        'time': '2 hours ago',
      },
      {
        'title': 'New Course Alert',
        'body': 'Check out the new Data Science course at BITS Pilani.',
        'time': '1 day ago',
      },
      {
        'title': 'Exam Reminder',
        'body': 'JEE Main registration closes tomorrow.',
        'time': '2 days ago',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
              child: const Icon(Icons.notifications, color: Colors.blueAccent),
            ),
            title: Text(notification['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(notification['body']!),
                const SizedBox(height: 4),
                Text(notification['time']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
