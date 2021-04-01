import 'package:flutter/material.dart';

///We get the color'name by pass the hex color to this website https://colornamer.robertcooper.me
///If you have 32 bits color instead of hex color, use this website to convert 32 bits color to hex color
///https://convertingcolors.com/
class AppColors {
  static Color grey = Colors.grey;

  static Color white = Colors.white;
  static Color closeShutter = Color(0xFF26242e);
  static Color placebo = Color(0xFFe7e7e8);
  static Color witchesCauldron = Color(0xFf34323d);
  static Color satinDepBlack=Color(0xFF1E1F28);
  static Color raisinBlack=Color(0xFF222029);
  static Color lavenderBlueShadow=Color(0xFF8983F7);
  static Color malmoFF=Color(0xFFA3DAFB);

}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('FF');
    buffer.write(hexColor.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
