import 'package:flutter/material.dart';
import 'package:smtp_email/services/email_validation.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _verifyEmail() async {
    setState(() {
      _isLoading = true;
    });

    Object result = await EmailValidation.validateEmail(emailController.text);

    setState(() {
      _isLoading = false;
    });

    if (result is Widget) {
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (_) => result);
    } else {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Error'),
              content: Text(result.toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }

    emailController.clear(); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Email Verifier App'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: _isLoading ? null : _verifyEmail,
                    child: const Text('Verify'),
                  ),
                  const SizedBox(height: 20),
                  if (_isLoading)
                    const CircularProgressIndicator(
                      constraints: BoxConstraints(
                        maxWidth: 100,
                        maxHeight: 100,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
