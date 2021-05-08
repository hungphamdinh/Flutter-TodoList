import 'dart:ui';

const appBlack = const Color(0x000);
const appPrimary = const Color(0xFF7349FE);
Color appPrimaryLight = HexColor.fromHex('#a459ff');
Color appWhite = HexColor.fromHex('#ffffff');
const appLightPurple = const Color(0xFF86829D);
const appBlue = const Color(0xFF211551);
const appPink = const Color(0xFFFE3577);
Color appLightGray = HexColor.fromHex('#c4c4c4');

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}