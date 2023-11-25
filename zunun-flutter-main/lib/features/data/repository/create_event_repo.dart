import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/data/api/api_client.dart';
import 'package:zunun/features/presentation/create_event/model/create_event_model.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';

class CreateEventRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CreateEventRepo({required this.apiClient, required this.sharedPreferences});

  //This method will be calling from controller to create event by student
  Future<Response> createEvent(CreateEventModel createEventModel) async {
    return await apiClient.postData(
      AppConstants.CREATE_EVENT,
      createEventModel.toJson(),
    );
  }

  //update event
  Future<Response> updateEvent(
      CreateEventModel createEventModel, String id) async {
    return await apiClient.updateData(
      AppConstants.UPDATE_EVENT + id,
      createEventModel.toJson(),
    );
  }

  //delete event
  Future<Response> deleteEvent(String id) async {
    return await apiClient.deleteData(
      AppConstants.DELETE_EVENT + id,
    );
  }

  //delete event
  Future<Response> aknowledgeEvent(String date) async {
    return await apiClient.updateData(AppConstants.AKNOWLEDGE, {"date": date});
  }

  //EventList
  Future<Response> getEventList() async {
    return await apiClient.getData(AppConstants.EVENT_LIST);
  }

  //Event assign to user
  Future<Response> getEventAssignToUserList() async {
    return await apiClient.getData(AppConstants.ASSIGN_EVENT_USER);
  }
}
