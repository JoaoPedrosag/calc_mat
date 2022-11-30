import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'controller_calc.g.dart';

class CalcController = _CalcController with _$CalcController;

abstract class _CalcController with Store {
  @observable
  String image = '';

  @observable
  String imageHelp = '';

  @observable
  String volumeController = '';

  final List<String> items = [
    // 'Prisma',
    'Cilindro Reto',
    'Cone',
    'Pirâmide Triangular',
  ];

  final pi = 3.14;

  @observable
  bool a = false;
  @observable
  bool b = false;
  @observable
  bool c = false;

  @observable
  bool btnCal = false;

  @observable
  bool btnReset = false;

  @observable
  String firstInput = '';
  @observable
  String secondInput = '';
  @observable
  String thirdInput = '';

  @observable
  String selectedItem = 'Selecione uma formula';

  final inputA = TextEditingController();
  final inputB = TextEditingController();
  final inputC = TextEditingController();

  @action
  void resetVariables() {
    selectedItem = 'Selecione uma formula';
    image = '';
    volumeController = '';
    btnCal = false;
    btnReset = false;
    a = false;
    b = false;
    c = false;
    inputA.clear();
    inputB.clear();
    inputC.clear();
  }

  @action
  void changePrisma() {
    a = true;
    b = true;
    c = true;
    firstInput = 'Valor de A';
    secondInput = 'Valor de B';
    thirdInput = 'Valor de C';
  }

  @action
  void changeCilindro() {
    a = true;
    b = true;
    c = false;
    firstInput = 'Valor do raio';
    secondInput = 'Valor da altura';
    thirdInput = '';
  }

  @action
  void changeCone() {
    a = true;
    b = true;
    c = false;
    firstInput = 'Valor do raio';
    secondInput = 'Valor da altura';
    thirdInput = '';
  }

  @action
  void changePiramide() {
    a = true;
    b = true;
    c = false;
    firstInput = 'Base da pirâmide';
    secondInput = 'Altura da pirâmide';
    thirdInput = '';
  }

  @action
  void changeSelectedItem(String value) {
    selectedItem = value;
  }

  @action
  void changeImage(String value) {
    if (selectedItem == 'Prisma') {
      image = 'assets/prisma.png';
      changePrisma();
    } else if (selectedItem == 'Cilindro Reto') {
      image = 'assets/cilindro.png';
      imageHelp = 'assets/explicacao_cilindro.png';
      changeCilindro();
    } else if (selectedItem == 'Cone') {
      changeCone();
      imageHelp = 'assets/explicacao_cone.png';
      image = 'assets/cone.png';
    } else if (selectedItem == 'Pirâmide Triangular') {
      image = 'assets/piramide.png';
      imageHelp = 'assets/explicacao_piramide.png';
      changePiramide();
    }
  }

  @action
  void calculateCilindro(raio, altura) {
    double volume = pi * (raio * raio) * altura;
    volumeController = volume.toStringAsFixed(2);
  }

  @action
  void calculatePiramide(area, altura) {
    double volume = (area * area) * altura / 3;
    volumeController = volume.toStringAsFixed(2);
  }

  @action
  void calculateCone(pi, base, altura) {
    double volume = pi * (base * base) * altura / 3;
    volumeController = volume.toStringAsFixed(2);
  }

  void calculateForm() {
    if (selectedItem == 'Cilindro Reto') {
      calculateCilindro(double.parse(inputA.text), double.parse(inputB.text));
    } else if (selectedItem == 'Pirâmide Triangular') {
      calculatePiramide(double.parse(inputA.text), double.parse(inputB.text));
    } else if (selectedItem == 'Cone') {
      calculateCone(pi, double.parse(inputA.text), double.parse(inputB.text));
    }
  }
}
