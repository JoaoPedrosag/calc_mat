import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:matapp/src/modules/calc/controller_calc.dart';
import 'package:matapp/src/utils/textFormfield/textFormField.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<CalcController>();
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? selectItems;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Observer(
            builder: (_) => Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              spreadRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Row(
                              children: [
                                const Icon(
                                  Icons.list,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                                Text(
                                  controller.selectedItem,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              ],
                            ),
                            items: controller.items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                          ),
                                          Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                            value: selectItems,
                            onChanged: (value) {
                              controller.changeSelectedItem(value.toString());
                              controller.changeImage(value.toString());
                            },
                            buttonHeight: 10,
                            buttonWidth: 140,
                            itemHeight: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(controller.volumeController)],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  controller.selectedItem != 'Selecione uma formula'
                      ? Image(width: 300, image: AssetImage(controller.image))
                      : Container(),
                  controller.a
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: CustomTextFormField(
                              labelText: controller.firstInput,
                              controller: a,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        )
                      : Container(),
                  controller.b
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: CustomTextFormField(
                              labelText: controller.secondInput,
                              controller: b,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        )
                      : Container(),
                  controller.c
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: CustomTextFormField(
                              labelText: controller.thirdInput,
                              controller: c,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        )
                      : Container(),
                  a.text.isNotEmpty && b.text.isNotEmpty
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.btnCal = true;
                                controller.btnReset = true;
                                controller.calculateCilindro(
                                    double.parse(a.text), double.parse(b.text));
                              }
                            },
                            child: const Text('Calcular'),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  controller.btnReset
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            onPressed: () {
                              a.clear();
                              b.clear();
                              c.clear();
                              controller.resetVariables();
                            },
                            child: const Text('Limpar'),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
