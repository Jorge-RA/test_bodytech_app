import 'package:bodytech_test_app/providers/forms_provider.dart';
import 'package:bodytech_test_app/services/auth_services.dart';
import 'package:bodytech_test_app/widgets/showSnackBar.dart';
import 'package:bodytech_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final keyForm = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormsProvider>(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: customAppBar(),
        body: Stack(
          children: [
            //ImgLogin(),
            const BackColor(),
            SingleChildScrollView(
              child: Container(
                child: Form(
                  key: keyForm,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.05),
                      const RegisterText(),
                      SizedBox(height: size.height * 0.1),
                      CustomTextFormField(
                        labelText: 'Email',
                        icon: Icons.email_outlined,
                        onChanged: (value) {
                          formProvider.registerForm['email'] = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      CustomTextFormField(
                        labelText: 'Telefono',
                        icon: Icons.phone_android,
                        onChanged: (value) {
                          formProvider.registerForm['phone'] = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      CustomTextFormField(
                        labelText: 'Contraseña',
                        icon: Icons.password,
                        isPsw: true,
                        onChanged: (value) {
                          formProvider.registerForm['password'] = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      CustomTextFormField(
                        labelText: 'Repita Contraseña',
                        icon: Icons.password,
                        isPsw: true,
                        onChanged: (value) {
                          formProvider.registerForm['repeat_password'] = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      CustomButton(
                        text: 'Crear cuenta',
                        onPressed: () async {
                          if (formProvider.registerForm['password'] !=
                              formProvider.registerForm['repeat_password']) {
                            showSnackBar(
                              context: context,
                              text: 'Las contraseñas no son iguales',
                            );
                            return;
                          }
                          if (keyForm.currentState!.validate()) {
                            formProvider.isLoading = true;
                            final response = await AuthServices.createAccount(
                              formProvider.registerForm['email']!,
                              formProvider.registerForm['password']!,
                            );
                            formProvider.isLoading = false;
                            if (response == null) {
                              Navigator.of(context)
                                  .pushReplacementNamed('home');
                            } else {
                              showSnackBar(context: context, text: response);
                            }
                          }
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      const TextLoginLogout(
                        text: 'Ya tengo una cuenta.',
                        routeName: 'login',
                      ),
                      SizedBox(height: size.height * 0.15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterText extends StatelessWidget {
  const RegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Registrar',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 250, 235, 229),
      ),
    );
  }
}
