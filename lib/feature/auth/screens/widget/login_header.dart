import 'package:flutter/material.dart';
import 'package:todotask/utils/contsants/sizes.dart';

class ULoginHeader extends StatelessWidget {
  final bool isregister;
  const ULoginHeader({
    super.key,
    this.isregister=false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
       isregister?"Sign UP":   "Log In",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: USizes.sm,
        ),
        Text(
       isregister?"Please Create Account":   "Log in to Access Exclusive Deals ",
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
