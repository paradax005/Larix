import 'package:flutter/material.dart';
import 'package:larix/utils/constant.dart';

import '../../../../models/task.dart';
import '../../../../utils/date_format.dart';

class CustomButtomSheet extends StatefulWidget {
  const CustomButtomSheet({Key? key, required this.currentDateTime})
      : super(key: key);

  final DateTime currentDateTime;

  @override
  State<CustomButtomSheet> createState() => _CustomButtomSheetState();
}

class _CustomButtomSheetState extends State<CustomButtomSheet> {
  CategorieTask _categorie = CategorieTask.uxUi;
  final taskNameController = TextEditingController();
  final descriptionController = TextEditingController();
  late TimeOfDay startTime;
  late TimeOfDay deadlineTime;

  @override
  void initState() {
    super.initState();
    startTime = TimeOfDay.now();
    deadlineTime =
        TimeOfDay(hour: startTime.hour + 2, minute: startTime.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.1),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //Header BottomSheet
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      'Add Task',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 75, 95, 123),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.16),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 192, 57, 48),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 90,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Input Task name
            const Text('Task name'),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: taskNameController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              ),
            ),

            // Categorie List
            const SizedBox(
              height: 16,
            ),
            const Text('Categorie'),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: Radio(
                                value: CategorieTask.uxUi,
                                groupValue: _categorie,
                                onChanged: (CategorieTask? value) {
                                  setState(() {
                                    _categorie = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Ux/Ui',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: Radio(
                                value: CategorieTask.webDev,
                                groupValue: _categorie,
                                onChanged: (CategorieTask? value) {
                                  setState(() {
                                    _categorie = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Web Dev',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: Radio(
                                value: CategorieTask.testing,
                                groupValue: _categorie,
                                onChanged: (CategorieTask? value) {
                                  setState(() {
                                    _categorie = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Testing',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),

            // Description field
            const SizedBox(
              height: 16,
            ),
            const Text('Description'),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              maxLines: 3,
              textInputAction: TextInputAction.done,
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            // Start / deadline date for task
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Starts',
                    style: TextStyle(
                      color: Color.fromARGB(255, 128, 149, 181),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Deadline',
                    style: TextStyle(
                      color: Color.fromARGB(255, 128, 149, 181),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => {
                              showTimePicker(
                                context: context,
                                initialTime: startTime,
                                initialEntryMode: TimePickerEntryMode.dial,
                                confirmText: "CONFIRM",
                                cancelText: "NOT NOW",
                                helpText: "START TIME",
                              ).then((value) => {
                                    setState(() {
                                      startTime = value!;
                                      // print('new value : $startTime');
                                    })
                                  })
                            },
                            child: const Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                            ),
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${getDateFormat(widget.currentDateTime)},${getTimeFormat(startTime)}',
                                // '01-08-2022, 14:00',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              showTimePicker(
                                context: context,
                                initialTime: deadlineTime,
                                initialEntryMode: TimePickerEntryMode.dial,
                                confirmText: "CONFIRM",
                                cancelText: "NOT NOW",
                                helpText: "DEADLINE TIME",
                              ).then((value) => {
                                    setState(() {
                                      deadlineTime = value!;
                                      // print('deadline time : $deadlineTime');
                                    })
                                  })
                            },
                            child: const Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${getDateFormat(widget.currentDateTime)},${getTimeFormat(deadlineTime)}',
                                // '01-08-2022, 16:00',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
