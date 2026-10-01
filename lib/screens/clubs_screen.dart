
import 'package:flutter/material.dart';
import 'club_details_screen.dart';

class ClubsScreen extends StatelessWidget {
  const ClubsScreen({super.key});

  final List<Map<String, dynamic>> clubs = const [
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
    {
      'name': 'Photography Club',
      'category': 'Photography & Media',
      'members': 40,
      'icon': Icons.camera_alt,
      'description':
          'Develop photography skills, creativity and '
          'visual storytelling.',
    },
    {
      'name': 'Arts Club',
      'category': 'Art & Creativity',
      'members': 35,
      'icon': Icons.palette,
      'description':
          'A space for students to express their creativity '
          'through art and design.',
    },
    {
      'name': 'Sports Club',
      'category': 'Sports & Fitness',
      'members': 60,
      'icon': Icons.sports_basketball,
      'description':
          'Encouraging teamwork, fitness and participation '
          'in sports activities.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'College Clubs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: clubs.length,
        itemBuilder: (context, index) {
          final club = clubs[index];

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
                  club['icon'] as IconData,
                  color: Colors.indigo,
                  size: 28,
                ),
              ),
              title: Text(
                club['name'] as String,
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
                    Text(club['category'] as String),
                    const SizedBox(height: 5),
                    Text('${club['members']} Members'),
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
