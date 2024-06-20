import 'package:flutter/material.dart';
import 'package:flutter_stack_app/login_screen/services/authentication.dart';

class ChatPage extends StatelessWidget {
  final String name;
  const ChatPage({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        actions: [
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text('Bạn có chắc muốn out không?'),
                      title: const Text('Sign Out'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              AuthSevices().signOut();
                            },
                            child: const Text('Ok'))
                      ],
                    );
                  });
            },
            color: Colors.blue,
            textColor: Colors.white54,
            child: const Text('Sign Up'),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          children: [Text('data')],
        ),
      ),
    );
  }
}
