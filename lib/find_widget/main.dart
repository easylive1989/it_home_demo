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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              UserInfoTextField(
                icon: Icons.abc_outlined,
                label: "Name",
              ),
              UserInfoTextField(
                icon: Icons.signpost,
                label: "Address",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoTextField extends StatefulWidget {
  const UserInfoTextField({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  State<UserInfoTextField> createState() => _UserInfoTextFieldState();
}

class _UserInfoTextFieldState extends State<UserInfoTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(widget.icon, size: 30),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: _controller,
            decoration: InputDecoration(label: Text(widget.label)),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
            onPressed: () => _showSuccess(context),
            child: const Text("Submit"))
      ],
    );
  }

  void _showSuccess(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Update Success")));
  }
}