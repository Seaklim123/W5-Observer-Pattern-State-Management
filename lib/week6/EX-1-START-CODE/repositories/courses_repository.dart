import 'package:w5_observer_state/week6/EX-1-START-CODE/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();
  void addScore(Course course, CourseScore score);

  void addCourse(Course course, CourseScore score) {}
}
