import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_colors.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_images.dart';
import 'package:vikncodes_machine_test/ui/login_screen/presentation/provider/login_page_notifier_provider.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/presentation/sales_list_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPswdShown = false;
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // FormKey for validation

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginPageNotifierProvider);

    ref.listen(loginPageNotifierProvider, (previous, next) {
      next.maybeWhen(
        success: (data) {
          if ((data.data?.access == "") ?? false) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SalesListScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(data.message ?? "")),
            );
          }
        },
        failure: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error)),
          );
        },
        orElse: () {},
      );
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  Image.asset(ViknImages.languageIcon),
                  Text(
                    "English",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width / 4,
              ),
              const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              const Text(
                "Login to your vikn account",
                style: TextStyle(color: Colors.white),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ViknColors.borderColor),
                  ),
                  child: Column(
                    children: [
                      LoginTextField(
                        labelText: "Username",
                        controller: emailController,
                        prefixImg: ViknImages.userIcon,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null; // No error
                        },
                      ),
                      const Divider(
                        color: ViknColors.borderColor,
                      ),
                      LoginTextField(
                        labelText: "Password",
                        controller: passwordController,
                        prefixImg: ViknImages.passwordIcon,
                        isObscureText: isPswdShown,
                        suffixIcon: Icon(
                          isPswdShown
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: ViknColors.textButtonColor,
                        ),
                        suffixOnTap: () {
                          setState(() {
                            isPswdShown = !isPswdShown;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgotten Password?",
                  style: TextStyle(color: ViknColors.textButtonColor),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ref
                        .read(loginPageNotifierProvider.notifier)
                        .getLoginResData(
                            emailController.text, passwordController.text);
                  }
                },
                child: Center(
                  child: loginState.maybeWhen(
                    loading: () =>
                        const CircularProgressIndicator(color: Colors.white),
                    orElse: () => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: ViknColors.buttonColor,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.arrow_forward_outlined,
                              color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Don't have an Account?",
                style: TextStyle(color: Colors.white),
              ),
              const Text(
                "Sign up now!",
                style: TextStyle(color: ViknColors.textButtonColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  final Icon? suffixIcon;
  final String prefixImg;
  final String labelText;
  final VoidCallback? suffixOnTap;
  final bool isObscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Add a validator property

  const LoginTextField({
    super.key,
    required this.controller,
    this.suffixIcon,
    required this.prefixImg,
    this.suffixOnTap,
    this.isObscureText = false,
    this.validator,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        prefixIcon: Image.asset(prefixImg),
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: suffixOnTap,
                child: suffixIcon,
              )
            : null,
        border: InputBorder.none,
      ),
      obscureText: isObscureText,
      validator: validator, // Apply the validator to the text field
    );
  }
}
