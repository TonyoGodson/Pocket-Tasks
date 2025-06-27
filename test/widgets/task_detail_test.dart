import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_task/business_logic/providers/task_provider.dart';
import 'package:pocket_task/presentation/screens/task_form_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('TaskFormScreen shows title, note, date button, and save button',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (_) => TaskProvider(),
            child: const MaterialApp(home: TaskFormScreen()),
          ),
        );

        expect(find.byType(TextFormField), findsNWidgets(2)); // title + note
        expect(find.text('Select Date'), findsOneWidget);
        expect(find.text('Save Task'), findsOneWidget);
      });
}
