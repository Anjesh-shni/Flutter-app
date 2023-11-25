import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zunun/app/reusable_widget/shrimmer_effect.dart';
import 'package:zunun/app/widgets/small_text.dart';
import 'package:zunun/config/extension/dateformater.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/app/widgets/container_tile.dart';
import 'package:zunun/app/widgets/statusbar_profile.dart';
import '../../create_event/controller/create_event_controller.dart';
import '../../create_event/view/create_event_V.dart';
import '../../create_event/view/edit_event.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final localStorage = GetStorage();
  var allEventForUser =
      Get.put(CreateEventController(createEventRepo: Get.find()));

  var _calenderFormat = CalendarFormat.month;
  DateTime? _selectedDAy;
  var _focuseDay = DateTime.now();
  Map<String, List> events = {};

  @override
  void initState() {
    super.initState();
    _selectedDAy = _focuseDay;
    eventsOnDate();
  }

  void eventsOnDate() {
    setState(() {
      if (events[DateFormat('yyyy-MM-dd').format(_selectedDAy!)] != null) {
        events[DateFormat('yyyy-MM-dd').format(_selectedDAy!)]!
            .add(allEventForUser.eventList.value.data!);
      } else {
        events[DateFormat('yyyy-MM-dd').format(_selectedDAy!)] =
            allEventForUser.eventList.value.data!;
      }
    });
  }

  List listOnDaySelected(DateTime date) {
    if (events[DateFormat('yyyy-MM-dd').format(date)] != null) {
      return events[DateFormat('yyyy-MM-dd').format(date)]!;
    } else {
      return [];
    }
  }

  _loadResource() async {
    await allEventForUser.getEventList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 55,
      onRefresh: () async {
        await _loadResource();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Adaptive.h(AppDimens.statusBarHeight)),
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
            child: ProfileStatusBar(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today",
                          style: subHeadingStyle,
                        ),
                        Text(
                          "Wednesday 7, June",
                          style: tinyGreyStyle,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const CreateEventByStudnet(),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: const Center(
                            child: Text(
                          "Create Event",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                TableCalendar(
                  firstDay: DateTime.utc(2020, 10, 16),
                  lastDay: DateTime.utc(2025, 3, 14),
                  focusedDay: _focuseDay,
                  calendarFormat: _calenderFormat,
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDAy, selectedDay)) {
                      setState(() {
                        _selectedDAy = selectedDay;
                        _focuseDay = focusedDay;
                      });
                    }
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDAy, day);
                  },
                  onFormatChanged: (format) {
                    if (_calenderFormat != format) {
                      setState(() {
                        _calenderFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focuseDay = focusedDay;
                  },
                  eventLoader: (day) {
                    return listOnDaySelected(day);
                  },
                ),
                ...listOnDaySelected(_selectedDAy!).map((myEvents) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: Colors.black,
                        thickness: 0.2,
                      ),
                      SmallTxt(
                          text:
                              "Your event on : ${convertUtcDateString(_selectedDAy.toString())}"),
                      ListTile(
                        leading: const Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                        title: SmallTxt(
                            text: "Event name : ${myEvents.title.toString()}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallTxt(
                                text:
                                    "Start Date : ${convertUtcDateString(myEvents.startDate.toString())}"),
                            SmallTxt(
                                text:
                                    "End Date : ${convertUtcDateString(myEvents.endDate.toString())}"),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                Text(
                  "All event",
                  style: veryTinyBoldStyle,
                ),
                SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                Text(
                  "This Month",
                  style: veryTinyGreyStyle,
                ),
                Obx(
                  () => allEventForUser.isLoadingList.value
                      ? Column(
                          children: List.generate(
                            5,
                            (index) => const ListTile(
                              leading: ShrimmerEffect.circular(
                                  height: 64, width: 60),
                              title: ShrimmerEffect.rectangular(height: 16),
                              subtitle: ShrimmerEffect.rectangular(height: 14),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              allEventForUser.eventList.value.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var eventList =
                                allEventForUser.eventList.value.data![index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  arguments: [
                                    eventList.title,
                                    eventList.description,
                                    eventList.place,
                                    eventList.startDate,
                                    eventList.endDate,
                                    eventList.status,
                                    eventList.id,
                                  ],
                                  () => EditEventDataa(),
                                );
                              },
                              child: TileContainer(
                                image: AppIcons.playCircle,
                                title: "${eventList.title}",
                                subTitle: convertUtcDateString(
                                    eventList.startDate.toString()),
                                postIcon: AppIcons.editIcon,
                              ),
                            );
                          }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
