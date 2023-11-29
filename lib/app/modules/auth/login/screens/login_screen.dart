import 'package:city_connect/app/data/http/http_cliente.dart';
import 'package:city_connect/app/data/models/auth_model/login_model.dart';
import 'package:city_connect/app/data/repositories/auth_repository.dart';
import 'package:city_connect/app/data/repositories/home_repository.dart';
import 'package:city_connect/app/data/token/token.dart';
import 'package:city_connect/app/modules/auth/login/login_store.dart';
import 'package:city_connect/app/modules/home/screens/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../common_widgets/custom_load_button.dart';
import '../../../../common_widgets/login/my_container_login_custom.dart';
import '../../../../constants/app_colors.dart';
import '../widgets/custom_text_form_field_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _senha.dispose();
  }

  final store = LoginStore(repository: AuthRepository(cliente: HttpCliente()));

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: MyContainerLoginCustom(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: AppColors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormFieldLogin(
                          controller: _email,
                          hint: 'E-mail',
                          validatorMessage: 'E-mail obrigatório',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormFieldLogin(
                          obscureText: true,
                          controller: _senha,
                          hint: 'Senha',
                          validatorMessage: 'Senha obrigatória',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {
                                Modular.to.pushNamed('/register/');
                              },
                              child: Text(
                                'Não possue cadastro?',
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
                // CustomLoadButton(
                //   title: 'Entrar com o google',
                //   height: 50,
                //   buttonColor: AppColors.white,
                //   width: largura * 0.50,
                //   loading: false,
                //   textColor: Colors.cyan,
                //   onClick: _signInWithGoogle,
                // ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return CustomLoadButton(
                      title: 'Login',
                      height: 50,
                      buttonColor: AppColors.white,
                      width: largura,
                      loading: store.loading,
                      textColor: AppColors.cyan,
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          _handleLogin(email: _email.text, senha: _senha.text);
                          FocusScope.of(context).unfocus();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin({required email, required senha}) async {
    LoginModel loginModel = LoginModel(
      email: _email.text,
      password: _senha.text,
    );
    print(_email.text);

    try {
      await store.login(login: loginModel);

      if (store.loginSucess) {
        _email.clear();
        _senha.clear();
        Modular.to.pushReplacementNamed('/home/');
      } else if (store.loginError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao fazer login'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Trate qualquer exceção que possa ocorrer durante o login
      print('Erro durante o login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao fazer login'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
