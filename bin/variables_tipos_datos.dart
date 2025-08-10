void main() {
  // 1) Constantes y variables base
  const double pi = 3.14159;               // compile-time
  final ahora = DateTime.now();             // runtime, una sola asignación

  var nombre = 'Ana';                       // inferido: String
  var edad = 28;                            // inferido: int
  String apellido = 'Pérez';                // explícito
  int anio = 2025;                          // explícito
  double altura = 1.75;                     // decimales
  num peso = 68;                            // int o double
  bool activo = true;                       // booleano

  // 2) Casos especiales: dynamic y null‑safety
  dynamic algo = 'Texto';
  algo = 123; // permitido con dynamic (pero úsalo con moderación)

  String? puedeSerNulo;                     // puede almacenar null
  // usar valor por defecto si es null
  puedeSerNulo ??= 'Valor por defecto';

  // 3) Conversiones de tipos
  var numeroStr = '42';
  int numero = int.parse(numeroStr);        // String → int

  var decimalStr = '3.14';
  double decimal = double.parse(decimalStr); // String → double

  String texto1 = numero.toString();        // int → String
  String texto2 = decimal.toStringAsFixed(2); // double → String con 2 decimales

  // 4) Salida (prints agrupados)
  print('$nombre $apellido, edad: $edad, año: $anio, altura: $altura, peso: $peso, activo: $activo');
  print('pi: $pi, ahora: $ahora');
  print('Valor nullable resuelto: $puedeSerNulo');
  print('Número: $numero, Decimal: $decimal');
  print('Textos: $texto1, $texto2');
  print (algo);
}