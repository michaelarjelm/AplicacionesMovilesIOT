class Persona {
  String nombre;
  int _edad; // privada por convención

  static int contador = 0; // variable de clase (compartida)

  // Constructor principal
  Persona(this.nombre, this._edad) {
    contador++;
  }

  // Constructor nombrado
  Persona.sinEdad(this.nombre) : _edad = 0 {
    contador++;
  }

  // Getter
  int get edad => _edad;

  // Setter
  set edad(int nuevaEdad) {
    if (nuevaEdad >= 0) {
      _edad = nuevaEdad;
    }
  }

  // Método de instancia
  void saludar() {
    print('Hola, soy $nombre y tengo $_edad años.');
  }

  // Método estático
  static void mostrarContador() {
    print('Se han creado $contador personas.');
  }
}
