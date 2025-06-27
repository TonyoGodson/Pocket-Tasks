
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_task/business_logic/providers/task_provider.dart';
import 'package:pocket_task/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Home screen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    expect(find.text('Pocket Tasks'), findsOneWidget);
  });
}