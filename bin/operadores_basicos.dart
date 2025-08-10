import 'dart:math';

void main() {
  int a = 10;
  int b = 3;

  // Matemáticos
  print('Suma: ${a + b}');
  print('Resta: ${a - b}');
  print('Multiplicación: ${a * b}');
  print('División decimal: ${a / b}');
  print('División entera: ${a ~/ b}');
  print('Módulo: ${a % b}');

  // Comparación
  print('a > b: ${a > b}');
  print('a < b: ${a < b}');
  print('a == b: ${a == b}');
  print('a != b: ${a != b}');

  // Asignación compuesta
  var x = 5;
  x += 2; // 7
  x *= 3; // 21
  print('Asignaciones compuestas: $x');

  // Operadores lógicos (ejemplo intuitivo)
   final r = Random();
  bool encendido = r.nextBool();
  bool tieneBateria = r.nextBool();

  print('¿Funciona el dispositivo? (AND) => ${encendido && tieneBateria}'); // Solo funciona si está encendido Y tiene batería
  print('¿Se enciende la pantalla? (OR) => ${encendido || tieneBateria}');   // Se enciende si está encendido O si la batería está cargada
  print('¿Está apagado? (NOT) => ${!encendido}'); 
}