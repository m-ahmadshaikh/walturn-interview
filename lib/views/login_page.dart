import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/modelviews/authentication.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var authProvider = ref.watch(authenticationProvider);
    return authProvider.when(
        error: ((error, stackTrace) =>
            Scaffold(body: Center(child: Text(error.toString())))),
        loading: () => const Center(
              child: Scaffold(body: Center(child: CircularProgressIndicator())),
            ),
        data: ((data) => Scaffold(
              appBar: AppBar(
                title: const Text('Login Page'),
              ),
              body: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                          width: 400,
                          child: Center(
                              child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Email',
                                border: OutlineInputBorder()),
                          ))),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 400,
                          child: Center(
                              child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Password',
                                border: OutlineInputBorder()),
                          ))),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                          child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final authProvider =
                                ref.read(authenticationProvider.notifier);
                            await authProvider.signInWithUserNameAndPassword(
                                _emailController.text, _passwordController.text);
                          }
                        },
                        child: const Text('Submit'),
                      )),
                      data.email != null
                          ? Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                      child: Text('Name:  ${data.name}',
                                          style:
                                              const TextStyle(fontSize: 18))),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                      child: Text('Email:  ${data.email}',
                                          style:
                                              const TextStyle(fontSize: 18))),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                      child: Text('Created At:  ${data.createdAt}',
                                          style:
                                              const TextStyle(fontSize: 18))),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                      child: Text('Age:   ${data.age}',
                                          style: const TextStyle(fontSize: 18)))
                                ],
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            )));
  }
}
