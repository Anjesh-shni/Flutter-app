import 'package:get/get.dart';
import 'package:zunun/features/presentation/dashboard/views/dashboard_view.dart';
import 'package:zunun/localization/lang_change.dart';

import '../../features/presentation/allBlogs/views/all_blogs_view.dart';
import '../../features/presentation/assignment/views/assignment_view.dart';
import '../../features/presentation/blogDetail/views/blog_detail_view.dart';
import '../../features/presentation/calendar/views/calendar_view.dart';
import '../../features/presentation/chapters/views/chapters_view.dart';
import '../../features/presentation/home/views/home_view.dart';
import '../../features/presentation/login/views/login_view.dart';
import '../../features/presentation/myCourse/views/my_course_view.dart';
import '../../features/presentation/notification/views/notification_view.dart';
import '../../features/presentation/onboardingscreen/views/onboardingscreen_view.dart';
import '../../features/presentation/postSubmission/views/post_submission_view.dart';
import '../../features/presentation/profile/views/profile_view.dart';
import '../../features/presentation/showSearch/views/show_search_view.dart';
import '../../features/presentation/splashscreen/views/splashscreen_view.dart';
import '../../features/presentation/uploadAssignment/views/upload_assignment_view.dart';
import '../../features/presentation/watchLesson/views/watch_lesson_view.dart';

class RouteHelper {
  RouteHelper._();
  static const String home = '/home';
  static const String splashscreen = '/splashscreen';
  static const String onboardingscreen = '/onboardingscreen';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String myCourse = '/my-course';
  static const String assignment = '/assignment';
  static const String calendar = '/calendar';
  static const String profile = '/profile';
  static const String chapters = '/chapters';
  static const String watchLesson = '/watch-lesson';
  static const String uploadAssignment = '/upload-assignment';
  static const String postSubmission = '/post-submission';
  static const String notification = '/notification';
  static const String blogDetail = '/blog-detail';
  static const String showSearch = '/show-search';
  static const String allBlogs = '/all-blogs';
  static const String language = '/langauge';

  static String getHome() => "$home";
  static String getsplashscreen() => "$splashscreen";
  static String getonboardingscreen() => "$onboardingscreen";
  static String getlogin() => "$login";
  static String getdashboard() => "$dashboard";
  static String getmyCourse() => "$myCourse";
  static String getassignment() => "$assignment";
  static String getcalendar() => "$calendar";
  static String getprofile() => "$profile";
  static String getchapters() => "$chapters";
  static String gewatchLesson() => "$watchLesson";
  static String getuploadAssignment() => "$uploadAssignment";
  static String getpostSubmission() => "$postSubmission";
  static String getnotification() => "$notification";
  static String getblogDetail() => "$blogDetail";
  static String getshowSearch() => "$showSearch";
  static String getallBlogs() => "$allBlogs";
  static String getLanguagePage() => "$language";

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: splashscreen,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: onboardingscreen,
      page: () => OnboardingscreenView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: login,
      page: () => LoginView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: myCourse,
      page: () => MyCourseView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: assignment,
      page: () => AssignmentView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: calendar,
      page: () => CalendarView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: profile,
      page: () => ProfileView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: chapters,
      page: () =>  ChaptersView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: watchLesson,
      page: () => WatchLessonView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: uploadAssignment,
      page: () => UploadAssignmentView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: postSubmission,
      page: () => PostSubmissionView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: notification,
      page: () => const NotificationView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: showSearch,
      page: () => const ShowSearchView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: allBlogs,
      page: () => const AllBlogsView(),
    ),
    GetPage(
      name: blogDetail,
      page: () => const BlogDetailView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: language,
      page: () => const LangChange(),
      transition: Transition.fadeIn,
    ),
  ];
}
