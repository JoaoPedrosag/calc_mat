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
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
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
                                      MediaQuery.of(context).size.width * 0.05,
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
                                                0.3,
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
                      ? Image(
                          width: 250,
                          color: Colors.blue,
                          image: AssetImage(controller.image))
                      : Container(),
                  const SizedBox(
                    height: 18,
                  ),
                  controller.a
                      ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: CustomTextFormField(
                              labelText: controller.firstInput,
                              controller: controller.inputA,
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
                              controller: controller.inputB,
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
                              controller: controller.inputC,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        )
                      : Container(),
                  controller.selectedItem != 'Selecione uma formula'
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
                                controller.btnReset = true;
                                controller.calculateForm();
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
