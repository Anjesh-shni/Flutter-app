import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:zunun/utils/constants/colors.dart';

import '../../../data/repository/all_course_list_repository.dart';
import '../../../domain/model/response_model/response_model.dart';
import '../model/mark_as_complete.dart';
import '../model/student_content_details.dart';

class WatchLessonController extends GetxController {
  late VideoPlayerController videoPlayerController;
  late AudioPlayer audioPlayer;

  late ChewieController chewieController;
  final CourseListRepo courseListRepo;

  WatchLessonController({required this.courseListRepo});

  var contentIsLoading = true.obs;
  var markAsCompletebool = true.obs;
  var studentContentDetails = StudentContentDetails().obs;
  var markAsComplete = MarkAsComplete().obs;
  List<double> playbackSpeeds = [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2];
  String? url;

  //Video
  void playVideo(String videoUrl) async {
    videoPlayerController = VideoPlayerController.network(videoUrl.toString());
    chewieController = ChewieController(
      materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.white,
          bufferedColor: AppColors.grey,
          handleColor: AppColors.white),
      progressIndicatorDelay: const Duration(seconds: 2),
      videoPlayerController: videoPlayerController,
      aspectRatio: Adaptive.w(100) / Adaptive.h(24),
      autoPlay: true,
      looping: true,
      showOptions: false,
      showControls: true,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: true,
      zoomAndPan: true,
    );
    chewieController.addListener(() {
      if (!chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
    });
  }

  void videoPause() {
    videoPlayerController.pause();
  }

  void videoPlay() {
    videoPlayerController.play();
  }

  //for Audio
  void plauAudio(String url) async {
    audioPlayer = AudioPlayer();
    await audioPlayer.play(UrlSource(url));
  }

  void pauseAudio() async {
    audioPlayer.pause();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onClose();
  }

  Future<void> getStudentContentsDetails(String courseContentID) async {
    contentIsLoading.value = true;
    Response response =
        await courseListRepo.getStudentContentsDetails(courseContentID);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("STUDENT CONTENT DETAILS:::::::::::::::::::::::${response.body}");

      StudentContentDetails studentContent =
          StudentContentDetails.fromJson(response.body);
      studentContentDetails.value = StudentContentDetails(
        success: studentContent.success,
        data: studentContent.data,
      );
      //this is more like setState
      contentIsLoading.value = false;
      update();
    } else {
      // isAllCourseLoading.value = true;
      print("STUDENT CONTENT DETAILS ERROR::::::::::::::::::::::::::" +
          response.statusText!.toString());
    }
  }

  ///
  ///
  Future<ResponseModel> markAsCompleted(String contentID) async {
    markAsCompletebool.value = true;
    update();
    Response response = await courseListRepo.markAsCompleted(contentID);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      print("Mark as complete:::::::" + response.statusText.toString());

      MarkAsComplete markComplete = MarkAsComplete.fromJson(response.body);
      markAsComplete.value = MarkAsComplete(
        contentID: markComplete.contentID,
      );

      responseModel = ResponseModel(true, response.body.toString());
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    markAsCompletebool.value = false;
    update();
    return responseModel;
  }
}
