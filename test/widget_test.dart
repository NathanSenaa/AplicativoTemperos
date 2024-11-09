// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temperos_app/main.dart';

void main() {
  testWidgets('Teste de navegação entre telas', (WidgetTester tester) async {
    await tester.pumpWidget(TemperosApp());

    expect(find.text('Sena Condimentos'), findsOneWidget);
    await tester.tap(find.text('Entrar no Catálogo'));
    await tester.pumpAndSettle();

    expect(find.text('Catálogo de Temperos'), findsOneWidget);
  });
}
