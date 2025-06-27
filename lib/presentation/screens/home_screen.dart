import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business_logic/providers/task_provider.dart';
import '../widgets/task_tile.dart';
import 'task_form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    final tasks = provider.filteredTasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pocket Tasks'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'due') {
                provider.sortByDueDate();
              } else {
                provider.sortByCreatedDate();
              }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'due', child: Text('Sort by Due Date')),
              const PopupMenuItem(value: 'created', child: Text('Sort by Created Date')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          ToggleButtons(
            borderRadius: BorderRadius.circular(15),
            isSelected: [
              provider.filter == Filter.all,
              provider.filter == Filter.active,
              provider.filter == Filter.completed,
            ],
            onPressed: (index) {
              provider.setFilter(Filter.values[index]);
            },
            children: const [
              Padding(padding: EdgeInsets.all(8.0), child: Text('All')),
              Padding(padding: EdgeInsets.all(8.0), child: Text('Active')),
              Padding(padding: EdgeInsets.all(8.0), child: Text('Completed')),
            ],
          ),
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text('No tasks yet.'))
                : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, i) => TaskTile(task: tasks[i]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const TaskFormScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
