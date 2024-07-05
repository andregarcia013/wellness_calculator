import 'package:andregarcia_kalshi/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatelessWidget {
  Splash() {}

  @override
  Widget build(BuildContext context) {
    Future.delayed(Durations.long2, () => context.go('/home'));

    return Scaffold(
      body: Center(
        child: Image.asset(AppAssetsImages.logo),
      ),
    );
  }
}
