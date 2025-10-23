import 'dart:io';

// Importar las funciones de los otros archivos
import 'calculadora.dart';
import 'gestor_estudiantes.dart';

void main() {
  bool salir = false;

  while (!salir) {
    print('\n=== SISTEMAS OPERATIVOS MÓVILES Y EMBEDIDOS ===');
    print('1. Calculadora');
    print('2. Gestor de Estudiantes');
    print('3. Salir');
    print('==============================================');
    stdout.write('Seleccione una aplicación: ');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        calculadora();
        break;
      case '2':
        gestorEstudiantes();
        break;
      case '3':
        salir = true;
        print('¡Gracias por usar nuestras aplicaciones!');
        break;
      default:
        print('Opción no válida. Intente nuevamente.');
    }
  }
}
