
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  final String eventName;
  final String date;
  final String time;
  final String location;
  final String description;
  final IconData icon;

  const EventDetailsScreen({
    super.key,
    required this.eventName,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.icon,
  });

  @override
  State<EventDetailsScreen> createState() =>
      _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  bool isRegistered = false;

  void toggleRegistration() {
    setState(() {
      isRegistered = !isRegistered;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isRegistered
              ? 'Successfully registered for ${widget.eventName}'
              : 'Registration cancelled',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.indigo.shade50,
                child: Icon(
                  widget.icon,
                  size: 55,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                widget.eventName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_month,
                      color: Colors.indigo,
                    ),
                    title: const Text('Date'),
                    subtitle: Text(widget.date),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(
                      Icons.access_time,
                      color: Colors.indigo,
                    ),
                    title: const Text('Time'),
                    subtitle: Text(widget.time),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(
                      Icons.location_on,
                      color: Colors.indigo,
                    ),
                    title: const Text('Location'),
                    subtitle: Text(widget.location),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'About the Event',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: toggleRegistration,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isRegistered ? Colors.grey : Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isRegistered ? 'Cancel Registration' : 'Register',
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
