import 'package:get/get.dart';
import 'package:zunun/features/presentation/assignment/binding/binding.dart';
import 'package:zunun/features/presentation/create_event/binding/create_event_binding.dart';
import 'package:zunun/features/presentation/login/bindings/login_binding.dart';
import 'package:zunun/features/presentation/profile/bindings/profile_binding.dart';
import '../../features/presentation/allBlogs/bindings/all_blogs_binding.dart';
import '../../features/presentation/allBlogs/views/all_blogs_view.dart';
import '../../features/presentation/assignment/views/assignment_view.dart';
import '../../features/presentation/blogDetail/bindings/blog_detail_binding.dart';
import '../../features/presentation/blogDetail/views/blog_detail_view.dart';
import '../../features/presentation/calendar/bindings/calendar_binding.dart';
import '../../features/presentation/calendar/views/calendar_view.dart';
import '../../features/presentation/chapters/bindings/chapters_binding.dart';
import '../../features/presentation/chapters/views/chapters_view.dart';
import '../../features/presentation/create_event/view/create_event_V.dart';
import '../../features/presentation/dashboard/bindings/dashboard_binding.dart';
import '../../features/presentation/dashboard/views/dashboard_view.dart';
import '../../features/presentation/home/bindings/home_binding.dart';
import '../../features/presentation/home/views/home_view.dart';
import '../../features/presentation/login/views/login_view.dart';
import '../../features/presentation/myCourse/bindings/my_course_binding.dart';
import '../../features/presentation/myCourse/views/my_course_view.dart';
import '../../features/presentation/notification/bindings/notification_binding.dart';
import '../../features/presentation/notification/views/notification_view.dart';
import '../../features/presentation/onboardingscreen/bindings/onboardingscreen_binding.dart';
import '../../features/presentation/onboardingscreen/views/onboardingscreen_view.dart';
import '../../features/presentation/postSubmission/bindings/post_submission_binding.dart';
import '../../features/presentation/postSubmission/views/post_submission_view.dart';
import '../../features/presentation/profile/views/profile_view.dart';
import '../../features/presentation/showSearch/bindings/show_search_binding.dart';
import '../../features/presentation/showSearch/views/show_search_view.dart';
import '../../features/presentation/splashscreen/bindings/splashscreen_binding.dart';
import '../../features/presentation/splashscreen/views/splashscreen_view.dart';
import '../../features/presentation/uploadAssignment/bindings/upload_assignment_binding.dart';
import '../../features/presentation/uploadAssignment/views/upload_assignment_view.dart';
import '../../features/presentation/watchLesson/bindings/watch_lesson_binding.dart';
import '../../features/presentation/watchLesson/views/watch_lesson_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDINGSCREEN,
      page: () => OnboardingscreenView(),
      binding: OnboardingscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.MY_COURSE,
      page: () => MyCourseView(),
      binding: MyCourseBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT,
      page: () => AssignmentView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () =>  CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAPTERS,
      page: () =>  ChaptersView(),
      binding: ChaptersBinding(),
    ),
    GetPage(
      name: _Paths.WATCH_LESSON,
      page: () => WatchLessonView(),
      binding: WatchLessonBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_ASSIGNMENT,
      page: () => UploadAssignmentView(),
      binding: UploadAssignmentBinding(),
    ),
    GetPage(
      name: _Paths.POST_SUBMISSION,
      page: () => PostSubmissionView(),
      binding: PostSubmissionBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_SEARCH,
      page: () => const ShowSearchView(),
      binding: ShowSearchBinding(),
    ),
    GetPage(
      name: _Paths.ALL_BLOGS,
      page: () => const AllBlogsView(),
      binding: AllBlogsBinding(),
    ),
    GetPage(
      name: _Paths.BLOG_DETAIL,
      page: () => const BlogDetailView(),
      binding: BlogDetailBinding(),
    ),
    GetPage(
      name: _Paths.CREAETE_EVENT,
      page: () =>  CreateEventByStudnet(),
      binding: EventBinding(),
    ),
  ];
}
