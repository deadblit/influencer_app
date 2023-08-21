import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'app_theme.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key}) {
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp.router(
        title: 'Aloha Influencer',
        theme: AppTheme.getLightTheme(lightColorScheme),
        darkTheme: AppTheme.getDarkTheme(darkColorScheme),
        themeMode: AppTheme.mode,
        routerConfig: Modular.routerConfig,
      );
    });
  }

  Future<void> _init() async {
    const keyApplicationId = "71c40b01-d6db-4c65-b206-ecd827e520af";
    const keyParseServerUrl = "https://api.alohadev.spacerock.studio/parse";
    const password = '+eqYZP`8UVk"ay7:V4DQ\$V)E0X(l>A';

    // final store = await CoreStoreSembastImp.getInstance(
    //   '/data.db',
    //   password: password,
    // );

    try {
      await Parse().initialize(
        keyApplicationId,
        keyParseServerUrl,
        debug: true,
      );

      log("Parse initialized", name: runtimeType.toString());
    } catch (error) {
      log("Parse initialization failed",
          error: error, name: runtimeType.toString());
    }
  }
}
