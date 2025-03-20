import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w5_observer_state/week6/EX-1-START-CODE/providers/courses_provider.dart';
import 'package:w5_observer_state/week6/EX-1-START-CODE/repositories/courses_mock_repository.dart';

import 'screens/course_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CoursesProvider(CoursesMockRepository()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CourseListScreen(),
      ),
    );
  }
}

