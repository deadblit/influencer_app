import 'package:flutter/material.dart';

class AppTheme {
  static final defaultLightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.purple,
  );

  static final defaultDarkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.dark,
  );

  static const mode = ThemeMode.dark;

  static ThemeData getLightTheme(ColorScheme? lightColorScheme) {
    return ThemeData(
      colorScheme: lightColorScheme ?? AppTheme.defaultLightColorScheme,
      useMaterial3: true,
      extensions: [SliderDiscretTheme()],
    );
  }

  static ThemeData getDarkTheme(ColorScheme? darkColorScheme) {
    return ThemeData(
      colorScheme: darkColorScheme ?? AppTheme.defaultDarkColorScheme,
      useMaterial3: true,
      extensions: [SliderDiscretTheme()],
    );
  }
}

class SliderDiscretTheme extends ThemeExtension<SliderDiscretTheme> {
  final Map<int, Color> sliderColors;

  ///  0
  final Color engineeringOrange;

  ///10
  final Color sinopia;

  ///20
  final Color cocoaBrown;

  ///30
  final Color fulvous;

  ///40
  final Color harvestGold;

  ///50
  final Color citrine;

  ///60
  final Color citrine2;

  ///70
  final Color yellowGreen;

  ///80
  final Color kellyGreen;

  ///90
  final Color kellyGreen2;

  ///100
  final Color arkPastelGreen;

  SliderDiscretTheme({
    this.engineeringOrange = const Color(0xffC42408),
    this.sinopia = const Color(0xFFCC450A),
    this.cocoaBrown = const Color(0xFFD4660D),
    this.fulvous = const Color(0xFFDB880F),
    this.harvestGold = const Color(0xFFE3A912),
    this.citrine = const Color(0xFFEBCA14),
    this.citrine2 = const Color(0xFFC5C620),
    this.yellowGreen = const Color(0xFF9FC22B),
    this.kellyGreen = const Color(0xFF78BD37),
    this.kellyGreen2 = const Color(0xFF52B942),
    this.arkPastelGreen = const Color(0xFF2CB54E),
  }) : sliderColors = <int, Color>{
          0: engineeringOrange,
          10: sinopia,
          20: cocoaBrown,
          30: fulvous,
          40: harvestGold,
          50: citrine,
          60: citrine2,
          70: yellowGreen,
          80: kellyGreen,
          90: kellyGreen2,
          100: arkPastelGreen,
        };

  @override
  ThemeExtension<SliderDiscretTheme> lerp(
      covariant ThemeExtension<SliderDiscretTheme>? other, double t) {
    if (other is! SliderDiscretTheme) return this;
    return SliderDiscretTheme(
      engineeringOrange:
          Color.lerp(engineeringOrange, other.engineeringOrange, t)!,
      sinopia: Color.lerp(sinopia, other.sinopia, t)!,
      cocoaBrown: Color.lerp(cocoaBrown, other.cocoaBrown, t)!,
      fulvous: Color.lerp(fulvous, other.fulvous, t)!,
      harvestGold: Color.lerp(harvestGold, other.harvestGold, t)!,
      citrine: Color.lerp(citrine, other.citrine, t)!,
      citrine2: Color.lerp(citrine2, other.citrine2, t)!,
      yellowGreen: Color.lerp(yellowGreen, other.yellowGreen, t)!,
      kellyGreen: Color.lerp(kellyGreen, other.kellyGreen, t)!,
      kellyGreen2: Color.lerp(kellyGreen2, other.kellyGreen2, t)!,
      arkPastelGreen: Color.lerp(arkPastelGreen, other.arkPastelGreen, t)!,
    );
  }

  @override
  SliderDiscretTheme copyWith({
    MaterialColor? sliderColors,
    Color? engineeringOrange,
    Color? sinopia,
    Color? cocoaBrown,
    Color? fulvous,
    Color? harvestGold,
    Color? citrine,
    Color? citrine2,
    Color? yellowGreen,
    Color? kellyGreen,
    Color? kellyGreen2,
    Color? arkPastelGreen,
  }) {
    return SliderDiscretTheme(
      engineeringOrange: engineeringOrange ?? this.engineeringOrange,
      sinopia: sinopia ?? this.sinopia,
      cocoaBrown: cocoaBrown ?? this.cocoaBrown,
      fulvous: fulvous ?? this.fulvous,
      harvestGold: harvestGold ?? this.harvestGold,
      citrine: citrine ?? this.citrine,
      citrine2: citrine2 ?? this.citrine2,
      yellowGreen: yellowGreen ?? this.yellowGreen,
      kellyGreen: kellyGreen ?? this.kellyGreen,
      kellyGreen2: kellyGreen2 ?? this.kellyGreen2,
      arkPastelGreen: arkPastelGreen ?? this.arkPastelGreen,
    );
  }
}
