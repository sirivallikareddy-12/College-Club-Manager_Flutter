
import 'package:flutter/material.dart';
import 'club_details_screen.dart';

class MyClubsScreen extends StatelessWidget {
  const MyClubsScreen({super.key});

  final List<Map<String, dynamic>> myClubs = const [
    {
      'name': 'Coding Club',
      'category': 'Programming & Technology',
      'members': 85,
      'icon': Icons.computer,
      'description':
          'A community for students interested in coding, '
          'programming, DSA and software development.',
    },
    {
      'name': 'Robotics Club',
      'category': 'Robotics & IoT',
      'members': 52,
      'icon': Icons.smart_toy,
      'description':
          'Explore robotics, automation, electronics and '
          'Internet of Things projects.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Clubs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: myClubs.isEmpty
          ? const Center(
              child: Text(
                'You have not joined any clubs yet.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: myClubs.length,
              itemBuilder: (context, index) {
                final club = myClubs[index];

                return Card(
                  color: Colors.white,
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 14),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.indigo.shade50,
                      child: Icon(
                        club['icon'] as IconData,
                        color: Colors.indigo,
                        size: 28,
                      ),
                    ),
                    title: Text(
                      club['name'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        '${club['category']}\n'
                        '${club['members']} Members',
                      ),
                    ),
                    isThreeLine: true,
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClubDetailsScreen(
                            clubName: club['name'] as String,
                            category: club['category'] as String,
                            description: club['description'] as String,
                            members: club['members'] as int,
                            icon: club['icon'] as IconData,
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
