import 'package:flutter/cupertino.dart';
import 'package:photo_job/core/app_page_view.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageView(child: Column(
      children: <Widget>[
        Text('Details'),
        CupertinoButton(child: Text('Back home'), onPressed: (){
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },)
      ],
    ));
  }
}
