import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todotask/feature/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen();
  static const routName = "/";
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: AppColors.primary,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            // mainAxisSize: MainAxisSize.max,
            //  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 9),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Image.network(
                        'https://thf.bing.com/th/id/OIP.kPWcRMSboc3zUi94Oh3sTAHaHa?w=176&h=180&c=7&r=0&o=7&cb=thfc1falcon&dpr=1.5&pid=1.7&rm=3'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Welcome to Our World",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Spacer(flex: 8),
              Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
