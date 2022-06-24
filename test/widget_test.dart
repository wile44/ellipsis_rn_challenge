// This is a basic Flutter widget test.






import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ellipsis_rn_challenge/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    
    

    
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
