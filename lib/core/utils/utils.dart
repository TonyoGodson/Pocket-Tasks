


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocket_task/core/utils/colour_utils.dart';
import 'package:provider/provider.dart';

import '../../business_logic/providers/task_provider.dart';
import '../../data/models/task.dart';

String formatDate(String inputDate) {

  DateTime dt = DateTime.parse(inputDate);

  dt = DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second);

  String formattedDate = DateFormat('hh:mm a, EEEE d MMMM, y').format(dt);

  return formattedDate;
}

void showConfirmationDialog(BuildContext context, Task task) {
  final provider = Provider.of<TaskProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text('Do you want to proceed?'),
        actions: <Widget>[
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false); // Returns `false` (cancelled)
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true); // Returns `true` (proceed)
            },
          ),
        ],
      );
    },
  ).then((value) {
    if (value == true) {
      // Task? task;
      provider.deleteTask(task);
      Navigator.of(context).pop();
    } else {
      print('Cancelled');
    }
  });
}

kaushan({required BuildContext context, Color? c, bool? b, FontWeight? fw, double? fs, ht, FontStyle? fst}){
  return Theme.of(context).textTheme.bodyLarge?.copyWith(
    color: c??ColourUtils.BLACK54,
    fontFamily: 'Kaushan_Script',
    fontStyle: fst??FontStyle.normal,
    fontSize: fs??12,
    height: ht??1.5,
    fontWeight: b??false?FontWeight.bold:(fw??FontWeight.normal),
  );
}


kaushanLarge({required BuildContext context, required Task task, Color? c, bool? b, FontWeight? fw, double? fs, ht, FontStyle? fst}){
  return Theme.of(context).textTheme.bodyLarge?.copyWith(
    color: c??ColourUtils.BLACK_COLOR,
    fontFamily: 'Kaushan_Script',
    fontStyle: fst??FontStyle.normal,
    fontSize: fs??15.5,
    height: ht??1.5,
    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
    fontWeight: FontWeight.bold,
  );
}
