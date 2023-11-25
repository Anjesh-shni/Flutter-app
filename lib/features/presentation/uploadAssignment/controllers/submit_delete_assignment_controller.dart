import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:zunun/app/reusable_widget/snack_bar.dart';
import 'package:zunun/features/data/repository/upload_assignment_repo.dart';
import 'package:zunun/features/domain/model/response_model/response_model.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';

import '../model/file_upload.dart';
import '../model/submit_assign_model.dart';

class UploadAssignmentController extends GetxController {
  final UploadAssignmentRepo uploadAssignmentRepo;
  final localStorage = GetStorage();

  UploadAssignmentController({required this.uploadAssignmentRepo});

  var isLoadingOnSubmit = true.obs;
  var isLoadingOnDelete = true.obs;
  var isFileLoading = true.obs;
  var uploadAssignmentDataStatus = UploadAssignment().obs;
  var fileUpload = FileUpload().obs;
  final uploadedFile = Rx<File?>(null);
  var filesUpload;

  @override
  onInit() {
    print("On init called");
    super.onInit();
  }

  //Upload assignment
  Future<ResponseModel> submitAssignment(
    String submissionText,
    AssignmentFiles files,
    String id,
  ) async {
    isLoadingOnSubmit.value = true;
    update();
    Response response = await uploadAssignmentRepo.uploadAssignment(
      submissionText,
      files,
      id,
    );
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      print("Submittting assignment:::::::${response.body}");

      UploadAssignment uploadAssignment =
          UploadAssignment.fromJson(response.body);

      uploadAssignmentDataStatus.value = UploadAssignment(
        submissionText: uploadAssignment.submissionText,
        assignmentFiles: filesUpload,
      );

      isLoadingOnSubmit.value = false;
      responseModel = ResponseModel(true, response.body.toString());
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }

  //Delete assignment
  Future<ResponseModel> deleteAssignment(String id) async {
    isLoadingOnDelete.value = true;
    update();
    Response response = await uploadAssignmentRepo.deleteAssignment(id);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      print(
          "Submitted Assignment deleted==================:::::::${response.body}");

      responseModel = ResponseModel(true, response.body.toString());
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
    }
    isLoadingOnDelete.value = false;
    update();
    return responseModel;
  }

  //File upload
  Future<void> uploadFile(File imageFile) async {
    isFileLoading.value = true;
    var request = http.MultipartRequest('POST',
        Uri.parse("${AppConstants.LOCAL_URL}${AppConstants.UPLOAD_FILE}"));
    request.headers.addAll(
      {
        "subdomain": "ayata",
        "Authorization": 'Bearer ' + localStorage.read(AppConstants.TOKEN),
      },
    );

    // Read the image file
    final mediaContentType = getContentType(imageFile.path);
    final file = await http.MultipartFile.fromPath("file", imageFile.path,
        contentType: MediaType.parse(mediaContentType));

    // Add the image file to the request first
    request.files.add(file);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final jsonResponse = json.decode(responseData.body);
        filesUpload = jsonResponse;

        final uploadedFilePath = jsonResponse["data"]["url"];
        if (uploadedFilePath != null) {
          uploadedFile.value = File(uploadedFilePath);
        }

        FileUpload fileUploadData = FileUpload.fromJson(jsonResponse);
        fileUpload.value = FileUpload(
          success: fileUploadData.success,
          data: fileUploadData.data,
        );
        isFileLoading.value = false;
        print("File upload response:::::::::::::::::::$jsonResponse");
      } else {
        CustomSnackBar("Unexpected error occurs");
      }
    } catch (e) {
      CustomSnackBar("Exception while uploading image: $e");
    }
  }

  //file type choose
  String getContentType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
        return 'image/jpg';
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'pdf':
        return 'assignment/pdf';
      case 'word':
        return 'assignment/word';
      case 'excel':
        return 'assignment/excel';
      default:
        return 'application/octet-stream';
    }
  }
}
