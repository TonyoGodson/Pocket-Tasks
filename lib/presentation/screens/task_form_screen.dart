import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/providers/task_provider.dart';
import '../../data/models/task.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;
  const TaskFormScreen({super.key, this.task});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _note;
  DateTime _dueDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _title = widget.task!.title;
      _note = widget.task!.note;
      _dueDate = widget.task!.dueDate;
    } else {
      _title = '';
      _note = '';
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final provider = Provider.of<TaskProvider>(context, listen: false);
      if (widget.task == null) {
        final task = Task(
          title: _title,
          note: _note,
          dueDate: _dueDate,
          createdAt: DateTime.now(),
        );
        provider.addTask(task);
      } else {
        widget.task!
          ..title = _title
          ..note = _note
          ..dueDate = _dueDate;
        provider.updateTask(widget.task!);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'New Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (val) =>
                val == null || val.isEmpty ? 'Enter a title' : null,
                onSaved: (val) => _title = val!,
              ),
              TextFormField(
                initialValue: _note,
                decoration: const InputDecoration(labelText: 'Note'),
                onSaved: (val) => _note = val ?? '',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Due Date:'),
                  const SizedBox(width: 8),
                  Text('${_dueDate.toLocal()}'.split(' ')[0]),
                  const Spacer(),
                  TextButton(
                    child: const Text('Select Date'),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _dueDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() {
                          _dueDate = picked;
                        });
                      }
                    },
                  )
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Save Task'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
