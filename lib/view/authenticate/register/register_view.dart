import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/image_path_constants.dart';
import 'package:interview_app/core/extension/string_extension.dart';
import 'package:interview_app/core/localization/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/core/constants/color.dart';
import 'package:interview_app/view/authenticate/register/register_view_model.dart';
import 'package:interview_app/view/authenticate/login/login_view.dart';
import 'package:interview_app/view/authenticate/widget/custom_scaffold.dart';

class RegisterView extends StatefulWidget {

  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  EasyLocalization? easyLocalization;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, viewModel, child) {
          return CustomScaffold(
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
                              LocaleKeys.register_view_register_title.locale,
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
                                        return LocaleKeys.register_view_name_hint.locale;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: LocaleKeys.register_view_name.locale,
                                      hintText: LocaleKeys.register_view_name_hint.locale,
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
                                        return LocaleKeys.register_view_surname_hint.locale;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: LocaleKeys.register_view_surname.locale,
                                      hintText: LocaleKeys.register_view_surname_hint.locale,
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
                                  return LocaleKeys.register_view_email_hint.locale;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: LocaleKeys.register_view_email.locale,
                                hintText: LocaleKeys.register_view_email_hint.locale,
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
                                  return LocaleKeys.register_view_password_hint.locale;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: LocaleKeys.register_view_password.locale,
                                hintText: LocaleKeys.register_view_password_hint.locale,
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
                                 Text(
                                  LocaleKeys.register_view_user_agreement.locale,
                                  style: TextStyle(color: Colors.black45),
                                ),
                                Text(
                                  LocaleKeys.register_view_user_agreement_accept.locale,
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
                                  backgroundColor: basarsoft_color,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child:  Text(
                                  LocaleKeys.register_view_register_button.locale,
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
                                 Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                  child: Text(
                                    LocaleKeys.register_view_another_register_method.locale,
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
                                  child: Image.asset(ImagePathConstants.googleLogo),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  LocaleKeys.register_view_already_have_account.locale,
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
                                    LocaleKeys.register_view_login.locale,
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
          );
        },
      ),
    );
  }
}
