import 'package:flutter/material.dart';
import 'package:influencer_app/features/app_theme.dart';

class TaskProgressSlider extends StatefulWidget {
  const TaskProgressSlider({
    super.key,
    required this.currentSliderValue,
    required this.onChanged,
  });

  final double currentSliderValue;
  final ValueChanged<double>? onChanged;

  @override
  State<TaskProgressSlider> createState() => _TaskProgressSliderState();
}

class _TaskProgressSliderState extends State<TaskProgressSlider> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    SliderDiscretTheme sliderTheme = theme.extension<SliderDiscretTheme>()!;
    final double currentSliderValue = widget.currentSliderValue;

    return InputDecorator(
      decoration: const InputDecoration(
        label: Text(
          'Percentual concluído',
        ),
      ),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          showValueIndicator: ShowValueIndicator.never,
          thumbShape: const _ThumbShape(),
          valueIndicatorTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.only(top: 34.0),
            child: Slider(
                value: currentSliderValue,
                max: 100,
                divisions: 10,
                label: currentSliderValue.round().toString(),
                activeColor:
                    sliderTheme.sliderColors[currentSliderValue.toInt()],
                onChanged: widget.onChanged)),
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
