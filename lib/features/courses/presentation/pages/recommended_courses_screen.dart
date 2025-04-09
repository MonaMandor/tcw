import 'package:flutter/material.dart';
import 'package:tcw/core/constansts/asset_manger.dart';
import 'package:tcw/features/courses/presentation/pages/course_model.dart';

import '../widgets/course_card.dart';



class RecommendedCoursesScreen extends StatelessWidget {
 final List<CourseModel> courses = [
    CourseModel(
      title: "Flutter Development",
      imageUrl: AssetManger.ex_1,
      price: 199.99,
      lessons: 20,
      duration: "10 hours",
      available: 1,
      coachName: "John Doe",
      coachRole: "Senior Developer",
      coachImageUrl: AssetManger.ex_2,

    ),
    CourseModel(
      title: "Dart Programming",
      imageUrl: AssetManger.ex_2,
      price: 149.99,
      lessons: 15,
      duration: "8 hours",
      available: 1,
      coachName: "Jane Smith",
      coachRole: "Software Engineer",
      coachImageUrl: AssetManger.ex_1,

    ),
    // Add more courses as needed
  ];


   RecommendedCoursesScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Recommended\nCourses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search your course here...',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return CourseCard(course: courses[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF4B248B),
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Icon(Icons.smart_toy_outlined, color: Colors.white),
      ),
    );
  }
}
