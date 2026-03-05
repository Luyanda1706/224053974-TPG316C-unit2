import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/student_viewmodel.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<StudentViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Info Card"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Student Name: ${viewModel.studentName}",
              style: const TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 10),

            Text(
              "Favourite Subject: ${viewModel.currentSubject}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              "Grade: ${viewModel.grade}%",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.read<StudentViewModel>().changeSubject();
              },
              child: const Text("Change Subject"),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: () {
                    context.read<StudentViewModel>().decreaseGrade();
                  },
                  child: const Text("-"),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    context.read<StudentViewModel>().increaseGrade();
                  },
                  child: const Text("+"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}