// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:zunun/features/data/repository/post_upload_repo.dart';
import 'package:zunun/features/domain/model/response_model/response_model.dart';
import '../model/add_comment_model.dart';

class PostSubmissionController extends GetxController {
  final PostUpLoadRepo postUpLoadRepo;
  PostSubmissionController({required this.postUpLoadRepo});

  var isLoading = true.obs;
  var addComments = Addcomment().obs;

  @override
  void onInit() {
    super.onInit();
  }

  //Upload assignment
  Future<ResponseModel> addCommemt(String addCommemt, String id) async {
    isLoading.value = false;
    update();
    Response response = await postUpLoadRepo.uploadAssign(addCommemt, id);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      print("Assignment Upload  response:::::::" + response.body.toString());

      Addcomment commentAdded = Addcomment.fromJson(response.body);

      addComments.value = Addcomment(
        success: commentAdded.success,
      );
       
      responseModel = ResponseModel(true, response.body.toString());
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
    }
     isLoading.value = true;
    update();
    return responseModel;
  }
}
