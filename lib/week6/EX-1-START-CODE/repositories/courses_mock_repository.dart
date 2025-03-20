import 'package:w5_observer_state/week6/EX-1-START-CODE/models/course.dart';
import 'package:w5_observer_state/week6/EX-1-START-CODE/repositories/courses_repository.dart';

class CoursesMockRepository implements CoursesRepository {
  @override
  void addCourse(Course course, CourseScore score) {
    course.addScore(score);

    
  }
  final List<Course> _courses = [
    Course(name: 'HTML'),
    Course(name: 'JAVA'),
  ];

  @override
  List<Course> getCourses() {
    return _courses;
  }
  
  
  
  

  
}