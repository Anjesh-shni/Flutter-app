import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zunun/app/reusable_widget/my_snackbar.dart';
import 'package:zunun/features/data/repository/create_event_repo.dart';
import 'package:zunun/features/domain/model/response_model/response_model.dart';
import '../model/assign_event_for_user.dart';
import '../model/create_event_model.dart';
import '../model/event_list_model.dart';

//Creaete event
class CreateEventController extends GetxController {
  final CreateEventRepo createEventRepo;
  final localStorage = GetStorage();

  CreateEventController({required this.createEventRepo});

  ///obs variable
  var isLoading = true.obs;
  var isLoadingCreate = true.obs;
  var isLoadingdelete = true.obs;
  var isLoadingEdit = true.obs;
  var isLoadingList = true.obs;

  var eventDate = [].obs;
  var createEventData = CreateEventModel().obs;
  var eventList = EventList().obs;
  var eventAssignToUser = EventAssignForUser().obs;

  @override
  void onInit() async {
    super.onInit();
    getEventList();
    // getEventAssignToUserList();
    print("Event controller is beign called:::::::::::::::::::::ONINIT METHOD");
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 5), () {
      print(
          "This is OnReady method is being called from AssignmentController:::::::");
      getEventList();
      eventList.refresh();
    });
  }

  ///create event
  Future<ResponseModel> createEVent(CreateEventModel createEventModel) async {
    isLoadingCreate.value = false;
    update();
    Response response = await createEventRepo.createEvent(createEventModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("CREATE EVENT BY STUDENT CALLED:::::::::::::::::" +
          response.statusText!.toString());
      //Adding data to variable

      CreateEventModel createEventModel =
          CreateEventModel.fromJson(response.body);
      createEventData.value = CreateEventModel(
        title: createEventModel.title,
        description: createEventModel.description,
        place: createEventModel.place,
        type: createEventModel.type,
        isRecurring: createEventModel.isRecurring,
        recurType: createEventModel.recurType,
        duration: createEventModel.duration,
        startDate: createEventModel.startDate,
        endDate: createEventModel.endDate,
        status: createEventModel.status,
      );
      localStorage.write("createDate", createEventModel.startDate.toString());
      responseModel = ResponseModel(true, response.body.toString());
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
      cuastomSnackBAr(response.statusText.toString());
    }
    isLoadingCreate.value = true;
    update();
    return responseModel;
  }

  //Update event
  Future<ResponseModel> updateEVent(
      CreateEventModel createEventModel, String id) async {
    isLoadingEdit.value = false;
    update();
    Response response = await createEventRepo.updateEvent(createEventModel, id);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "EVENT UPDATE RESPONSE:::::::::::::::::" + response.body.toString());
      //Adding data to variable

      CreateEventModel createEventModel =
          CreateEventModel.fromJson(response.body);
      createEventData.value = CreateEventModel(
        title: createEventModel.title,
        description: createEventModel.description,
        place: createEventModel.place,
        type: createEventModel.type,
        isRecurring: createEventModel.isRecurring,
        recurType: createEventModel.recurType,
        duration: createEventModel.duration,
        startDate: createEventModel.startDate,
        endDate: createEventModel.endDate,
        status: createEventModel.status,
      );
      // isLoadingEdit.value = false;

      responseModel = ResponseModel(true, response.body.toString());
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
    }
    isLoadingEdit.value = true;
    update();
    return responseModel;
  }

  //Delete even
  Future<ResponseModel> deleteEVent(String id) async {
    isLoadingdelete.value = false;
    update();
    Response response = await createEventRepo.deleteEvent(id);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("DELET EVENT RESPONSE:::::::::::::::::" + response.body.toString());
      //Adding data to variable

      CreateEventModel createEventModel =
          CreateEventModel.fromJson(response.body);
      createEventData.value = CreateEventModel(
        title: createEventModel.title,
        description: createEventModel.description,
        place: createEventModel.place,
        type: createEventModel.type,
        isRecurring: createEventModel.isRecurring,
        recurType: createEventModel.recurType,
        duration: createEventModel.duration,
        startDate: createEventModel.startDate,
        endDate: createEventModel.endDate,
        status: createEventModel.status,
      );
      // isLoadingdelete.value = false;

      responseModel = ResponseModel(true, response.body.toString());
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
    }
    isLoadingdelete.value = true;
    update();
    return responseModel;
  }

  //Getting event list
  Future<void> getEventList() async {
    Response response = await createEventRepo.getEventList();
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("EVENT LIST CREATED BY STUDENT:::::::" + response.body.toString());

      EventList eventlistData = EventList.fromJson(response.body);

      eventList.value = EventList(
        data: eventlistData.data,
        success: eventlistData.success,
      );
      isLoadingList.value = false;
      update();
    } else {
      isLoadingList.value = true;
    }
  }
}
