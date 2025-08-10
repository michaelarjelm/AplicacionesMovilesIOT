// bin/main.dart
import 'package:proyecto_uno/entidades/persona.dart';

void main() {
  var persona1 = Persona('Ana', 28);
  persona1.saludar();

  persona1.edad = 29; // usa setter
  print('Edad actualizada: ${persona1.edad}'); // usa getter

  var persona2 = Persona.sinEdad('Luis');
  persona2.saludar();

  Persona.mostrarContador(); // método estático
}
