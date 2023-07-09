// import 'package:baio/features/authentication/repository/auth_repository.dart';
import 'package:baio/features/authentication/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.read(authRepositoryProvider);

    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final passwordVisible = useState(true);
    final invalidAuth = useState(false);
    final invalidEmail = useState("");
    final invalidPassword = useState("");
    final emailController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final passwordController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    emailController.addListener(() {
      if (invalidAuth.value && emailController.text != invalidEmail.value) {
        invalidAuth.value = false;
      }
    });

    return Scaffold(
        body: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          const SizedBox(height: 150),
          Text(
            "Welcome back",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 10),
          Text(
            "Login to your account",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 60),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter email";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              errorText: invalidAuth.value ? "Invalid email or password" : null,
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: passwordVisible.value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Password",
              errorText: invalidAuth.value ? "Invalid email or password" : null,
              prefixIcon: const Icon(Icons.password_outlined),
              suffixIcon: IconButton(
                  onPressed: () {
                    passwordVisible.value = !passwordVisible.value;
                  },
                  icon: passwordVisible.value
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              var email = emailController.text;
              var passwd = passwordController.text;

              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                authRepository.authenticate(email, passwd).then((value) {
                  if (value.isRight()) {
                    invalidAuth.value = true;
                    invalidEmail.value = email;
                    invalidPassword.value = passwd;
                    return;
                  }
                });
              }
            },
            child: const Text("Login"),
          ),
        ]),
      ),
    ));
  }
}
