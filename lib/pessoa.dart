import 'dart:math';

class Pessoa {
  final double peso;
  final double altura;
  late double imc;
  late String status;
  Pessoa(this.peso, this.altura);

  void calculaImc() {
    this.imc = this.peso / pow(this.altura, 2);
  }

  void selectStatus() {
    this.calculaImc();
    if (imc < 16) {
      this.status = "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      this.status = "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      this.status = "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      this.status = "Saudável";
    } else if (imc >= 25 && imc < 30) {
      this.status = "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      this.status = "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      this.status = "Obesidade Grau II (severa)";
    } else {
      this.status = "Obesidade Grau III (mórbida)";
    }
  }
}
