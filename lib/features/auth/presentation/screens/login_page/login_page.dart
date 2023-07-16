import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test_app/features/auth/data/models/auth_model.dart';
import 'package:test_app/features/auth/presentation/logic/bloc/auth_bloc.dart';
import 'package:test_app/features/home/presentation/screens/home_page.dart';
import 'package:test_app/internal/dependencies/get_it.dart';
import 'package:test_app/internal/helpers/utils.dart';

import '../../widgets/custom_textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  late AuthBloc bloc;

  @override
  void initState() {
    bloc = getIt<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30).r,
        child: Column(
          children: [
            SizedBox(height: 60.h),
            CustomTextField(
              key: const Key('first'),
              title: 'Email:',
              controller: emailController,
            ),
            CustomTextField(
              key: const Key('second'),
              title: 'Password:',
              controller: passwordController,
            ),
            BlocListener<AuthBloc, AuthState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is LoginFetched) {
                  customNavigatorPushAndRemove(context, const HomePage());
                }
              },
              child: ElevatedButton(
                key: Key('first'),
                onPressed: () {
                  bloc.add(GetLoginEvent(
                    authModel: AuthModel(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  ));
                },
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
