import 'package:book_voices/features/Authentication/presentation/manager/cubit/auth_cubit.dart';
import 'package:book_voices/features/Authentication/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKeyRegister = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKeyRegister,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your password' : null,
              ),
              SizedBox(height: 20),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccessRegister) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration Successful!')),
                    );
                    Navigator.pop(context);
                  } else if (state is AuthFailedRegister) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.massage)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingRegister) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKeyRegister.currentState!.validate()) {
                        final email = _emailController.text.trim();
                        final password = _passwordController.text.trim();
                        context.read<AuthCubit>().makeRegister(email, password);
                      }
                    },
                    child: Text('Register'),
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
