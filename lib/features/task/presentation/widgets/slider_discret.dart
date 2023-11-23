import 'package:flutter/material.dart';
import 'package:influencer_app/features/app_theme.dart';

class SliderDiscret extends StatefulWidget {
  const SliderDiscret({super.key, required this.currentSliderValue});

  final double currentSliderValue;

  @override
  State<SliderDiscret> createState() => _SliderDiscretState();
}

class _SliderDiscretState extends State<SliderDiscret> {
  late double _currentSliderValue;
  @override
  void initState() {
    _currentSliderValue = widget.currentSliderValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    SliderDiscretTheme sliderTheme = theme.extension<SliderDiscretTheme>()!;

    return InputDecorator(
      decoration: const InputDecoration(label: Text('Percentual concluido')),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          showValueIndicator: ShowValueIndicator.never,
          thumbShape: const _ThumbShape(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Slider(
            value: _currentSliderValue,
            max: 100,
            divisions: 10,
            label: _currentSliderValue.round().toString(),
            activeColor: sliderTheme.sliderColors[_currentSliderValue.toInt()],
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class _ThumbShape extends RoundSliderThumbShape {
  final _indicatorShape = const DropSliderValueIndicatorShape();

  const _ThumbShape();

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    super.paint(
      context,
      center,
      activationAnimation: activationAnimation,
      enableAnimation: enableAnimation,
      sliderTheme: sliderTheme,
      value: value,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
      isDiscrete: isDiscrete,
      labelPainter: labelPainter,
      parentBox: parentBox,
      textDirection: textDirection,
    );

    _indicatorShape.paint(
      context,
      center,
      activationAnimation: const AlwaysStoppedAnimation(1),
      enableAnimation: const AlwaysStoppedAnimation(1),
      labelPainter: labelPainter,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      value: value,
      textScaleFactor: 1,
      sizeWithOverflow: sizeWithOverflow,
      isDiscrete: isDiscrete,
      textDirection: textDirection,
    );
  }
}
