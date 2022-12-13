import 'dart:convert';
import 'package:get/get.dart';
import 'package:task_manager/app/data/models/task.dart';
import 'package:task_manager/app/data/services/storage/services.dart';
import '../../../core/utils/keys.dart';

class TaskProvider {
  StorageService _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}