import 'package:flutter/material.dart';
import 'package:tcw/core/constansts/context_extensions.dart';
import 'package:tcw/core/theme/app_colors.dart';
import 'package:tcw/features/courses/presentation/pages/course_model.dart';

class WatchingCourseCard extends StatelessWidget {
  final CourseModel course;

  // ignore: use_super_parameters
  const WatchingCourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.propWidth(260),
     // margin: const EdgeInsets.symmetric(horizontal: 8,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(
                left: context.propWidth(12),
                right: context.propWidth(12),
                top: context.propHeight(12),
                bottom: context.propHeight(8),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    course.imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
                left: context.propWidth(12),
                right: context.propWidth(12),
                top: context.propHeight(8),
          
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lap and duration row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5EEDC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Lap 1',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 16, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text(course.duration,
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                 SizedBox(height: context.propHeight(8)),
                Text(
                  course.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                 SizedBox(height: context.propHeight(8)),
                LinearProgressIndicator(
                  value: 0.4,
                  backgroundColor: Colors.grey.shade300,
                  color: AppColors.primaryColor,
                ),
                 SizedBox(height: context.propHeight(12)),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(course.coachImageUrl),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.coachName,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          'Coach',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
