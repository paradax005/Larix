import 'package:flutter/material.dart';

enum CategorieTask { uxUi, webDev, testing }


enum TaskStatus {
  done,
  inProgress,
  waiting,
}

class Task {
  String taskName;
  String taskDescription;
  CategorieTask category;
  DateTime date;
  TimeOfDay startTime;
  TimeOfDay deadlineTime;
  TaskStatus status;

  Task(
    this.taskName,
    this.taskDescription,
    this.category,
    this.date,
    this.startTime,
    this.deadlineTime,
    this.status,
  );
}
