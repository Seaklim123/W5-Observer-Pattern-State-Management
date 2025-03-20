import 'package:flutter/material.dart';
import 'package:w5_observer_state/week6/EX-1-START-CODE/models/course.dart';
import 'package:w5_observer_state/week6/EX-1-START-CODE/repositories/courses_repository.dart';

class CoursesProvider extends  ChangeNotifier {
  final CoursesRepository _repository;

  CoursesProvider(this._repository);

  List<Course> get courses => _repository.getCourses();

  Course getCourseFor(String courseId) {
    return courses.firstWhere((course) => course.name == courseId);
  }

  void addScore(String courseId, CourseScore score) {
    final course = getCourseFor(courseId);
    _repository.addCourse(course, score);
    notifyListeners();
  }
}

