import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/core/constants/color.dart';
import 'package:interview_app/view/authenticate/login/login_view_model.dart';
import 'package:interview_app/view/authenticate/register/register_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                Image.asset(
                  'assets/welcome/welcome.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                SafeArea(
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox(height: 10),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                            border: Border.all(color: basarsoft_color, width: 2.0),
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: viewModel.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Giriş Yap',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w900,
                                      color: basarsoft_color,
                                    ),
                                  ),
                                  const SizedBox(height: 40.0),
                                  TextFormField(
                                    controller: viewModel.emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Lütfen bir e-posta adresi girin';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'Email',
                                      hintStyle: const TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: basarsoft_color),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: basarsoft_color),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextFormField(
                                    controller: viewModel.passwordController,
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Lütfen bir şifre girin';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Şifre',
                                      hintText: 'Şifre',
                                      hintStyle: const TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: basarsoft_color),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: basarsoft_color),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: viewModel.isLoading
                                          ? null
                                          : () => viewModel.login(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: basarsoft_color,
                                      ),
                                      child: viewModel.isLoading
                                          ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                          : const Text(
                                        'Giriş Yap',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.7,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          'Diğer Giriş Yöntemleri',
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.7,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          // Google sign-in logic
                                        },
                                        child: Image.asset('assets/images/google.png'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Henüz Bir Hesabın Yok Mu? '),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => RegisterView(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Kayıt Ol!',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: basarsoft_color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
