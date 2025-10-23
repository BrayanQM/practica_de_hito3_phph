import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ejercicios_basicos_flutter/main.dart';

void main() {
  testWidgets('App carga correctamente y muestra el menú principal',
      (WidgetTester tester) async {
    // Construir nuestra app y ejecutar un frame
    await tester.pumpWidget(const MyApp());

    // Verificar que la app se carga con el título correcto
    expect(find.text('Ejercicios Básicos Flutter'), findsOneWidget);

    // Verificar que todos los ejercicios están en el menú
    expect(find.text('Ejercicio 1: Hola Mundo con Toast'), findsOneWidget);
    expect(find.text('Ejercicio 2: Mostrar texto en TextView'), findsOneWidget);
    expect(find.text('Ejercicio 3: Cambiar color de fondo'), findsOneWidget);
    expect(find.text('Ejercicio 4: Contador simple'), findsOneWidget);
    expect(find.text('Ejercicio 5: Mostrar imagen oculta'), findsOneWidget);
  });

  testWidgets('Navegación al Ejercicio 1 funciona correctamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap en el primer ejercicio
    await tester.tap(find.text('Ejercicio 1: Hola Mundo con Toast'));
    await tester.pumpAndSettle();

    // Verificar que estamos en la pantalla del Ejercicio 1
    expect(find.text('Ejercicio 1: Hola Mundo con Toast'), findsOneWidget);
    expect(find.text('Mostrar Toast'), findsOneWidget);
  });
}
