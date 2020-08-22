class Empleado {
  int _id;
  String _nombre;
  double _salario;

  Empleado(this._id, this._nombre, this._salario);

  // setters
  set id(int value) => this._id = value;
  set nombre(String value) => this._nombre = value;
  set salario(double value) => this._salario = value;

  // getters
  int get id => this._id;
  String get nombre => this._nombre;
  double get salario => this._salario;

}
