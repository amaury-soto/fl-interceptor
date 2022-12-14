import 'package:flutter/material.dart';
import 'package:flutter_interceptor/services/services.dart';
import 'package:flutter_interceptor/widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      "user": "",
      "password": "",
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'User',
                  hintText: 'user',
                  //icon: Icons.abc,
                  helperText: 'Digita tu nombre',
                  prefixIcon: Icons.abc_outlined,
                  //suffixIcon: Icons.access_alarm,
                  formProperty: 'user',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Password',
                  //icon: Icons.abc,
                  helperText: 'Digita tu password',
                  prefixIcon: Icons.password,
                  suffixIcon: Icons.password,
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                  //keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Login'))),
                    onPressed: () {
                      // FocusScope.of(context).requestFocus(FocusNode());
                      //FocusScope.of(context).unfocus();
                      if (!myFormKey.currentState!.validate()) {
                        print('Form no válido');
                        return;
                      }
                      final userServices = UserServices();
                      userServices.login(formValues);
                      print(formValues);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
