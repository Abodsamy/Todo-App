import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/task_model.dart';

class DetailsScreen extends StatelessWidget {
  final TaskModel task;
  final int index;

  const DetailsScreen({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskBox = Hive.box<TaskModel>('tasks');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              task.title = task.title + " (Edited)";
              task.save();
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              task.delete();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/image 1.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text('Title: ${task.title}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text('Description: ${task.description}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text('Status: ${task.status}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text('Priority: ${task.priority}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text('Date: ${task.date}', style: const TextStyle(fontSize: 16)),
            Image.asset(
              "assets/images/image 3 (1).png",
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
