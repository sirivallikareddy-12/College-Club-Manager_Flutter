
import 'package:flutter/material.dart';

class ClubDetailsScreen extends StatefulWidget {
  final String clubName;
  final String category;
  final String description;
  final int members;
  final IconData icon;

  const ClubDetailsScreen({
    super.key,
    required this.clubName,
    required this.category,
    required this.description,
    required this.members,
    required this.icon,
  });

  @override
  State<ClubDetailsScreen> createState() =>
      _ClubDetailsScreenState();
}

class _ClubDetailsScreenState extends State<ClubDetailsScreen> {
  bool isJoined = false;

  void toggleJoin() {
    setState(() {
      isJoined = !isJoined;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isJoined
              ? 'You joined ${widget.clubName}'
              : 'You left ${widget.clubName}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.indigo.shade50,
              child: Icon(
                widget.icon,
                size: 55,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.clubName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.category,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.people,
                      color: Colors.indigo,
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${widget.members} Members',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About the Club',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              child: const ListTile(
                leading: Icon(
                  Icons.event,
                  color: Colors.indigo,
                ),
                title: Text('Club Activities'),
                subtitle: Text('Check with the club for details'),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: toggleJoin,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isJoined ? Colors.grey : Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isJoined ? 'Leave Club' : 'Join Club',
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
