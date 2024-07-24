import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/core/constants/color.dart';
import 'package:interview_app/view/authenticate/register/register_view_model.dart';
import 'package:interview_app/view/authenticate/login/login_view.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
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
                                    'Kayıt Formu',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w900,
                                      color: basarsoft_color,
                                    ),
                                  ),
                                  const SizedBox(height: 40.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: viewModel.firstNameController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Ad Giriniz';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Ad',
                                            hintText: 'Adınızı Giriniz',
                                            hintStyle: const TextStyle(color: Colors.black26),
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
                                      ),
                                      const SizedBox(width: 20.0),
                                      Expanded(
                                        child: TextFormField(
                                          controller: viewModel.lastNameController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Soyad Giriniz';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Soyad',
                                            hintText: 'Soyadınızı Giriniz',
                                            hintStyle: const TextStyle(color: Colors.black26),
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
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextFormField(
                                    controller: viewModel.emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email Adresi Giriniz';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'Email Adresi Giriniz',
                                      hintStyle: const TextStyle(color: Colors.black26),
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
                                        return 'Şifre Giriniz';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Şifre',
                                      hintText: 'Şifre Giriniz',
                                      hintStyle: const TextStyle(color: Colors.black26),
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
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: viewModel.agreePersonalData,
                                        onChanged: (bool? value) {
                                          viewModel.toggleAgreePersonalData(value!);
                                        },
                                        activeColor: basarsoft_color,
                                      ),
                                      const Text(
                                        'Bilgilerimin işlenmesini  ',
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                      Text(
                                        'Kabul Ediyorum.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: basarsoft_color,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15.0),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () => viewModel.handleSignUp(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: basarsoft_color, // Background color
                                        padding: const EdgeInsets.symmetric(vertical: 10.0), // Adjust padding as needed
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0), // Rounded corners
                                        ),
                                      ),
                                      child: const Text(
                                        'Kayıt Ol',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.7,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                        child: Text(
                                          'Diğer Kayıt Yöntemleri',
                                          style: TextStyle(color: Colors.black45),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.7,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          // Implement Google sign-in logic here
                                        },
                                        child: Image.asset('assets/images/google.png'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Zaten Bir Hesabın Var Mı? ',
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginView(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Giriş Yap',
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
