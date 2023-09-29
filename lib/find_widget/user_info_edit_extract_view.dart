import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.abc_outlined, size: 30),
                    const SizedBox(width: 8),
                    Expanded(
                        child: TextFormField(
                            decoration:
                            const InputDecoration(label: Text("Name")))),
                    const SizedBox(width: 8),
                    const EditNameSubmitButton(),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.signpost, size: 30),
                    const SizedBox(width: 8),
                    Expanded(
                        child: TextFormField(
                            decoration:
                            const InputDecoration(label: Text("Address")))),
                    const SizedBox(width: 8),
                    const EditAddressSubmitButton(),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class EditNameSubmitButton extends StatelessWidget {
  const EditNameSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showSuccess(context),
      child: const Text("Submit"),
    );
  }

  void _showSuccess(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("更新成功")));
  }
}

class EditAddressSubmitButton extends StatelessWidget {
  const EditAddressSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showSuccess(context),
      child: const Text("Submit"),
    );
  }

  void _showSuccess(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("更新成功")));
  }
}
