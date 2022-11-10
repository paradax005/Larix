import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:larix/models/task.dart';
import 'package:larix/screens/main/calendar/widgets/custom_bottom_sheet.dart';
import 'package:larix/screens/main/calendar/widgets/edit_bottom_sheet.dart';
import 'package:larix/utils/constant.dart';
import '../../../utils/date_utils.dart' as date_util;
import '../dashboard/widgets/header_dashboard.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  int currentMonthIndex = DateTime.now().month.toInt();

  late String dropdownValue;
  final items = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mai',
    'Jun',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  // List Of data tasks !
  // final taskData = [];

  // init state function !
  @override
  void initState() {
    super.initState();

    // Setting value of current month !
    dropdownValue = items[currentMonthIndex - 1];

    // Get current month and list of days !
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();

    // Scroll Controller !
    _scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);

    // _animationController = BottomSheet.createAnimationController(this);
    // _animationController.duration = const Duration(milliseconds: 800);
    _animationController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EBFC),
      body: Builder(
        builder: ((context) {
          return Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: double.infinity,
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: double.infinity,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 73, 122, 237),
                            Color.fromARGB(255, 87, 78, 234),
                            Color.fromARGB(255, 58, 88, 221),
                            Color.fromARGB(255, 58, 88, 221),
                            Color.fromARGB(255, 87, 78, 234),
                            Color.fromARGB(255, 73, 122, 237),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          const HeaderDashboard(
                            image: 'assets/images/profile_pic.png',
                            userConnected: true,
                            userName: 'ETCAdmin',
                            userRole: 'HR Manager',
                            drawerColor: Colors.white,
                            roleColor: Colors.white,
                            userNameColor: Colors.white,
                          ),
                          _datePicker(),
                          _horizontalCapsuleListView(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Daily Task',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xFF000A39),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: FloatingActionButton(
                                    backgroundColor: kPrimaryColor,
                                    onPressed: () {
                                      showModalBottomSheet(
                                          transitionAnimationController:
                                              _animationController,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(24),
                                            ),
                                          ),
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              child: CustomButtomSheet(
                                                currentDateTime:
                                                    currentDateTime,
                                              ),
                                            );
                                          });
                                    },

                                    // Get.bottomSheet(builder: (_) { return const CustomButtomSheet(currentDateTime: currentDateTime;});
                                    //   CustomButtomSheet(
                                    //     currentDateTime: currentDateTime,
                                    //   ),
                                    //   backgroundColor: Colors.white,
                                    //   enterBottomSheetDuration:
                                    //       const Duration(milliseconds: 600),
                                    //   exitBottomSheetDuration:
                                    //       const Duration(milliseconds: 600),
                                    //   isScrollControlled: true,
                                    // );

                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            _timeLineTile(),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: const Text(
                                'Daily Task',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFF000A39),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: kBottomNavigationBarHeight + 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  _datePicker() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                DateFormat.yMMMMd().format(currentDateTime),
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "You have 8 tasks for today ! ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            width: 100,
            height: 40,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(24),
            ),
            child: DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 22,
              isExpanded: true,
              items: items.map(buildMenuItem).toList(),
              onChanged: ((value) => {
                    setState(() => {dropdownValue = value.toString()})
                  }),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Text(
              item,
              style: const TextStyle(
                  color: Color(0xFF5B5675),
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );

  _horizontalCapsuleListView() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
      width: double.infinity,
      height: 60,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return _capsuleView(index);
        },
      ),
    );
  }

  _capsuleView(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentDateTime = currentMonthList[index];
          });
        },
        child: Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            gradient: currentMonthList[index].day == currentDateTime.day
                ? LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.85),
                      Colors.white.withOpacity(0.9)
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: const [0.0, 0.5, 1.0],
                    tileMode: TileMode.clamp,
                  )
                : null,
            borderRadius: currentMonthList[index].day == currentDateTime.day
                ? BorderRadius.circular(24)
                : null,
            boxShadow: [
              if (currentMonthList[index].day == currentDateTime.day)
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 0.5,
                  color: Colors.white.withOpacity(0.6),
                )
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date_util
                      .DateUtils.weekdays[currentMonthList[index].weekday - 1],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: (currentMonthList[index].day == currentDateTime.day)
                        ? kPrimaryColor
                        : Colors.white,
                  ),
                ),
                Text(
                  currentMonthList[index].day < 10
                      ? "0${currentMonthList[index].day}"
                      : currentMonthList[index].day.toString(),
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: (currentMonthList[index].day == currentDateTime.day)
                        ? kPrimaryColor
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _timeLineTile() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _timelineRow(
            "09:00",
            "Order Confirmed",
            'orderDateTime',
            TaskStatus.done,
          ),
          _timelineRow(
            "10:00",
            "Order Inprocess",
            'orderDateTime',
            TaskStatus.done,
          ),
          _timelineRow(
            "11:00",
            "UX Research",
            "Larix UX research and wireframing",
            TaskStatus.inProgress,
          ),
          _timelineRow(
            "12:00",
            "New Project",
            "creation of new project",
            TaskStatus.waiting,
            isLast: true,
          ),
        ],
      ),
    );
  }

  _timelineRow(String time, String title, String subTile, TaskStatus status,
      {bool isLast = false}) {
    Color color;
    if (status == TaskStatus.done) {
      color = Colors.grey.withOpacity(0.6);
    } else if (status == TaskStatus.inProgress) {
      color = kPrimaryColor;
    } else {
      color = Colors.transparent;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: (status == TaskStatus.waiting)
                      ? Border.all(width: 1, color: Colors.grey)
                      : null,
                ),
                child: (status != TaskStatus.waiting)
                    ? const Icon(
                        Icons.done,
                        size: 12,
                        color: Colors.white,
                      )
                    : const Text(''),
              ),
              if (!isLast)
                Container(
                  width: 1.5,
                  height: 70,
                  decoration: BoxDecoration(
                    color: status != TaskStatus.inProgress
                        ? kPrimaryColor
                        : Colors.grey,
                    shape: BoxShape.rectangle,
                  ),
                  child: const Text(""),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (status == TaskStatus.inProgress)
                Text(
                  time,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              if (status == TaskStatus.inProgress)
                const SizedBox(
                  width: 10,
                ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (TaskStatus.inProgress == status) {
                      showModalBottomSheet(
                        transitionAnimationController: _animationController,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        context: context,
                        builder: ((context) => EditBottomSheet(
                              currentDateTime: currentDateTime,
                            )),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, right: 16, left: 16),
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: status == TaskStatus.inProgress
                          ? const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 87, 78, 234),
                                Color.fromARGB(255, 58, 88, 221),
                                Color.fromARGB(255, 58, 88, 221),
                                Color.fromARGB(255, 87, 78, 234),
                              ],
                            )
                          : null,
                      color:
                          status != TaskStatus.inProgress ? Colors.white : null,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: status == TaskStatus.inProgress
                                    ? Colors.white
                                    : Colors.grey.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              subTile,
                              style: TextStyle(
                                fontSize: 12,
                                color: status == TaskStatus.inProgress
                                    ? Colors.white.withOpacity(0.9)
                                    : Colors.grey.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        if (status != TaskStatus.inProgress)
                          Text(
                            time,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
