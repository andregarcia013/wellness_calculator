import 'package:andregarcia_kalshi/core/extensions/sizer_extensions.dart';
import 'package:andregarcia_kalshi/core/extensions/widget_extension.dart';
import 'package:andregarcia_kalshi/core/utils/assets.dart';
import 'package:andregarcia_kalshi/core/utils/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseLayout extends StatelessWidget {
  final Color color;
  final Widget? title;
  final List<Widget>? contents;
  const BaseLayout(
      {super.key, this.color = Colors.white, this.title, this.contents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80.0.h,
                color: Colors.white,
                alignment: Alignment.center,
                child: Image.asset(AppAssetsImages.logotype),
              ),
              SizedBox(
                width: 288.0.w,
                child: title,
              ).paddingOnly(top: 30.0.h),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 3,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80.0.h,
                        alignment: Alignment.center,
                        child: Image.asset(AppAssetsImages.logo),
                      ).paddingOnly(top: 20.0.h),
                      ...?contents
                    ],
                  ),
                ),
              ),
              Icon(
                FluentIcons.lock_closed_12_regular,
                size: 24.0.w,
                color: iconGrey,
              ).paddingOnly(top: 25.0.h, bottom: 16.0.h),
              SizedBox(
                  width: 256.0.w,
                  child: Text(
                    "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!,
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
