import 'package:book_voices/features/Authentication/presentation/manager/cubit/auth_cubit.dart';
import 'package:book_voices/features/Authentication/presentation/pages/resgister_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your password' : null,
              ),
              SizedBox(height: 20),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccessLogin) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login Successful!')),
                    );
                  } else if (state is AuthFailedLogin) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.massage)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingLogin) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            context
                                .read<AuthCubit>()
                                .makeLogin(email, password);
                          }
                        },
                        child: Text('Login'),
                      ),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage())),
                          child: Text("register"))
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
