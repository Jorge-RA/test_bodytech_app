import 'package:bodytech_test_app/providers/forms_provider.dart';
import 'package:bodytech_test_app/services/auth_services.dart';
import 'package:bodytech_test_app/widgets/showSnackBar.dart';
import 'package:bodytech_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final keyForm = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formProvider = Provider.of<FormsProvider>(context);

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
                      SizedBox(height: size.height * 0.15),
                      const SingInText(),
                      SizedBox(height: size.height * 0.1),
                      CustomTextFormField(
                        labelText: 'Email',
                        icon: Icons.email_outlined,
                        onChanged: (value) {
                          formProvider.loginForm['email'] = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      CustomTextFormField(
                        labelText: 'Password',
                        icon: Icons.password,
                        isPsw: true,
                        onChanged: (value) {
                          formProvider.loginForm['password'] = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      CustomButton(
                        text: 'Ingresar',
                        onPressed: () async {
                          if (keyForm.currentState!.validate()) {
                            formProvider.isLoading = true;
                            final response = await AuthServices.authLogin(
                              formProvider.loginForm['email']!,
                              formProvider.loginForm['password']!,
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
                        text: '¿No tienes cuenta? Créate una',
                        routeName: 'register',
                      )
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

class SingInText extends StatelessWidget {
  const SingInText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Ingresar',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 250, 235, 229),
      ),
    );
  }
}
