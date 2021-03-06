import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class BodyWidget extends StatelessWidget {

  _textField({String labelText, onChanged, String Function() erroText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: erroText == null ? null : erroText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (_) {
              return _textField(
                  erroText: controller.validateName,
                  labelText: "name",
                  onChanged: controller.client.changeName);
            }),
            SizedBox(height: 20,),
            Observer(builder: (_) {
              return _textField(
                  erroText: controller.validateEmail,
                  labelText: "email",
                  onChanged: controller.client.changeEmail);
            }),
            SizedBox(height: 20,),
            Observer(builder: (_){
              return RaisedButton(onPressed: controller.isValid ? (){} : null, child: Text("Salvar"),);
            }),
          ],
        ),
      ),
    );
  }
}
