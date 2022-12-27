import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/data/services/storage/repository.dart';

import '../../data/models/task.dart';

class HomeController extends GetxController{
  TaskRepository taskRepository;
  HomeController ({required this.taskRepository});

  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final chipIndex = 0.obs;
  final deleting = false.obs;
  final tasks = <Task>[].obs;

  @override
  void onInit(){
    super.onInit();
    tasks.assignAll(taskRepository.readTaskks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    editCtrl.dispose();
    super.onClose();
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  void changeDeleting (bool value) {
    deleting.value = value;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }
}