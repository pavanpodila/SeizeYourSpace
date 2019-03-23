import 'package:flutter/cupertino.dart';

class AppPageView extends StatelessWidget {
  AppPageView({@required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Padding(padding: const EdgeInsets.all(8.0), child: child)));
  }
}
