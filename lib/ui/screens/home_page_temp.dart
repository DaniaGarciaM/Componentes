import 'package:componentes/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes de Flutter'),
      ),
      body: _lista(),
    );
  }
}

Widget _lista() {
  /* Recuperación de datos de un archivo json
  print(menuProvider.opciones);
  menuProvider.loadData().then((opciones) {
    print('_lista: ');
    print(opciones);
  });
  return ListView(
    children: _listaItems(),
  );*/
  return FutureBuilder(
    future:  menuProvider.loadData(), //indicando lo que queremos esperar
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      //print('builder: ');
      //print(snapshot.data);
      return ListView(
        children: _listaItems(snapshot.data as List<dynamic>),
      );
    },
    );
}

List<Widget> _listaItems(List<dynamic> data) {
  final List<Widget> opciones = [];
  data.forEach((opt) {
    final tile = ListTile(
      title: Text(opt['texto']),
      leading: const Icon(Icons.account_box, color: Colors.blueAccent,),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color:  Colors.blue,
      ),
      onTap: () {},
    );
    opciones
      ..add(tile)
      ..add(const Divider());
  });
  return opciones;
  /*return const [
    ListTile(
      title: Text('Covers Glee'),
      subtitle: Text('Los mejores covers infravalorados'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Danna Paola'),
      subtitle: Text('Sie7e es su mejor disco'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Covers Glee'),
      subtitle: Text('Los mejores covers infravalorados'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Danna Paola'),
      subtitle: Text('Sie7e es su mejor disco'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Covers Glee'),
      subtitle: Text('Los mejores covers infravalorados'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Danna Paola'),
      subtitle: Text('Sie7e es su mejor disco'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Covers Glee'),
      subtitle: Text('Los mejores covers infravalorados'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Danna Paola'),
      subtitle: Text('Sie7e es su mejor disco'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Covers Glee'),
      subtitle: Text('Los mejores covers infravalorados'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Danna Paola'),
      subtitle: Text('Sie7e es su mejor disco'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Covers Glee'),
      subtitle: Text('Los mejores covers infravalorados'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
    ListTile(
      title: Text('Danna Paola'),
      subtitle: Text('Sie7e es su mejor disco'),
    ),
    Divider(
      thickness: 2.0,
      color: Color.fromARGB(255, 252, 178, 203),
    ),
  ];*/
}
