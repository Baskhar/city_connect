import 'package:city_connect/app/common_widgets/seta_back.dart';
import 'package:city_connect/app/data/http/http_cliente.dart';
import 'package:city_connect/app/data/repositories/auth_repository.dart';
import 'package:city_connect/app/modules/auth/login/login_store.dart';
import 'package:city_connect/app/modules/auth/login/widgets/custom_text_form_field_login.dart';
import 'package:city_connect/app/modules/auth/register/register_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../common_widgets/custom_load_button.dart';
import '../../../../common_widgets/login/my_container_login_custom.dart';
import '../../../../constants/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final store = RegisterStore(repository: AuthRepository(cliente: HttpCliente()));

  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8.0),
                  child: SetaBack(),
                ),
                Spacer(),
                Container(
                  height: 400,
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
                          controller: _nomeController,
                          hint: 'Nome',
                          validatorMessage: 'Nome obrigatório',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormFieldLogin(
                          controller: _emailController,
                          hint: 'E-mail',
                          validatorMessage: 'E-mail obrigatório',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormFieldLogin(
                          controller: _senhaController,
                          hint: 'Senha',
                          validatorMessage: 'Senha obrigatória',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormFieldLogin(
                          controller: _confirmarSenhaController,
                          hint: 'Repita a senha',
                          validatorMessage: 'Senha obrigatória',
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
                      title: 'Registrar',
                      height: 50,
                      buttonColor: AppColors.white,
                      width: largura,
                      loading: store.loading,
                      textColor: AppColors.cyan,
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          _handleLogin();
                          FocusScope.of(context).unfocus();
                        }
                      },
                    );
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    // Modular.to.pushReplacementNamed('/home/');
  }
  //   print(_email.text);
  //   await store.loginWithEmailAndPassword(_email.text, _senha.text);
  //   if (store.loginError) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Erro ao fazer login'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   } else if (store.loginSucess == true) {
  //     Modular.to.pushReplacementNamed('/home/');
  //   }
  // }
}
