part of '../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text(
                'CONGRUATULATION\nBạn đã đăng nhập thành công',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            MyButton(
                text: 'Đăng xuất',
                ontap: () {
                  HapticFeedback.lightImpact();
                  AuthSevices().signOut();
                })
          ],
        ),
      ),
    );
  }
}
