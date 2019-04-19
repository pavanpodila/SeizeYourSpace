import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const PROFILE_PATH = '/profiles';
const PICTURES_PATH = '$PROFILE_PATH/pictures';

class Theme {
  Theme(
      {this.radiantRed,
      this.blue,
      this.green,
      this.lightGray,
      this.yellow,
      this.black,
      this.actionTextStyle,
      this.headingTextStyle,
      this.bodyTextStyle,
      this.captionTextStyle});

  final TextStyle actionTextStyle;
  final TextStyle headingTextStyle;
  final TextStyle bodyTextStyle;
  final TextStyle captionTextStyle;

  final Color radiantRed;
  final Color blue;
  final Color lightGray;
  final Color green;
  final Color black;
  final Color yellow;
}

final primaryColor = Color.fromARGB(255, 254, 65, 77);
// rgb(255, 63, 76)
final theme = Theme(
    radiantRed: primaryColor,
    blue: Color.fromARGB(255, 7, 159, 255),
    green: Color.fromARGB(255, 0, 230, 195),
    lightGray: Colors.grey,
    black: Color.fromARGB(255, 0, 0, 0),
    yellow: Color.fromARGB(255, 255, 230, 59),
    actionTextStyle: TextStyle(fontSize: 16),
    bodyTextStyle: TextStyle(fontSize: 16),
    captionTextStyle: TextStyle(fontSize: 12, color: primaryColor),
    headingTextStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor));

class PSBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/banner.png',
    );
  }
}
