import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:provider/provider.dart';

import 'helper/ui_helper.dart';
import 'view/snow_clock_view.dart';
import 'viewmodel/snow_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  return runApp(
    ChangeNotifierProvider<SnowViewModel>(
      create: (_) => SnowViewModel(ClockModel()),
      child: VBApp(),
    ),
  );
}

class VBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UIHELPER.snowTheme,
      home: SnowClockView(),
    );
  }
}
