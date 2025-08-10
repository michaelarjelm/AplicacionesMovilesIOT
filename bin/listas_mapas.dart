void main() {
  // ===== LISTAS =====
  print('=== LISTAS ===');
  // Declaración
  List<String> frutas = ['Manzana', 'Pera', 'Uva'];
  print('Lista inicial: $frutas');

  // Acceso por índice
  print('Primera fruta: ${frutas[0]}');

  // Modificar
  frutas[1] = 'Plátano';
  print('Lista modificada: $frutas');

  // Agregar
  frutas.add('Sandía');
  frutas.insert(1, 'Durazno');
  print('Lista con agregados: $frutas');

  // Eliminar
  frutas.remove('Uva');
  frutas.removeAt(0);
  print('Lista tras eliminar: $frutas');

  // Recorrer
  print('Recorriendo con forEach:');
  frutas.forEach((f) => print('- $f'));

  // Transformar
  List<int> numeros = [1, 2, 3, 4, 5];
  var cuadrados = numeros.map((n) => n * n).toList();
  print('Cuadrados: $cuadrados');

  // Filtrar
  var pares = numeros.where((n) => n.isEven).toList();
  print('Pares: $pares');

  // Buscar
  print('Contiene el 3: ${numeros.contains(3)}');
  print('Índice del 4: ${numeros.indexOf(4)}');

  // Spread operator
  //El ...numeros toma cada elemento de la lista numeros y lo “pega” dentro de listaB.
  var listaB = [0, ...numeros, 6];
  print('Lista con spread: $listaB');

  // Lista inmutable
  final inmutable = List.unmodifiable([10, 20, 30]);
  print('Lista inmutable: $inmutable');

  // ===== MAPAS =====
  print('\n=== MAPAS ===');
  Map<String, int> edades = {
    'Ana': 28,
    'Luis': 35,
    'Carla': 22
  };
  print('Mapa inicial: $edades');

  // Acceso por clave
  print('Edad de Ana: ${edades['Ana']}');

  // Agregar y modificar
  edades['Pedro'] = 40;
  edades['Ana'] = 29;
  print('Mapa modificado: $edades');

  // Eliminar
  edades.remove('Carla');
  print('Mapa tras eliminar: $edades');

  // Recorrer
  print('Recorriendo con forEach:');
  edades.forEach((nombre, edad) {
    print('$nombre tiene $edad años');
  });

  print('Recorriendo con for-in:');
  for (var entry in edades.entries) {
    print('${entry.key} → ${entry.value}');
  }

  // Métodos útiles
  print('Claves: ${edades.keys}');
  print('Valores: ${edades.values}');
  print('¿Tiene clave \"Luis\"? ${edades.containsKey('Luis')}');
  print('¿Tiene valor 35? ${edades.containsValue(35)}');

  // Crear un mapa desde una lista
  var frutasLista = ['Manzana', 'Pera', 'Uva'];
  var precios = Map.fromIterable(
    frutasLista,
    key: (f) => f,
    value: (f) => f.length * 10
  );
  print('Mapa desde lista: $precios');
}
