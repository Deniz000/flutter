import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();
  //bu key üzerinden glabol kullandığımız için form state özellikleri yakalayabiliyorum

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            //validation sağlıyor :
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print('okey');
                  }
                },
                child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? value) {
    return (value?.isNotEmpty ?? false) ? null : _validatorMessage;
  }

  String get _validatorMessage => "Bu alan boş geçilemez";
}
