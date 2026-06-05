import 'package:get/get.dart';
import 'package:todotask/feature/auth/screens/login_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    goToLandingPage();
    super.onInit();
  }

  Future<void> goToLandingPage() async {
    await Future.delayed(Duration(seconds: 3))
        .then((value) => {Get.to(LoginScreen())});
  }

  // gotoPage() async {
  //   bool isLoggedIn = false;
  //   isLoggedIn = await _preference.isLoged() ?? false;
  //   print("isLoggedIn$isLoggedIn");
  //   if (isLoggedIn == true) {
  //     // Get.offAll(NavigationMenu());
  //   } else {
  //     Get.to(LoginScreen());
  //   }
  // }
}
