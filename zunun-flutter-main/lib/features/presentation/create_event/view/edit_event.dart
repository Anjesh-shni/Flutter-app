import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zunun/app/reusable_widget/custom_loader.dart';
import 'package:zunun/app/widgets/big_text.dart';
import 'package:zunun/app/reusable_widget/my_snackbar.dart';
import 'package:zunun/app/widgets/small_text.dart';
import 'package:zunun/features/presentation/create_event/controller/create_event_controller.dart';
import '../../../../config/extension/dateformater.dart';
import '../../../../app/widgets/textFiel.dart';
import '../model/create_event_model.dart';

// ignore: must_be_immutable
class EditEventDataa extends GetView<CreateEventController> {
  @override
  var controller = Get.put(CreateEventController(createEventRepo: Get.find()));
  static List<String> statusList = <String>["Public", "Private"];
  var dropdownValue = statusList.first.obs;

  var startSelectedDate = DateTime.now().obs;
  var endSelectedDate = DateTime.now().obs;

  String title2 = Get.arguments[0];
  String description2 = Get.arguments[1];
  String place2 = Get.arguments[2];
  String startDate2 = Get.arguments[3];
  String endDate2 = Get.arguments[4];
  String status2 = Get.arguments[5];
  String id = Get.arguments[6];

  EditEventDataa({super.key});

  final title = TextEditingController();
  final discription = TextEditingController();
  final place = TextEditingController();
  final startDate = TextEditingController();
  final status = TextEditingController();
  final endDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Edit Event with ID=======================" + id.toString());
    void showStartdatepicker() async {
      DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: startSelectedDate.value,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
      );
      if (pickDate != null && pickDate != startSelectedDate.value) {
        startSelectedDate.value = pickDate;
      }
    }

    void showEnddatepicker() async {
      DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: endSelectedDate.value,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
      );
      if (pickDate != null && pickDate != endSelectedDate.value) {
        endSelectedDate.value = pickDate;
      }
    }

    String type = "PRIVATE";
    String recurType = "month";

    title.text = title2;
    discription.text = description2;
    place.text = place2;
    startDate.text = convertUtcDateString(startDate2.toString());
    endDate.text = convertUtcDateString(endDate2.toString());
    status.text = status2;

    void _deleteEvent(CreateEventController controller) {
      if (id.isEmpty) {
        cuastomSnackBAr("Title can't be empty", title: "Title");
      } else {
        controller.deleteEVent(id).then((status) {
          if (status.isSuccess) {
            Get.back();
            controller.getEventList();
            Get.snackbar("Deleted", "Your event is successfully");
          } else {
            cuastomSnackBAr(status.message);
          }
        });
      }
    }

    void _editEvent(CreateEventController controller) {
      if (title.text.isEmpty) {
        cuastomSnackBAr("Title can't be empty", title: "Title");
      } else if (discription.text.isEmpty) {
        cuastomSnackBAr("Type in discription", title: "Description");
      } else if (place.text.isEmpty) {
        cuastomSnackBAr("Type in place", title: "Place");
      } else if (startDate.text.isEmpty) {
        cuastomSnackBAr("Type date field", title: "Start Date");
      } else if (endDate.text.isEmpty) {
        cuastomSnackBAr("Type end date", title: "End Date");
      } else if (status.text.isEmpty) {
        cuastomSnackBAr("Must mention", title: "Status");
      } else {
        CreateEventModel createEventss = CreateEventModel(
          title: title2,
          description: description2,
          place: place2,
          startDate: startDate2,
          endDate: endDate2,
          status: status2,
          type: type,
          isRecurring: false,
          duration: 1,
          recurType: recurType,
        );
        controller.updateEVent(createEventss, id).then((status) {
          if (status.isSuccess) {
            Get.snackbar("Edited", "Your event successfully edited");
            Get.back();
          } else {
            cuastomSnackBAr(status.message);
            print(status.message.toString());
          }
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: SmallTxt(
          text: "Edit Event",
          size: 20,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {
                _deleteEvent(controller);
              },
              icon: controller.isLoadingdelete.value
                  ? const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    )),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: !controller.isLoadingEdit.value
              ? const CustomLoader()
              : Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      BigText(text: "Title"),
                      const SizedBox(height: 5),
                      AppTextField(
                        icon: Icons.title,
                        textController: title,
                        hintText: "Enter event title",
                      ),
                      const SizedBox(height: 15),
                      BigText(text: "Discription"),
                      const SizedBox(height: 5),
                      AppTextField(
                        icon: Icons.description,
                        textController: discription,
                        hintText: "Enter event description",
                      ),
                      const SizedBox(height: 15),
                      BigText(text: "Place"),
                      const SizedBox(height: 5),
                      AppTextField(
                        icon: Icons.place,
                        textController: place,
                        hintText: "Enter place",
                      ),
                      const SizedBox(height: 15),
                      BigText(text: "Start date"),
                      const SizedBox(height: 5),

                      MyTextField(
                        onTap: showStartdatepicker,
                        textController: startDate,
                        hintText: formatDateFromUtc(startSelectedDate.value)
                            .toString(),
                        icon: Icons.date_range,
                        isObscure: false,
                      ),
                      // AppTextField(
                      //   icon: Icons.date_range,
                      //   textController: startDate,
                      //   hintText: "10/4/2023",
                      // ),
                      const SizedBox(height: 15),
                      BigText(text: "End date"),
                      const SizedBox(height: 5),
                      MyTextField(
                        onTap: showEnddatepicker,
                        textController: endDate,
                        hintText:
                            formatDateFromUtc(endSelectedDate.value).toString(),
                        icon: Icons.date_range,
                        isObscure: false,
                      ),
                      // formatDateFromUtc(endSelectedDate.value).toString(),

                      // AppTextField(
                      //   icon: Icons.date_range,
                      //   textController: endDate,
                      //   hintText: "11/2/2023",
                      // ),
                      const SizedBox(height: 15),
                      BigText(text: "Status"),
                      DropdownMenu<String>(
                        width: 385,
                        initialSelection: statusList.first,
                        onSelected: (String? value) {
                          dropdownValue.value = value!;
                        },
                        dropdownMenuEntries: statusList
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                            value: value,
                            label: value,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          _editEvent(controller);
                        },
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: SmallTxt(
                                text: "Update",
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
