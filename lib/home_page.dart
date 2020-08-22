import 'package:example_bloc_pattern/empleado.dart';
import 'package:example_bloc_pattern/empleado_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EmpleadoBloc _empleadoBloc = EmpleadoBloc();

  @override
  void dispose() {
    _empleadoBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Empleado'),
      ),
      body: Container(
        child: StreamBuilder<List<Empleado>>(
          stream: _empleadoBloc.empleadoListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Empleado>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '${snapshot.data[index].id} .',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${snapshot.data[index].nombre} .',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '\$${snapshot.data[index].salario} .',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                            ),
                            color: Colors.green,
                            onPressed: () {
                              _empleadoBloc.empleadoSalarioIncrement
                                  .add(snapshot.data[index]);
                            }),
                      ),
                      Container(
                        child: IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                            ),
                            color: Colors.red,
                            onPressed: () {
                              _empleadoBloc.empleadoSalarioDecrement
                                  .add(snapshot.data[index]);
                            }),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
