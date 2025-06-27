import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pocket_task/core/utils/colour_utils.dart';
import 'package:pocket_task/core/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../data/models/task.dart';


class TaskDetailsScreen extends StatelessWidget {
  final Task? task;
  const TaskDetailsScreen({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        actions: [
          IconButton(onPressed: (){
            showConfirmationDialog(context, task!);
          }, icon: Icon(Icons.delete))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Title:  ",
                          style: kaushan(context: context,),
                        ),
                        Text(task!.title),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Created At:  ",
                          style: kaushan(context: context,),
                        ),
                        Text(formatDate(task!.createdAt.toString())),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Due At:  ",
                          style: kaushan(context: context,),
                        ),
                        Text(formatDate(task!.dueDate.toString())),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Status:  ",
                          style: kaushan(context: context,),
                        ),
                        Text(task!.isCompleted ? "Completed":"Not Completed Yet"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(18.0, 20, 10, 0),
            padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: ColourUtils.BLACK54
              )
            ),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text(task!.note,
                  style: kaushan(context: context,),
                )),
          )
        ],
      ),
    );
  }
}
