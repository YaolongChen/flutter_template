import 'package:flutter/material.dart';

import '../../core/theme/dimens.dart';
import '../view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _accountController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController();
    _passwordController = TextEditingController();
    widget.viewModel.login.addListener(_onLoginResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewModel != oldWidget.viewModel) {
      oldWidget.viewModel.login.removeListener(_onLoginResult);
      widget.viewModel.login.addListener(_onLoginResult);
    }
  }

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginResult() {
    if (widget.viewModel.login.error) {
      widget.viewModel.login.clearResult();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: dimens.screenPadding,
        child: ListenableBuilder(
          listenable: widget.viewModel.login,
          builder: (context, _) {
            final loading = widget.viewModel.login.running;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                TextField(
                  enabled: !loading,
                  controller: _accountController,
                  decoration: InputDecoration(labelText: 'Account'),
                ),
                TextField(
                  enabled: !loading,
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: loading
                      ? null
                      : () {
                          widget.viewModel.login.execute((
                            _accountController.text,
                            _passwordController.text,
                          ));
                        },
                  child: loading
                      ? SizedBox.square(
                          dimension: 24,
                          child: CircularProgressIndicator(),
                        )
                      : Text('Login'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
