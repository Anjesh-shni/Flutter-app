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

class CreateEventByStudnet extends StatefulWidget {
  const CreateEventByStudnet({super.key});

  @override
  State<CreateEventByStudnet> createState() => _CreateEventByStudnetState();
}

class _CreateEventByStudnetState extends State<CreateEventByStudnet> {
  static List<String> statusList = <String>["Public", "Private"];
  var dropdownValue = statusList.first.obs;
  var startSelectedDate = DateTime.now();
  var endSelectedDate = DateTime.now();

  final title = TextEditingController();
  final discription = TextEditingController();
  final place = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final status = TextEditingController();

  var controller = Get.put(CreateEventController(createEventRepo: Get.find()));

  @override
  void initState() {
    super.initState();
  }

  void showStartdatepicker() async {
    DateTime? pickDate = await showDatePicker(
      context: Get.context!,
      initialDate: startSelectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (pickDate != null && pickDate != startSelectedDate) {
      setState(() {
        startSelectedDate = pickDate;
      });
    }
  }

  void showEnddatepicker() async {
    DateTime? pickDate = await showDatePicker(
      context: Get.context!,
      initialDate: endSelectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (pickDate != null && pickDate != endSelectedDate) {
      setState(() {
        endSelectedDate = pickDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String type = "PRIVATE";
    String recurType = "month";

    void _createEvent(CreateEventController controller) {
      String title1 = title.text.trim();
      String description1 = discription.text.trim();
      String place1 = place.text.trim();
      String startDate1 = formatDatetoUTC(startSelectedDate);
      String endDate1 = formatDatetoUTC(endSelectedDate);
      String status1 = dropdownValue.value;

      if (title1.isEmpty) {
        cuastomSnackBAr("Title can't be empty", title: "Title");
      } else if (description1.isEmpty) {
        cuastomSnackBAr("Type in discription", title: "Description");
      } else if (place1.isEmpty) {
        cuastomSnackBAr("Type in place", title: "Place");
      } else if (startDate1.isEmpty) {
        cuastomSnackBAr("Type date field", title: "Start Date");
      } else if (endDate1.isEmpty) {
        cuastomSnackBAr("Type end date", title: "End Date");
      } else if (status1.isEmpty) {
        cuastomSnackBAr("Must mention", title: "Status");
      } else {
        CreateEventModel createEventss = CreateEventModel(
          title: title1,
          description: description1,
          place: place1,
          startDate: startDate1,
          endDate: endDate1,
          status: status1,
          type: type,
          isRecurring: false,
          duration: 1,
          recurType: recurType,
        );
        controller.createEVent(createEventss).then((status) {
          if (status.isSuccess) {
            Get.back();
            Get.snackbar("Created", "Your event successfully created");
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
          text: "Create Event",
          size: 20,
          color: Colors.white,
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: !controller.isLoadingCreate.value
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
                        hintText:
                            formatDateFromUtc(startSelectedDate).toString(),
                        icon: Icons.date_range,
                        isObscure: false,
                      ),
                      const SizedBox(height: 15),
                      BigText(text: "End date"),
                      const SizedBox(height: 5),
                      MyTextField(
                        onTap: showEnddatepicker,
                        textController: endDate,
                        hintText: formatDateFromUtc(endSelectedDate).toString(),
                        icon: Icons.date_range,
                        isObscure: false,
                      ),
                      const SizedBox(height: 15),
                      BigText(text: "Status"),
                      //DropDown menu
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
                          _createEvent(controller);
                          controller.getEventList();
                          //Creaet event
                        },
                        child: controller.isLoadingCreate == true
                            ? Center(
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: SmallTxt(
                                      text: "Create",
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(child: CustomLoader()),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
// class CreateEventByStudnet extends GetView<CreateEventController> {
//   static List<String> statusList = <String>["Public", "Private"];
//   var dropdownValue = statusList.first.obs;
//   var startSelectedDate = DateTime.now().obs;
//   var endSelectedDate = DateTime.now().obs;

//   @override
//   var controller = Get.put(CreateEventController(createEventRepo: Get.find()));

//   CreateEventByStudnet({super.key});
//   void showStartdatepicker() async {
//     DateTime? pickDate = await showDatePicker(
//       context: Get.context!,
//       initialDate: startSelectedDate.value,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2025),
//     );
//     if (pickDate != null && pickDate != startSelectedDate.value) {
//       startSelectedDate.value = pickDate;
//     }
//   }

//   void showEnddatepicker() async {
//     DateTime? pickDate = await showDatePicker(
//       context: Get.context!,
//       initialDate: endSelectedDate.value,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2025),
//     );
//     if (pickDate != null && pickDate != endSelectedDate.value) {
//       endSelectedDate.value = pickDate;
//     }
//   }

//   final title = TextEditingController();
//   final discription = TextEditingController();
//   final place = TextEditingController();
//   final startDate = TextEditingController();
//   final endDate = TextEditingController();
//   final status = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     String type = "PRIVATE";
//     String recurType = "month";

//     void _createEvent(CreateEventController controller) {
//       String title1 = title.text.trim();
//       String description1 = discription.text.trim();
//       String place1 = place.text.trim();
//       String startDate1 = formatDate(startSelectedDate.value.toString());
//       String endDate1 = formatDate(endSelectedDate.value.toString());
//       String status1 = dropdownValue.value;

//       if (title1.isEmpty) {
//         cuastomSnackBAr("Title can't be empty", title: "Title");
//       } else if (description1.isEmpty) {
//         cuastomSnackBAr("Type in discription", title: "Description");
//       } else if (place1.isEmpty) {
//         cuastomSnackBAr("Type in place", title: "Place");
//       } else if (startDate1.isEmpty) {
//         cuastomSnackBAr("Type date field", title: "Start Date");
//       } else if (endDate1.isEmpty) {
//         cuastomSnackBAr("Type end date", title: "End Date");
//       } else if (status1.isEmpty) {
//         cuastomSnackBAr("Must mention", title: "Status");
//       } else {
//         CreateEventModel createEventss = CreateEventModel(
//           title: title1,
//           description: description1,
//           place: place1,
//           startDate: startDate1,
//           endDate: endDate1,
//           status: status1,
//           type: type,
//           isRecurring: false,
//           duration: 1,
//           recurType: recurType,
//         );
//         controller.createEVent(createEventss).then((status) {
//           if (status.isSuccess) {
//             Get.back();
//             Get.snackbar("Created", "Your event successfully created");
//           } else {
//             cuastomSnackBAr(status.message);
//             print(status.message.toString());
//           }
//         });
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: SmallTxt(
//           text: "Create Event",
//           size: 20,
//           color: Colors.white,
//         ),
//       ),
//       body: Obx(
//         () => SingleChildScrollView(
//           child: !controller.isLoadingCreate.value
//               ? const CustomLoader()
//               : Padding(
//                   padding: const EdgeInsets.only(left: 20, top: 20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 15),
//                       BigText(text: "Title"),
//                       const SizedBox(height: 5),
//                       AppTextField(
//                         icon: Icons.title,
//                         textController: title,
//                         hintText: "Enter event title",
//                       ),
//                       const SizedBox(height: 15),
//                       BigText(text: "Discription"),
//                       const SizedBox(height: 5),
//                       AppTextField(
//                         icon: Icons.description,
//                         textController: discription,
//                         hintText: "Enter event description",
//                       ),
//                       const SizedBox(height: 15),
//                       BigText(text: "Place"),
//                       const SizedBox(height: 5),
//                       AppTextField(
//                         icon: Icons.place,
//                         textController: place,
//                         hintText: "Enter place",
//                       ),
//                       const SizedBox(height: 15),
//                       BigText(text: "Start date"),
//                       const SizedBox(height: 5),
//                       MyTextField(
//                         onTap: showStartdatepicker,
//                         textController: startDate,
//                         hintText: formatDateFromUtc(startSelectedDate.value)
//                             .toString(),
//                         icon: Icons.date_range,
//                         isObscure: false,
//                       ),
//                       const SizedBox(height: 15),
//                       BigText(text: "End date"),
//                       const SizedBox(height: 5),
//                       MyTextField(
//                         onTap: showEnddatepicker,
//                         textController: endDate,
//                         hintText:
//                             formatDateFromUtc(endSelectedDate.value).toString(),
//                         icon: Icons.date_range,
//                         isObscure: false,
//                       ),
//                       const SizedBox(height: 15),
//                       BigText(text: "Status"),
//                       //DropDown menu
//                       DropdownMenu<String>(
//                         width: 385,
//                         initialSelection: statusList.first,
//                         onSelected: (String? value) {
//                           dropdownValue.value = value!;
//                         },
//                         dropdownMenuEntries: statusList
//                             .map<DropdownMenuEntry<String>>((String value) {
//                           return DropdownMenuEntry<String>(
//                             value: value,
//                             label: value,
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 50),
//                       GestureDetector(
//                         onTap: () {
//                           _createEvent(controller);
//                           controller.getEventList();
//                           //Creaet event
//                         },
//                         child: controller.isLoadingCreate == true
//                             ? Center(
//                                 child: Container(
//                                   height: 50,
//                                   width: 300,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Colors.blue,
//                                   ),
//                                   child: Center(
//                                     child: SmallTxt(
//                                       text: "Create",
//                                       color: Colors.white,
//                                       size: 22,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : const Center(child: CustomLoader()),
//                       ),
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
