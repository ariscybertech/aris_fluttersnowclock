import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mark922_flutter_lottie/mark922_flutter_lottie.dart';
import 'package:provider/provider.dart';

import '../helper/app_helper.dart';
import '../helper/ui_helper.dart';
import '../viewmodel/snow_view_model.dart';

class SnowClockView extends StatefulWidget {
  @override
  _SnowClockViewState createState() => _SnowClockViewState();
}

class _SnowClockViewState extends State<SnowClockView> {
  SnowViewModel snowViewModel;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<SnowViewModel>(context, listen: false).startListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _clockConsumer);
  }

  Widget get _clockConsumer => Consumer<SnowViewModel>(
        builder: (context, model, child) {
          snowViewModel = model;
          return Stack(
            children: <Widget>[
              containerClock(context),
              _snowmanUncle,
              _backgroundSnowEffect,
            ],
          );
        },
      );

  Widget get _snowmanUncle => AnimatedPositioned(
        duration: Duration(seconds: 1),
        height: UIHELPER.HEIGHT200,
        width: UIHELPER.HEIGHT200,
        right: 0,
        bottom: UIHELPER.dpHeight(context, height: bottomValue),
        child: lottieUncle,
      );

  double get bottomValue => snowViewModel.hohoPoligon ? 0 : .4;
}

extension _LOTTIE on _SnowClockViewState {
  Widget get lottieUncle => LottieView.fromFile(
        filePath: UIHELPER.christmasLottieJson,
        autoPlay: true,
        reverse: true,
        loop: true,
        onViewCreated: (_) {},
      );

  Widget get _backgroundSnowEffect => Positioned.fill(
        child: LottieView.fromFile(
          filePath: UIHELPER.letitLottieJson,
          autoPlay: true,
          loop: true,
          onViewCreated: (_) {},
        ),
      );
}

extension _CLOCK on _SnowClockViewState {
  Container containerClock(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: UIHELPER.dpHeight(context, height: 0.1)),
      alignment: Alignment.bottomLeft,
      child: Transform(
        transform: UIHELPER.transformValue,
        child: richText,
      ),
    );
  }

  Widget get richText => RichText(
        text: TextSpan(
            style: TextStyle(fontFamily: APPHELPER.FONT_FAMILY),
            children: [
              widgetSpan,
              emptySpan,
              minuteSpan,
              emptySpan,
              secondSpan,
            ]),
      );

  WidgetSpan get widgetSpan => WidgetSpan(
      child: animatedContainer, style: Theme.of(context).textTheme.display3);

  Widget get animatedContainer => AnimatedContainer(
        duration: UIHELPER.lowDuration,
        decoration: BoxDecoration(
            boxShadow: [UIHELPER.boxShadow(snowViewModel.hohoPoligon)]),
        child: Text(snowViewModel.hour,
            style: Theme.of(context)
                .textTheme
                .display3
                .copyWith(color: Colors.black)),
      );

  TextSpan get emptySpan => TextSpan(text: ":");

  TextSpan get minuteSpan => TextSpan(
      text: snowViewModel.minute, style: Theme.of(context).textTheme.display2);

  TextSpan get secondSpan => TextSpan(
      text: snowViewModel.second, style: Theme.of(context).textTheme.display1);
}
