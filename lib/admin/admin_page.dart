import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/app_route.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text('Done'),
          onPressed: () {
            Navigator.popAndPushNamed(context, AppRoute.home);
          },
        ),
        middle: Text('Export Profiles'),
        trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              mainStore.share();
            },
            child: Icon(
              CupertinoIcons.share,
            )),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Observer(builder: (context) {
              final applicantsFuture =
                  Provider.of<MainStore>(context).applicants;
              if (applicantsFuture == null) {
                return Text('Nothing to show right now');
              }

              if (applicantsFuture.status == FutureStatus.pending) {
                return LinearProgressIndicator(
                  backgroundColor: theme.radiantRed,
                );
              }

              if (applicantsFuture.status == FutureStatus.rejected) {
                return Text('Failed to load applicants',
                    style: TextStyle(fontSize: 16, color: theme.radiantRed));
              }

              final applicants = applicantsFuture.value;
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final x = applicants[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                                radius: 32,
                                backgroundColor: theme.lightGray,
                                backgroundImage: x.picPath == null
                                    ? null
                                    : FileImage(
                                        File(x.picPath),
                                      )),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  x.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: theme.radiantRed),
                                ),
                                Text(
                                  x.email,
                                  style: TextStyle(
                                      color: theme.lightGray, fontSize: 13),
                                ),
                                Text(
                                  x.phone,
                                  style: TextStyle(
                                      color: theme.lightGray, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            x.jobCategory,
                            textAlign: TextAlign.right,
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: applicants.length,
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
