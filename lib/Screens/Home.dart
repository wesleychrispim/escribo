import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _numeroController = TextEditingController();
  int _resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Escribo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Insira um número:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _numeroController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Número',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int numero = int.tryParse(_numeroController.text) ?? 0;
                setState(() {
                  _resultado = calcularSomatorio(numero);
                });
                mostrarResultado(context, _resultado);
              },
              child: Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }

  int calcularSomatorio(int numero) {
    int resultado = 0;

    for (int i = 1; i < numero; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        resultado += i;
      }
    }

    return resultado;
  }

  void mostrarResultado(BuildContext context, int resultado) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado'),
          content: Text('O somatório é: $resultado'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _numeroController.dispose();
    super.dispose();
  }
}
