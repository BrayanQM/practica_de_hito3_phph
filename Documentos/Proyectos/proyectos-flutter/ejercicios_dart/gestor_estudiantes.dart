import 'dart:io';

class Estudiante {
  String nombre;
  List<double> notas;

  Estudiante(this.nombre, this.notas);

  double calcularPromedio() {
    if (notas.isEmpty) return 0.0;
    return notas.reduce((a, b) => a + b) / notas.length;
  }

  @override
  String toString() {
    return 'Nombre: $nombre, Notas: $notas, Promedio: ${calcularPromedio().toStringAsFixed(2)}';
  }
}

void gestorEstudiantes() {
  List<Estudiante> estudiantes = [];
  bool salir = false;

  while (!salir) {
    print('\n=== GESTOR DE ESTUDIANTES ===');
    print('1: Agregar estudiante');
    print('2: Buscar estudiante por nombre');
    print('3: Mostrar todos los estudiantes');
    print('4: Mostrar promedio de notas');
    print('5: Salir');
    print('=============================');
    stdout.write('Seleccione una opción: ');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        agregarEstudiante(estudiantes);
        break;
      case '2':
        buscarEstudiante(estudiantes);
        break;
      case '3':
        mostrarTodosEstudiantes(estudiantes);
        break;
      case '4':
        mostrarPromedioGeneral(estudiantes);
        break;
      case '5':
        salir = true;
        print('¡Hasta luego!');
        break;
      default:
        print('Opción no válida. Intente nuevamente.');
    }
  }
}

void agregarEstudiante(List<Estudiante> estudiantes) {
  stdout.write('Ingrese el nombre del estudiante: ');
  String? nombre = stdin.readLineSync();

  if (nombre == null || nombre.isEmpty) {
    print('Nombre no válido');
    return;
  }

  List<double> notas = [];
  bool agregarNotas = true;

  while (agregarNotas) {
    stdout.write('Ingrese una nota (o "fin" para terminar): ');
    String? notaInput = stdin.readLineSync();

    if (notaInput?.toLowerCase() == 'fin') {
      agregarNotas = false;
    } else {
      try {
        double nota = double.parse(notaInput!);
        if (nota < 0 || nota > 100) {
          print('La nota debe estar entre 0 y 100');
        } else {
          notas.add(nota);
          print('Nota agregada: $nota');
        }
      } catch (e) {
        print('Ingrese un número válido o "fin" para terminar');
      }
    }
  }

  estudiantes.add(Estudiante(nombre, notas));
  print('Estudiante "$nombre" agregado exitosamente');
}

void buscarEstudiante(List<Estudiante> estudiantes) {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados');
    return;
  }

  stdout.write('Ingrese el nombre a buscar: ');
  String? nombre = stdin.readLineSync();

  if (nombre == null || nombre.isEmpty) {
    print('Nombre no válido');
    return;
  }

  List<Estudiante> encontrados = estudiantes
      .where((est) => est.nombre.toLowerCase().contains(nombre!.toLowerCase()))
      .toList();

  if (encontrados.isEmpty) {
    print('No se encontraron estudiantes con ese nombre');
  } else {
    print('\n=== ESTUDIANTES ENCONTRADOS ===');
    for (var est in encontrados) {
      print(est);
    }
  }
}

void mostrarTodosEstudiantes(List<Estudiante> estudiantes) {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados');
    return;
  }

  print('\n=== TODOS LOS ESTUDIANTES ===');
  for (int i = 0; i < estudiantes.length; i++) {
    print('${i + 1}. ${estudiantes[i]}');
  }
}

void mostrarPromedioGeneral(List<Estudiante> estudiantes) {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados');
    return;
  }

  double promedioGeneral = 0;
  int totalNotas = 0;

  for (var est in estudiantes) {
    promedioGeneral += est.calcularPromedio() * est.notas.length;
    totalNotas += est.notas.length;
  }

  if (totalNotas > 0) {
    promedioGeneral /= totalNotas;
    print(
      'Promedio general de todas las notas: ${promedioGeneral.toStringAsFixed(2)}',
    );
  } else {
    print('No hay notas registradas');
  }
}
