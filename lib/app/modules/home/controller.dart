import 'package:get/get.dart';
import 'package:task_manager/app/data/services/storage/repository.dart';

import '../../data/models/task.dart';

class HomeController extends GetxController{
  TaskRepository taskRepository;
  HomeController ({required this.taskRepository});

  final tasks = <Task>[].obs;

  @override
  void onInit(){
    super.onInit();
    tasks.assignAll(taskRepository.readTaskks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    super.onClose();
  }
}