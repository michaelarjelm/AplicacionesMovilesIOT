import 'dart:io';

import 'package:proyecto_uno/persona.dart';

void main(List<String> arguments) {
  //  stdout.write("Ingrese su nombre: ");
  // String? nombre = stdin.readLineSync();
  // stdout.write("Ingrese su edad: ");
  // String? edad = stdin.readLineSync();
  // var edadInt = int.parse(edad!);

  // print("El usuario se llama $nombre");
  // print("El usuario tiene $edad años");

  // if (edadInt > 17) {
  //   print("$nombre es mayor de edad");
  // } else {
  //   print("$nombre es menor de edad");
  // }

  // String dia = "martes";
  // switch (dia) {
  //   case "lunes":
  //     print("Hoy es lunes");
  //     break;
  //   case "martes":
  //     print("Hoy toca clases de Dart∂");
  //     break;
  //   case "miercoles":
  //     print("Hoy es miercoles");
  //     break;
  //   case "jueves":
  //     print("Hoy es jueves");
  //     break;
  //   case "viernes":
  //     print("Hoy es viernes");
  //     break;
  //   case "sabado":
  //     print("Hoy es sabado");
  //     break;
  //   case "domingo":
  //     print("Hoy es domingo");
  //     break;
  //   default:
  //     print("No es un dia valido");
  // }

  // List<String> alumnos = ["Juan", "Maria", "Pedro", "Ana"];

  // alumnos.insert(1, "Luis");
  // alumnos.add("Carlos");
  // alumnos.remove("Pedro");
  // alumnos[1] = "Marcela";

  // for (var alumno in alumnos) {
  //   print("El alumno es: $alumno");
  // }

  // Map<String, int> notas = {
  //   "Juan": 8,
  //   "Maria": 9,
  //   "Pedro": 7,
  //   "Ana": 9,
  //   "Luis": 8,
  //   "Carlos": 8,
  //   "Marcela": 9,
  // };

  // print(notas);
  // print("la nota de Juan es: ${notas["Juan"]}");

  // int? nota = notas["Juan"];

  // notas.addEntries([MapEntry("Lucia", 10), MapEntry("Roberto", 6)]);
  // print(notas);
  // print(notas.keys);
  // print(notas.values);

  // void saludar(String nombre, String apellido) {
  //   print("Hola $nombre $apellido");
  // }

  // saludar("Juan", "Perez");

  // int multiplicacion(int a, int b) {
  //   return a * b;
  // }

  // int resultado = multiplicacion(5, 10);
  // print("El resultado de la multiplicacion es: $resultado");

  Persona usuario = Persona("Juan", 25, 70, "12345678-9");
  print("El usuario se llama: ${usuario.nombre}");
}
