import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String _userName = '';
  String _password = '';
  String _email = '';
  String _fecha = '';
  final TextEditingController _inputFieldDateController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas de datos por el usuario'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearEntradaNombre(),
          const Divider(),
          _crearEntradaPassword(),
          const Divider(),
          _crearEntradaEmail(),
          const Divider(),
          _crearFecha(),
          const Divider(),
          _crearDropDown(),
        ],
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
      //maxLines: 2,
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

  Widget _crearEntradaEmail() {
    return TextField(
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Escriba su e-mail, por favor",
        labelText: "E-mail",
        helperText: "E-mail",
        prefixIcon: const Icon(Icons.email),
        //iconColor: Colors.blueGrey),
      ),
      onChanged: (valor) {
        _email = valor;
        print(_email);
      },
    );
  }

  _crearEntradaPassword() {
    return TextField(
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
      obscureText: true,
      maxLength: 6,
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
        _password = valor;
        print(_password);
      },
    );
  }

  _crearFecha() {
    return TextField(
      controller: _inputFieldDateController,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Escriba su fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        prefixIcon: const Icon(Icons.date_range),
        //iconColor: Colors.blueGrey),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2024));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _fecha = DateFormat('dd-MM-yyyy').format(picked);
        _inputFieldDateController.text = _fecha; //muestra la fecha en textfield
      });
    }
  }

  Widget _crearDropDown() {
    return DropdownButton(items: getOptionsDropDown(), onChanged: (opt) {});
  }

  List<DropdownMenuItem<String>> getOptionsDropDown() {
    List<String> _lenguajes = ['Java', 'PHP', 'Dart'];
    List<DropdownMenuItem<String>> lista = List();
    _lenguajes.forEach((lenguaje) {
      lista.add(DropdownMenuItem(
        child: Text(lenguaje),
        value: lenguaje,
      ));
    });
    return lista;
  }
}
