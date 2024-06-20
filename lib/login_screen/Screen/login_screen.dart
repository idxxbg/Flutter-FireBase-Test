part of '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    double screenHeight = MediaQuery.of(context).size.height;
    late bool isLoading;

    void dispose() {
      super.dispose();
      emailController.dispose();

      passController.dispose();
    }

    void loginUser() async {
      String res = await AuthSevices().loginUser(
        email: emailController.text,
        password: passController.text,
      );
      // if success, user has been navigate to next page
      // otherwise show the error message
      if (res == 'success') {
        setState(() {
          isLoading = true;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => ChatPage(
                      name: emailController.text,
                    )));
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, res);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: screenHeight / 2.7,
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: 'lottie',
                  child: Lottie.network(
                      'https://lottie.host/b7b82f5c-e619-493d-acda-5627c3160fd3/s7cD5MxbSA.json'),
                ),
              ),
              TextFieldInput(
                hintText: 'username',
                textEditingController: emailController,
                icon: Icons.mail,
                inputType: TextInputType.multiline,
              ),
              TextFieldInput(
                hintText: 'Pass Word',
                textEditingController: passController,
                icon: Icons.key,
                isPass: true,
                inputType: TextInputType.multiline,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              MyButton(
                  text: 'Đăng nhập',
                  ontap: () {
                    HapticFeedback.lightImpact();
                    loginUser();
                  }),
              SizedBox(
                height: screenHeight / 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Không có tài khoản, ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignUp()));
                    },
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
