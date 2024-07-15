import 'dart:io';
import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/utils/images_mapping.dart';
import 'package:event_spotter/widgets/image_loader.dart';
import 'package:event_spotter/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:event_spotter/firebase-actions/firebase_actions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  bool _isLogin = true;
  String _enteredEmail = '';
  String _enteredName = '';
  String _enterdPassword = '';
  String _enteredUsername = '';
  File? _userImage;
  bool _isAuthenticating = false;

  void _submitForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid || (!_isLogin && _userImage == null)) {
      // show form error
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        final userData =
            await FirebaseHelper().loginUser(_enteredEmail, _enterdPassword);
        final userDetails =
            await FirebaseHelper().getUserDetailsByEmail(userData.user!.email!);
        final screenToRedirect = getRedirectionScreenName(userDetails);

        setState(() {
          _isAuthenticating = false;
        });
        if (mounted) {
          context.go(screenToRedirect);
        }
      } else {
        FirebaseHelper().createUser(_enteredEmail, _enteredName,
            _enterdPassword, _enteredUsername, _userImage!);
        setState(() {
          _isAuthenticating = false;
        });
        context.go(selectCityScreen);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
            child: Stack(
      alignment: Alignment.center,
      children: [
        loadImage(imgAuthBg, fit: BoxFit.cover),
        Stack(
          alignment: Alignment.center,
          children: [
            Card(
              color: Colors.white60,
              shadowColor: Colors.white,
              child: Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!_isLogin)
                        UserImagePicker(
                            onImageSelect: (image) => setState(() {
                                  _userImage = image;
                                })),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: ValidationBuilder()
                            .required('Email is required')
                            .email('Entered email is not valid')
                            .maxLength(50, 'Maximum 50 characters allowed')
                            .build(),
                        onSaved: (value) {
                          _enteredEmail = value!;
                        },
                      ),
                      if (!_isLogin)
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Name'),
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          enableSuggestions: false,
                          textCapitalization: TextCapitalization.none,
                          validator: ValidationBuilder()
                              .required('Name is required')
                              .minLength(
                                  5, 'Should contain more than 5 characters')
                              .build(),
                          onSaved: (value) {
                            _enteredName = value!;
                          },
                        ),
                      if (!_isLogin)
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          enableSuggestions: false,
                          textCapitalization: TextCapitalization.none,
                          validator: ValidationBuilder()
                              .regExp(RegExp(r'^[a-zA-Z0-9]+$'),
                                  'Should not contain special characters')
                              .required('Username is required')
                              .minLength(
                                  5, 'Should contain more than 5 characters')
                              .build(),
                          onSaved: (value) {
                            _enteredUsername = value!;
                          },
                        ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        autocorrect: false,
                        validator: ValidationBuilder(
                                requiredMessage: 'Password is required')
                            .required()
                            .minLength(
                                5, 'Should contain more than 5 characters')
                            .build(),
                        onSaved: (value) {
                          setState(() {
                            _enterdPassword = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (_isAuthenticating) const CircularProgressIndicator(),
                      if (!_isAuthenticating)
                        ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                            child: Text(_isLogin ? 'Login' : 'Signup')),
                      if (!_isAuthenticating)
                        TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? "Don't have account? Register here"
                                : 'Already regitered? Login here'))
                    ],
                  ).paddingOnly(top: 20, right: 12, bottom: 4, left: 12)),
            )
          ],
        ).paddingOnly(left: 16, right: 16),
      ],
    )));
  }
}
