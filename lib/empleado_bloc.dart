// Siete pasos para implementar el patron bloc

// 1. imports
// 2. Lista de empleados
// 3. Stream Controller
// 4. Stream sink Getters
// 5. Constructor , añadir data, escuchar cambios
// 6. Funciones principales
// 7. Dispose

import 'dart:async';
import 'empleado.dart';

class EmpleadoBloc {
  List<Empleado> _empleadosList = [
    Empleado(1, 'Emplado 1', 2.000),
    Empleado(2, 'Emplado 2', 4.000),
    Empleado(3, 'Emplado 3', 3.000),
    Empleado(4, 'Emplado 4', 6.000),
    Empleado(5, 'Emplado 5', 7.000),
  ];

  // Stream Controller

  // obtener lista de empleados
  final _empleadoListStreamController = StreamController<List<Empleado>>();

  // incrementar salario de empleado
  final _empleadoSalarioIncrementStreamController =
      StreamController<Empleado>();
  final _empleadoSalarioDecrementStreamController =
      StreamController<Empleado>();

  // Getter; strams y sinks
  Stream<List<Empleado>> get empleadoListStream =>
      _empleadoListStreamController.stream;
  StreamSink<List<Empleado>> get empleadoListSink =>
      _empleadoListStreamController.sink;

  StreamSink<Empleado> get empleadoSalarioIncrement =>
      _empleadoSalarioIncrementStreamController.sink;
  StreamSink<Empleado> get empleadoSalarioDecrement =>
      _empleadoSalarioDecrementStreamController.sink;

  // constructor
  // ignore: non_constant_identifier_names
  EmpleadoBloc() {
    _empleadoListStreamController.add(_empleadosList);
    _empleadoSalarioIncrementStreamController.stream.listen(_incrementSalario);
    _empleadoSalarioDecrementStreamController.stream.listen(_decrementSalario);
  }

  // funciones principales
  _incrementSalario(Empleado empleado) {
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20 / 100;

    _empleadosList[empleado.id - 1].salario = salarioActual + salarioIncrement;
    empleadoListSink.add(_empleadosList);
  }

  _decrementSalario(Empleado empleado) {
    double salarioActual = empleado.salario;
    double salarioDecrement = salarioActual * 20 / 100;

    _empleadosList[empleado.id - 1].salario = salarioActual - salarioDecrement;
    empleadoListSink.add(_empleadosList);
  }

  // dispose
  void dispose() {
    _empleadoListStreamController.close();
    _empleadoSalarioIncrementStreamController.close();
    _empleadoSalarioDecrementStreamController.close();
  }
}
