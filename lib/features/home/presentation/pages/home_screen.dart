import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tcw/core/constansts/asset_manger.dart';
import 'package:tcw/core/constansts/context_extensions.dart';
import 'package:tcw/core/theme/app_colors.dart';
import 'package:tcw/features/courses/data/models/course_model.dart';
import 'package:tcw/features/courses/presentation/widgets/course_list.dart';
import 'package:tcw/features/courses/presentation/widgets/courses_vertical_list.dart';
import 'package:tcw/features/home/presentation/widgets/search_widget.dart';
import 'package:tcw/features/home/presentation/widgets/side_menu_widget.dart';
import 'package:tcw/features/home/presentation/widgets/state_item_widget.dart';
import 'package:tcw/features/home/presentation/widgets/user_header_widget.dart';
import 'package:tcw/routes/routes_names.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> events = [
    {
      'title':
          'Join our live event to master time management and achieve peak productivity!',
      'date': 'Monday, 4 Mar 2025',
      'time': '02.00 - 03.30 PM',
      'image': AssetManger.container,
    },
    {
      'title': 'Boost your leadership skills with expert guidance.',
      'date': 'Tuesday, 5 Mar 2025',
      'time': '03.00 - 04.00 PM',
      'image': AssetManger.ex_1,
    },
    {
      'title': 'Unlock your potential with our exclusive workshop!',
      'date': 'Wednesday, 6 Mar 2025',
      'time': '01.00 - 02.30 PM',
      'image': AssetManger.ex_2,
    },
    {
      'title': 'Enhance your skills with our expert-led training session.',
      'date': 'Thursday, 7 Mar 2025',
      'time': '11.00 - 12.30 PM',
      'image': AssetManger.container,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      drawer: SideMenu(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.propHeight(32)),
              UserHeader(context: context,
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              SizedBox(height: context.propHeight(24)),
              _buildStats(),
              SizedBox(height: context.propHeight(24)),
              SearchWidget(context: context),
              SizedBox(height: context.propHeight(24)),
              _buildEventSlider(),
              SizedBox(height: context.propHeight(16)),
              _buildContinueWatching(),
              SizedBox(height: context.propHeight(24)),
              SizedBox(height: context.propHeight(10)),
              CourseListHorizontal(
                courses: [
                  CourseModel(
                    title: 'Lesson 6',
                    imageUrl: AssetManger.ex_1,
                    coachName: 'Ahmed Mohamed',
                    coachImageUrl: AssetManger.ex_2,
                    price: 0,
                    lessons: 12,
                    duration: '2h 20m',
                    available: 10,
                    coachRole: 'Senior Developer',
                  ),
                  CourseModel(
                    title: 'Lesson 7',
                    imageUrl: AssetManger.container,
                    coachName: 'Sara Ali',
                    coachImageUrl: AssetManger.ex_1,
                    price: 0,
                    lessons: 15,
                    duration: '1h 50m',
                    available: 5,
                    coachRole: 'Software Engineer',
                  ),
                  // Add more if needed
                ],
              ),
              SizedBox(height: context.propHeight(24)),
              _buildMyCourses(),
              SizedBox(height: context.propHeight(10)),
              CourseListScreen()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StateItem(
            context: context,
            icon: AssetManger.notification,
            count: '1',
            label: 'Notification',
            onTab: () {
              Modular.to.pushNamed(AppRoutes.notificationScreen);
            }),
        StateItem(
            context: context,
            icon: AssetManger.point,
            count: '100',
            label: 'Points',
            onTab: () {
              Modular.to.pushNamed(
                AppRoutes.pointsRewardsScreen,
              );
            }),
        StateItem(
            context: context,
            icon: AssetManger.rewards,
            count: '2',
            label: 'Rewards',
            onTab: () {
              Modular.to.pushNamed(
                AppRoutes.pointsRewardsScreen,
                arguments: false,
              );
            }),
      ],
    );
  }

  Widget _buildEventSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.propHeight(230),
          child: PageView.builder(
            controller: _pageController,
            itemCount: events.length,
            onPageChanged: (index) {
              setState(() {});
            },
            itemBuilder: (context, index) {
              final event = events[index];
              return Container(
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(event['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        context.propHeight(12),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                color: Colors.white, size: 14),
                            SizedBox(width: context.propWidth(4)),
                            Text(event['date']!,
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: Colors.white)),
                            SizedBox(width: context.propWidth(12)),
                            const Icon(Icons.access_time,
                                color: Colors.white, size: 14),
                            SizedBox(width: context.propWidth(4)),
                            Text(event['time']!,
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          event['title']!,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('join now',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(Icons.play_arrow_rounded,
                                    size: 12, color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: context.propHeight(12)),
        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: events.length,
            effect: WormEffect(
              dotColor: Colors.grey.shade300,
              activeDotColor: AppColors.primaryColor,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueWatching() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Continue Watching',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
        CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildMyCourses() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Your Courses',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
        Text('See All',
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor)),
      ],
    );
  }
}
