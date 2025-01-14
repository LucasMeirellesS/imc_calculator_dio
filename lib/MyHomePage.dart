import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_calculator/pessoa.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textPesoController = TextEditingController(text: '');

  TextEditingController textAlturaController = TextEditingController(text: '');

  var list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Digite o seu peso:',
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: textPesoController,
              onChanged: (value) {
                setState(() {
                  textPesoController.text = value;
                });
              },
            ),
            const Text(
              'Digite o sua altura:',
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: textAlturaController,
              onChanged: (value) {
                setState(() {
                  textAlturaController.text = value;
                });
              },
            ),
            Center(
                child: TextButton(
                    onPressed: () {
                      Pessoa pessoa = Pessoa(
                          double.parse(textPesoController.text),
                          double.parse(textAlturaController.text));
                      pessoa.selectStatus();

                      Map<double, String> data = {pessoa.imc: pessoa.status};

                      setState(() {
                        list.add(data);
                      });
                    },
                    child: Text('Calcular'))),
            list.length > 0
                ? Column(
                    children: list
                        .map((data) => Text(
                            'Valor: ${data.keys.first}, Status: ${data.values.first}'))
                        .toList(),
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
