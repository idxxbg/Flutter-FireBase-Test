import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stack_app/login_screen/services/authentication.dart';
import 'package:flutter_stack_app/main.dart';
import 'package:gap/gap.dart';

part 'display_chat.dart';

class ChatPage extends StatefulWidget {
  final String name;
  const ChatPage({
    super.key,
    required this.name,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        actions: [
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              // AuthSevices().signOut();

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text('Bạn có chắc muốn out không?'),
                    title: const Text('Sign Out'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            AuthSevices().signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ));
                          },
                          child: const Text('Ok'))
                    ],
                  );
                },
              );
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('Sign Out'),
          ),
          const Gap(10),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const Text(
              //   'Messenger',
              //   style: TextStyle(
              //     fontSize: 35,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black87,
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: DisplayChat(name: widget.name),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: messageController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.pinkAccent,
                            ),
                            hintText: 'Message ...',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                          ),
                          validator: (value) {
                            return null;
                          },
                          onSaved: (value) {
                            messageController.text = value!;
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (messageController.text.isNotEmpty) {
                            firestore.collection('Message').doc().set(
                              {
                                'message': messageController.text
                                    .trim(), // trim xử lý nếu chuỗi cso khoảng trắng ở đầu và cuối và trả về chuỗi ko có ktr đầu và cuối
                                'time': DateTime.now(),
                                'name': widget.name,
                              },
                            );
                            messageController.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.send_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
