import 'package:mobx/mobx.dart';
part 'controller_calc.g.dart';

class CalcController = _CalcController with _$CalcController;

abstract class _CalcController with Store {
  @observable
  String image = '';

  @observable
  String volumeController = '';

  final List<String> items = [
    'Prisma',
    'Cilindro',
    'Cone',
    'Pirâmide',
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
    firstInput = 'Valor de r';
    secondInput = 'Valor da altura';
    thirdInput = 'Valor de C';
  }

  @action
  void changeCone() {
    a = true;
    b = true;
    c = false;
    firstInput = 'Valor de r';
    secondInput = 'Valor da altura';
    thirdInput = '';
  }

  @action
  void changePiramide() {
    a = true;
    b = true;
    c = true;
    firstInput = 'Valor de b';
    secondInput = 'Valor do c';
    thirdInput = 'Valor da altura';
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
    } else if (selectedItem == 'Cilindro') {
      image = 'assets/cilindro.png';
      changeCilindro();
    } else if (selectedItem == 'Cone') {
      image = 'assets/cone.png';
    } else if (selectedItem == 'Pirâmide') {
      image = 'assets/piramide.png';
      changePiramide();
    }
  }

  @action
  void calculateCilindro(altura, raio) {
    print([altura, raio]);
    double volume = pi * (raio * raio) * altura;
    volumeController = volume.toStringAsFixed(2);
    print(volumeController);
  }
}
