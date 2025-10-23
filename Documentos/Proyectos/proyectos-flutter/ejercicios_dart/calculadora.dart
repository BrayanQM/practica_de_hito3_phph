import 'dart:io';

void calculadora() {
  bool salir = false;

  while (!salir) {
    print('\n=== CALCULADORA ===');
    print('1: Sumar');
    print('2: Restar');
    print('3: Multiplicar');
    print('4: Dividir');
    print('5: Salir');
    print('===================');
    stdout.write('Seleccione una opción: ');

    String? input = stdin.readLineSync();

    if (input == '5') {
      salir = true;
      print('¡Hasta luego!');
      continue;
    }

    if (input == null || !['1', '2', '3', '4'].contains(input)) {
      print('Opción no válida. Intente nuevamente.');
      continue;
    }

    stdout.write('Ingrese el primer número: ');
    String? num1Input = stdin.readLineSync();
    stdout.write('Ingrese el segundo número: ');
    String? num2Input = stdin.readLineSync();

    try {
      double num1 = double.parse(num1Input!);
      double num2 = double.parse(num2Input!);
      double resultado;

      switch (input) {
        case '1':
          resultado = num1 + num2;
          print('Resultado: $num1 + $num2 = $resultado');
          break;
        case '2':
          resultado = num1 - num2;
          print('Resultado: $num1 - $num2 = $resultado');
          break;
        case '3':
          resultado = num1 * num2;
          print('Resultado: $num1 × $num2 = $resultado');
          break;
        case '4':
          if (num2 == 0) {
            print('Error: No se puede dividir entre cero');
          } else {
            resultado = num1 / num2;
            print('Resultado: $num1 ÷ $num2 = $resultado');
          }
          break;
      }
    } catch (e) {
      print('Error: Ingrese números válidos');
    }
  }
}
