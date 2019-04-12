import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';


class JobCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageView(
        child: GridView.count(
      primary: true,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: <Widget>[
        CircularButton(textContent: 'Yes \r Why not?', onSelected: () {
          print('onSelected');
          return Navigator.pushNamed(context, '/jobs');
        })  ,
        const Text('Heed not the rabble'),
        const Text('Sound of screams but the'),
        const Text('Who scream'),
        const Text('Revolution is coming...'),
        const Text('Revolution, they...'),
      ],
    ));
  }
}
