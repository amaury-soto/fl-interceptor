import 'package:flutter/material.dart';
import 'package:flutter_interceptor/services/services.dart';
import 'package:flutter_interceptor/widgets/widgets.dart';

import '../storage/token_storage.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      "user": "",
      "email": "",
      "password": "",
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                  helperText: 'Type your user',
                  prefixIcon: Icons.add_moderator_outlined,
                  suffixIcon: Icons.add_moderator_outlined,
                  formProperty: 'user',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'email',
                  //icon: Icons.abc,
                  helperText: 'Type your email',
                  prefixIcon: Icons.mail,
                  suffixIcon: Icons.mail,
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Password',
                  //icon: Icons.abc,
                  helperText: 'Type your password',
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
                        child: Center(child: Text('Register'))),
                    onPressed: () {
                      // FocusScope.of(context).requestFocus(FocusNode());
                      //FocusScope.of(context).unfocus();
                      if (!myFormKey.currentState!.validate()) {
                        print('Form no válido');
                        return;
                      }
                      final userServices = UserServices();
                      userServices.register(formValues, context);
                      //Navigator.pushNamed(context, 'register');
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
