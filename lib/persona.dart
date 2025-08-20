class Persona {
  String nombre;
  int edad;
  int peso;
  String Rut;

  Persona(this.nombre, this.edad, this.peso, this.Rut);

  //get
  int get getEdad => edad;

  //set
  set setEdad(int edad) {
    if (getEdad < 0) {
      throw Exception("La edad no puede ser negativa");
    } else {
      this.edad = edad;
    }
  }
}
