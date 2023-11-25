class AppConstants {
  const AppConstants._();

  ///APP NAME
  static const String APP_NAME = "Zunun";
  static const int APP_VERSION = 1;

  ///BASE URL AND SUBDOMAIN
  static const String BASE_URL = "https://backend.unentrance.com";
  static const String LOCAL_URL = "http://192.168.1.102:8005";
  static const String TUNNEL_URL = "https://uxg3kd.tunnel.pyjam.as/";
  static const String SUB_DOMAIN = "kathmandu";

  ///For AUTHENTICATION
  static const String TOKEN = "";
  static const String REFRES_TOKEN = "/auth/v1/token/access";
  static const String LOGIN_URI = "/auth/v1/account/login";
  static const String USER_INFO = "/api/v1/user/list";
  static const String LOGOUT = "/auth/v1/account/logout/";
  static const String CREATE_ACCESS = "/auth/v1/token/access/";

  //Couse End point
  static const String COURSE_LIST_URI = "";

  ///For login credentials
  static const String EMAIL = "";
  static const String PASSWORD = "";

  //UserInformation
  static const String id = "id";
  static const String firstName = "firstName";
  static const String surname = "surname";
  static const String email = "email";
  static const String username = "username";
  static const String homePhone = "homePhone";
  static const String cellular = "cellular";
  static const String dob = "dob";
  static const String gender = "gender";
  static const String birthplace = "birthplace";

  //Assignment
  static const String LIST_BY_STUDENT = "/api/v1/assignment/student-list/?";
  static const String LIST_BY_STUDENT_ID = "";
  static const String UPDATE_ASSIGNMENT = "";
  static const String UPLOAD_ASSIGNMENT = "/api/v1/assignment/submit/";
  static const String DELETE_ASSIGNMENT = "/api/v1/assignment/delete-file/";
  static const String UPLOAD_FILE = "/api/v1/file/upload/";

  //
  static const String ASSIGNMENT_DETAILS = "/api/v1/assignment/detail/";
  static const String ADD_COMMENT = "/api/v1/assignment/comment/";

  //Event section
  static const String CREATE_EVENT = "/api/v1/event/create/";
  static const String EVENT_LIST = "/api/v1/event/list";
  static const String ASSIGN_EVENT_USER = "/api/v1/event/assigned/";
  static const String UPDATE_EVENT = "/api/v1/event/update/";
  static const String DELETE_EVENT = "/api/v1/event/delete/";
  static const String AKNOWLEDGE = "/api/v1/event/acknowledge/";

  //All Course list and details
  static const String ALL_COURSE_LIST = "/api/v1/course/list/";
  static const String STUDENT_COURSE_DETAILS =
      "/api/v1/course/student-details/";

  static const String STUDENT_CONTENT_DETAILS =
      "/api/v1/content/student-details/";

  static const String MARKED_AS_A_COMPLETE = "/api/v1/content/complete/";
}
