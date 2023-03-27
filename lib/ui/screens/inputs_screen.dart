import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String _userName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas de datos por el usuario'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [_crearEntradaNombre(), _crearEntradaPassword()],
      ),
    );
  }

  Widget _crearEntradaNombre() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
      //maxLength: 4,
      maxLines: 2,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Escriba su nombre, por favor",
        labelText: "Nombre",
        helperText: "Nombre",
        prefixIcon: const Icon(Icons.person),
        //iconColor: Colors.blueGrey),
      ),
      onChanged: (valor) {
        _userName = valor;
        print(_userName);
      },
    );
  }

  Widget _crearEntradaPassword() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
      maxLength: 6,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Escriba su contraseña, por favor",
        labelText: "Contraseña",
        helperText: "Contraseña",
        prefixIcon: const Icon(Icons.password),
        //iconColor: Colors.blueGrey),
      ),
      onChanged: (valor) {
        _userName = valor;
        print(_userName);
      },
    );
  }
}
