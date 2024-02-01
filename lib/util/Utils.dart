
import 'dart:ui';

class Utils{

  /// '#FFC700' 형식의 String을  0xFFffffff형식의 int로 변환하여 반환
  Color hexToColor(String hexString){

    //# 제거 후 16진수로 변환
    int hexValue = int.parse(hexString.substring(1), radix: 16);
    print(hexValue);
    print(hexValue);
    return Color(hexValue | 0xFF000000);
  }


  static Color stringToColor(String rawText) {
    var text = rawText.replaceFirst('#', '');
    if (text.length == 3) {
      text = text.replaceAllMapped(RegExp(r"[a-f]|\d", caseSensitive: false),
              (match) => '${match.group(0)}${match.group(0)}');
    }
    text = "0xFF$text";
    return Color(int.parse(text));
  }


  // static Color? expressionToColor(css.Expression? value) {
  //   if (value != null) {
  //     if (value is css.HexColorTerm) {
  //       return stringToColor(value.text);
  //     } else if (value is css.FunctionTerm) {
  //       if (value.text == 'rgba' || value.text == 'rgb') {
  //         return rgbOrRgbaToColor(value.span!.text);
  //       } else if (value.text == 'hsla' || value.text == 'hsl') {
  //         return hslToRgbToColor(value.span!.text);
  //       }
  //     } else if (value is css.LiteralTerm) {
  //       return namedColorToColor(value.text);
  //     }
  //   }
  //   return null;
  // }
  //
  //
  // static Color? rgbOrRgbaToColor(String text) {
  //   final rgbaText = text.replaceAll(')', '').replaceAll(' ', '');
  //   try {
  //     final rgbaValues =
  //     rgbaText.split(',').map((value) => double.parse(value)).toList();
  //     if (rgbaValues.length == 4) {
  //       return Color.fromRGBO(
  //         rgbaValues[0].toInt(),
  //         rgbaValues[1].toInt(),
  //         rgbaValues[2].toInt(),
  //         rgbaValues[3],
  //       );
  //     } else if (rgbaValues.length == 3) {
  //       return Color.fromRGBO(
  //         rgbaValues[0].toInt(),
  //         rgbaValues[1].toInt(),
  //         rgbaValues[2].toInt(),
  //         1.0,
  //       );
  //     }
  //     return null;
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // static Color hslToRgbToColor(String text) {
  //   final hslText = text.replaceAll(')', '').replaceAll(' ', '');
  //   final hslValues = hslText.split(',').toList();
  //   List<double?> parsedHsl = [];
  //   for (var element in hslValues) {
  //     if (element.contains("%") &&
  //         double.tryParse(element.replaceAll("%", "")) != null) {
  //       parsedHsl.add(double.tryParse(element.replaceAll("%", ""))! * 0.01);
  //     } else {
  //       if (element != hslValues.first &&
  //           (double.tryParse(element) == null ||
  //               double.tryParse(element)! > 1)) {
  //         parsedHsl.add(null);
  //       } else {
  //         parsedHsl.add(double.tryParse(element));
  //       }
  //     }
  //   }
  //   if (parsedHsl.length == 4 && !parsedHsl.contains(null)) {
  //     return HSLColor.fromAHSL(
  //         parsedHsl.last!, parsedHsl.first!, parsedHsl[1]!, parsedHsl[2]!)
  //         .toColor();
  //   } else if (parsedHsl.length == 3 && !parsedHsl.contains(null)) {
  //     return HSLColor.fromAHSL(
  //         1.0, parsedHsl.first!, parsedHsl[1]!, parsedHsl.last!)
  //         .toColor();
  //   } else {
  //     return Colors.black;
  //   }
  // }
  //
  // static Color? namedColorToColor(String text) {
  //   String namedColor = namedColors.keys.firstWhere(
  //           (element) => element.toLowerCase() == text.toLowerCase(),
  //       orElse: () => "");
  //   if (namedColor != "") {
  //     return stringToColor(namedColors[namedColor]!);
  //   } else {
  //     return null;
  //   }
  // }



}