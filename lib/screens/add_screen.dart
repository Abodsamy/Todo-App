import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/screens/logo_screen.dart';
import 'package:todoapp/widgets/custom_card.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<TaskModel>('tasks');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LogoScreen(),
                            ),
                          );
                        },
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.black)),
                    const Text(
                      ' Add New Tasks',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff24252C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CustomCard(
                  text: 'Add Img',
                  height: 56,
                ),
                const SizedBox(height: 5),
                const Text("Task title"),
                const SizedBox(height: 10),
                CustomCard(
                  controller: titleController,
                  text: 'Enter title her',
                  height: 56,
                ),
                const SizedBox(height: 10),
                const Text("Task Description"),
                const SizedBox(height: 10),
                CustomCard(
                  controller: descController,
                  text: 'Enter Description her',
                  height: 170,
                ),
                const SizedBox(height: 10),
                const Text("priority"),
                const CustomCard(
                  text: 'Medium Priority',
                  height: 70,
                ),
                const SizedBox(height: 10),
                const Text("Deu data"),
                const CustomCard(
                  text: 'chose deu date',
                  height: 70,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5F33E1),
                    ),
                    onPressed: () {
                      box.add(
                        TaskModel(
                          title: titleController.text,
                          description: descController.text,
                          status: "New",
                          priority: "Medium",
                          date: DateTime.now().toString(),
                        ),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LogoScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Add Task',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
