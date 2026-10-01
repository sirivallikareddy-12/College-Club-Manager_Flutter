
import 'package:flutter/material.dart';
import 'event_details_screen.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  final List<Map<String, dynamic>> events = const [
    {
      'name': 'Coding Contest',
      'date': '25 September',
      'time': '10:00 AM',
      'location': 'Seminar Hall',
      'description':
          'Participate in a coding contest to test your '
          'programming and problem-solving skills.',
      'icon': Icons.code,
    },
    {
      'name': 'Web Development Workshop',
      'date': '30 September',
      'time': '2:00 PM',
      'location': 'Lab 3',
      'description':
          'Learn the fundamentals of web development '
          'and explore modern web technologies.',
      'icon': Icons.web,
    },
    {
      'name': 'Robotics Workshop',
      'date': '5 October',
      'time': '11:00 AM',
      'location': 'Innovation Lab',
      'description':
          'Explore robotics, automation and practical '
          'applications of IoT.',
      'icon': Icons.smart_toy,
    },
    {
      'name': 'Photography Walk',
      'date': '10 October',
      'time': '4:00 PM',
      'location': 'College Campus',
      'description':
          'Join fellow photography enthusiasts to capture '
          'creative moments around the campus.',
      'icon': Icons.camera_alt,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upcoming Events',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return Card(
            color: Colors.white,
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.indigo.shade50,
                child: Icon(
                  event['icon'] as IconData,
                  color: Colors.indigo,
                  size: 28,
                ),
              ),
              title: Text(
                event['name'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${event['date']} • ${event['time']}',
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event['location'] as String,
                    ),
                  ],
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.indigo,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailsScreen(
                      eventName: event['name'] as String,
                      date: event['date'] as String,
                      time: event['time'] as String,
                      location: event['location'] as String,
                      description:
                          event['description'] as String,
                      icon: event['icon'] as IconData,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
