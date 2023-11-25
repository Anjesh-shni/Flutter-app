import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/features/presentation/assignment/views/assignment_view.dart';
import 'package:zunun/features/presentation/calendar/views/calendar_view.dart';
import 'package:zunun/features/presentation/home/views/home_view.dart';
import 'package:zunun/features/presentation/profile/views/profile_view.dart';
import '../../myCourse/views/my_course_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  var pageIndex = 0.obs;
  final pages = [
    HomeView(),
    MyCourseView(),
    AssignmentView(),
    CalendarView(),
    ProfileView()
  ];

  DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: AnimatedSwitcher(
            duration: const Duration(microseconds: 400000),
            child: pages[pageIndex.value]),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: 'My Course',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in_outlined),
              label: 'Assignment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grey,
          showUnselectedLabels: true,
          currentIndex: pageIndex.value,
          onTap: (index) => pageIndex.value = index,
        ),
      ),
    );
  }
}
