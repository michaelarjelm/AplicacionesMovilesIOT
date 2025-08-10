// Lección: Control de flujo en Dart — Todo en un solo archivo

void main() {
  // if / else
  int edad = 20;
  if (edad >= 18) {
    print('Mayor de edad');
  } else {
    print('Menor de edad');
  }

  // if / else if / else
  int nota = 85;
  if (nota >= 90) {
    print('Excelente');
  } else if (nota >= 70) {
    print('Aprobado');
  } else {
    print('Reprobado');
  }

  // switch
  String dia = 'ma';
  switch (dia) {
    case 'lu':
      print('Lunes');
      break;
    case 'ma':
      print('Martes');
      break;
    case 'mi':
      print('Miércoles');
      break;
    case 'ju':
      print('Jueves');
      break;
    case 'vi':
      print('Viernes');
      break;
    default:
      print('Fin de semana o valor desconocido');
  }

  // for clásico
  for (int i = 1; i <= 3; i++) {
    print('Iteración for: $i');
  }

  // for-in
  List<String> frutas = ['Manzana', 'Pera', 'Uva'];
  for (var fruta in frutas) {
    print('Fruta: $fruta');
  }

  // while
  int contador = 0;
  while (contador < 3) {
    print('While contador: $contador');
    contador++;
  }

  // do-while
  int intentos = 0;
  do {
    print('Intento #$intentos');
    intentos++;
  } while (intentos < 2);

  // break y continue
  for (int i = 0; i < 5; i++) {
    if (i.isOdd) continue; // solo pares
    if (i == 4) break; // sale en 4
    print('Número: $i');
  }



  // Operador ternario
  String permiso = edad >= 18 ? 'Adulto' : 'Menor';
  print('Permiso: $permiso');

  // Operadores null-aware
  String? nombre;
String saludo = 'Hola ${nombre ?? 'invitado'}';

  print(saludo);

  String? texto;                // null
  var len = texto?.length ?? 0; // si es null, usa 0
  print('Longitud segura: $len');

  texto ??= 'nuevo texto';
  print('Texto ahora: $texto');

}