import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business_logic/providers/task_provider.dart';
import '../../core/utils/utils.dart';
import '../../data/models/task.dart';
import '../screens/task_details_screen.dart';
import '../screens/task_form_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);

    return ListTile(
      title: Text(task.title,
          style: kaushanLarge(context: context, task: task),
      ),
      subtitle: Text(
                  task.note.length > 40 ? '${task.note.substring(0, 40)}...' : task.note,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                style: kaushan(context: context,),
      ),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (_) => provider.toggleComplete(task),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => TaskDetailsScreen(task: task)));
      },
      onLongPress: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => TaskFormScreen(task: task)));
        // provider.deleteTask(task);
      },
    );
  }
}
