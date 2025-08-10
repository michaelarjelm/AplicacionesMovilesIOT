void main() {
  print('=== Funciones Básicas ===');
  saludar(); // función sin parámetros ni retorno
  String saludo = obtenerSaludo();
  print(saludo);

  print('\n=== Funciones con parámetros ===');
  saludarA('Ana'); // parámetro posicional
  imprimirSuma(3, 5); // dos parámetros

  print('\n=== Funciones con retorno ===');
  int r = sumar(4, 7);
  print('Suma retornada: $r');

  print('\n=== Parámetros opcionales posicionales ===');
  mostrarUsuario('Luis');             // solo nombre
  mostrarUsuario('Luis', 25);         // nombre y edad

  print('\n=== Parámetros opcionales nombrados ===');
  mostrarProducto(nombre: 'Laptop');
  mostrarProducto(nombre: 'Laptop', precio: 1200);

  print('\n=== Parámetros nombrados requeridos ===');
  mostrarRectangulo(ancho: 5, alto: 3);

  print('\n=== Valores por defecto ===');
  imprimirMensaje(); // usa valores por defecto
  imprimirMensaje(texto: 'Hola', veces: 2);

  print('\n=== Funciones flecha (Arrow functions) ===');
  print('Doblar 4: ${doblar(4)}');

  print('\n=== Funciones como variables ===');
  var miFuncion = (String nombre) => 'Hola $nombre';
  print(miFuncion('Carla'));

  print('\n=== Funciones que reciben funciones (callback) ===');
  procesarLista([1, 2, 3], (n) => n * 2);

  print('\n=== Funciones anidadas ===');
  funcionExterior();
}

// ===== Ejemplos de funciones =====

// Sin parámetros ni retorno
void saludar() {
  print('Hola desde saludar()');
}

// Sin parámetros, con retorno
String obtenerSaludo() {
  return 'Hola desde obtenerSaludo()';
}

// Con parámetros posicionales
void saludarA(String nombre) {
  print('Hola $nombre');
}

void imprimirSuma(int a, int b) {
  print('La suma de $a + $b es ${a + b}');
}

// Con retorno
int sumar(int a, int b) {
  return a + b;
}

// Parámetros opcionales posicionales (entre [])
void mostrarUsuario(String nombre, [int? edad]) {
  if (edad != null) {
    print('Usuario: $nombre, Edad: $edad');
  } else {
    print('Usuario: $nombre');
  }
}

// Parámetros opcionales nombrados (entre {})
void mostrarProducto({String? nombre, double? precio}) {
  print('Producto: $nombre, Precio: ${precio ?? 'No especificado'}');
}

// Parámetros nombrados requeridos
void mostrarRectangulo({required int ancho, required int alto}) {
  print('Rectángulo de ${ancho}x$alto');
}

// Valores por defecto
void imprimirMensaje({String texto = 'Sin mensaje', int veces = 1}) {
  for (int i = 0; i < veces; i++) {
    print(texto);
  }
}

// Función flecha (para una sola expresión)
int doblar(int n) => n * 2;

// Funciones que reciben funciones (callback)
void procesarLista(List<int> lista, int Function(int) operacion) {
  for (var elemento in lista) {
    print('Procesado: ${operacion(elemento)}');
  }
}

// Funciones anidadas
void funcionExterior() {
  print('Estamos en funcionExterior()');

  void funcionInterior() {
    print('Estamos en funcionInterior()');
  }

  funcionInterior(); // Llamada a la función interna
}
