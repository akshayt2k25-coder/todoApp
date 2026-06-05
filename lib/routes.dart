import 'package:get/get.dart';
import 'package:todotask/feature/splash/controller/splash_controller.dart';
import 'package:todotask/feature/splash/screens/splash.dart';
import 'package:todotask/feature/todo/controller/add_update_controller.dart';
import 'package:todotask/feature/todo/controller/todo_controller.dart';
import 'package:todotask/feature/todo/screen/add_screen.dart';
import 'package:todotask/feature/todo/screen/home_screen.dart';

class Routes {
  static var getPages = [
    GetPage(
        name: SplashScreen.routName,
        page: () => SplashScreen(),
        binding:
            BindingsBuilder(() => {Get.lazyPut(() => SplashController())})),
    GetPage(
        name: TaskScreen.routename,
        page: () => TaskScreen(),
        binding: BindingsBuilder(() => {Get.lazyPut(() => TaskController())})),
    GetPage(
        name: AddTaskScreen.routeName,
        page: () => AddTaskScreen(),
        binding:
            BindingsBuilder(() => {Get.lazyPut(() => AddUpdateController())})),
  ];
}
