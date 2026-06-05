import 'package:flutter/material.dart';

import 'package:todotask/utils/helpers/device_helpers.dart';

class UElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  const UElevatedButton({
    super.key,
    required this.child,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: UDeviceHelper.getScreenWidth(context),
        child: ElevatedButton(onPressed: onPress, child: child));
  }
}
