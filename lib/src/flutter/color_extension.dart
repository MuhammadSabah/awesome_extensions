import 'dart:ui';

/// Extension on the [Color] class to provide additional functionality.
extension ColorExtension on Color {
  /// Returns the alpha component of the color.
  int get alphaValue => alpha;

  /// Returns the red component of the color.
  int get redValue => red;

  /// Returns the green component of the color.
  int get greenValue => green;

  /// Returns the blue component of the color.
  int get blueValue => blue;

  /// Returns the brightness of the color.
  ///
  /// The brightness is calculated as the average of the red, green, and blue components.
  double get brightness => (red + green + blue) / 3;

  /// Returns the hex value of the color.
  String get hex {
    final redHex = red.toRadixString(16).padLeft(2, '0');
    final greenHex = green.toRadixString(16).padLeft(2, '0');
    final blueHex = blue.toRadixString(16).padLeft(2, '0');
    final alphaHex = alpha.toRadixString(16).padLeft(2, '0');
    return '#$alphaHex$redHex$greenHex$blueHex';
  }

  /// Darkens the color by a specified percentage.
  ///
  /// The [percent] parameter specifies the percentage by which the color should be darkened.
  /// The value of [percent] should be between 0 and 100.
  ///
  /// Returns a new [Color] object that represents the darkened color.
  Color darken([int percent = 10]) {
    assert(0 <= percent && percent <= 100);
    final f = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * f).round(),
      (green * f).round(),
      (blue * f).round(),
    );
  }

  /// Creates a [Color] object from a hex string.
  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Lightens the color by a specified percentage.
  ///
  /// The [percent] parameter specifies the percentage by which the color should be lightened.
  /// The value of [percent] should be between 0 and 100.
  ///
  /// Returns a new [Color] object that represents the lightened color.
  Color lighten([int percent = 10]) {
    assert(0 <= percent && percent <= 100);
    final p = percent / 100;
    return Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }

  /// Returns a new [Color] object with the specified alpha value.
  ///
  /// The [alphaValue] parameter specifies the new alpha value, which should be between 0 and 255.
  Color withAlpha(int alphaValue) {
    assert(0 <= alphaValue && alphaValue <= 255);
    return Color.fromARGB(alphaValue, red, green, blue);
  }

  /// Returns a new [Color] object with the specified blue value.
  ///
  /// The [blueValue] parameter specifies the new blue value, which should be between 0 and 255.
  Color withBlue(int blueValue) {
    assert(0 <= blueValue && blueValue <= 255);
    return Color.fromARGB(alpha, red, green, blueValue);
  }

  /// Returns a new [Color] object with the specified brightness value.
  ///
  /// The [brightness] parameter specifies the new brightness value, which should be between 0 and 1.
  Color withBrightness(double brightness) {
    assert(0 <= brightness && brightness <= 1);
    final newBrightness = (brightness * 255).toInt();
    return Color.fromARGB(alpha, newBrightness, newBrightness, newBrightness);
  }

  /// Returns a new [Color] object with the specified green value.
  ///
  /// The [greenValue] parameter specifies the new green value, which should be between 0 and 255.
  Color withGreen(int greenValue) {
    assert(0 <= greenValue && greenValue <= 255);
    return Color.fromARGB(alpha, red, greenValue, blue);
  }

  /// Returns a new [Color] object with the specified red value.
  ///
  /// The [redValue] parameter specifies the new red value, which should be between 0 and 255.
  Color withRed(int redValue) {
    assert(0 <= redValue && redValue <= 255);
    return Color.fromARGB(alpha, redValue, green, blue);
  }
}
