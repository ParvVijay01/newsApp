import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> newsData;

  const NewsDetailsScreen({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 175, 213, 232),
        scrolledUnderElevation: 0,
        title: Text(
          newsData['title'],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsData['title'],
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              newsData['subtitle'],
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10.0),
            Image.network(
              newsData['image_url'],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${newsData['description']}",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Date: ${newsData['date']}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Author: ${newsData['Author']}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
