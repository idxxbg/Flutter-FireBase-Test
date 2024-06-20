part of '../../main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernamController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    double screenHeight = MediaQuery.of(context).size.height;

    bool isLoading = false;

    void despose() {
      super.dispose();
      emailController.dispose();
      usernamController.dispose();
      passController.dispose();
    }

    void signUpUser() async {
      String res = await AuthSevices().signUpUser(
        email: emailController.text,
        username: usernamController.text,
        password: passController.text,
      );
      // if success, user has been navigate to next page
      // otherwise show the error message
      if (res == 'success') {
        setState(() {});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, res);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
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
                textEditingController: usernamController,
                icon: Icons.person,
                inputType: TextInputType.multiline,
              ),
              TextFieldInput(
                hintText: 'Email',
                textEditingController: emailController,
                icon: Icons.mail,
                inputType: TextInputType.multiline,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textEditingController: passController,
                icon: Icons.lock,
                isPass: true,
                sufficon: Icons.key,
                inputType: TextInputType.multiline,
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //   child: Align(
              //       alignment: Alignment.centerRight,
              //       child: Text(
              //         'Forget Password?',
              //         style: TextStyle(
              //             fontSize: 16,
              //             color: Colors.blue,
              //             fontWeight: FontWeight.bold),
              //       )),
              // ),
              MyButton(
                  text: 'Đăng ký',
                  ontap: () {
                    HapticFeedback.lightImpact();
                    signUpUser();
                  }),
              SizedBox(
                height: screenHeight / 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Đã có tài khoản, ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                    },
                    child: const Text(
                      'Đăng nhập',
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
